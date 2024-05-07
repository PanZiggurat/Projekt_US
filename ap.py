from flask import Flask, render_template,url_for,redirect, flash, request,session,jsonify
from  flask_sqlalchemy import SQLAlchemy
from sqlalchemy import and_,or_
from werkzeug.security import generate_password_hash,check_password_hash
from datetime import timedelta,datetime

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI']='mysql://root@localhost/apka'
app.config['SECRET_KEY'] = 'secret_key'
db = SQLAlchemy(app)

class Obiekt(db.Model):
    __tablename__ = 'obiekty'
    id_o = db.Column(db.Integer, primary_key=True)
    nazwa = db.Column(db.String(30))
    lokalizacja = db.Column(db.String(30))
    typ_obiektu = db.Column(db.String(20))
    cena_1 = db.Column(db.Float)
    cena_2 = db.Column(db.Float)
    mozliwosc_zaplaty = db.Column(db.String(25))
    link = db.Column(db.String(510))

class Uzytkownik(db.Model):
    __tablename__ = 'uzytkownicy'
    id_u = db.Column(db.Integer, primary_key=True)
    imie = db.Column(db.String(50))
    nazwisko = db.Column(db.String(50))
    email = db.Column(db.String(50), unique=True)
    haslo = db.Column(db.String(255))

class Rezerwacja(db.Model):
    __tablename__ = 'rezerwacje'
    id_r = db.Column(db.Integer, primary_key=True)
    data = db.Column(db.Date)
    godzina_p = db.Column(db.Time)
    godzina_z = db.Column(db.Time)
    platnosc = db.Column(db.String(25))
    status_platnosci = db.Column(db.String(20))
    id_obiektu = db.Column(db.Integer, db.ForeignKey('obiekty.id_o'))
    id_uzytkownika = db.Column(db.Integer, db.ForeignKey('uzytkownicy.id_u'))
    rodzaj_aktywnosci = db.Column(db.String(30))

    obiekt = db.relationship('Obiekt', backref='rezerwacje')


@app.route('/',methods=['POST','GET'])
    

def index():
    
   
    return render_template('index.html')

@app.route('/register',methods=['POST','GET'])
def register():
    if request.method == 'POST':
        imie = request.form['imie']
        nazwisko = request.form['nazwisko']
        email = request.form['email']
        haslo = request.form['haslo']
        rhaslo = request.form['rhaslo']
        
        # Sprawdzenie czy wszystkie pola zostały wypełnione
        if not imie or not nazwisko or not email or not haslo or not rhaslo:
            flash('Proszę wypełnić wszystkie pola.', 'danger')
            return redirect(url_for('register'))

        # Sprawdzenie poprawności adresu email
        if '@' not in email or '.' not in email:
            flash('Proszę podać poprawny adres email.', 'danger')
            return redirect(url_for('register'))
        
        # Sprawdzenie czy email już istnieje w bazie danych
        if Uzytkownik.query.filter_by(email=email).first() is not None:
            flash('Ten adres email jest już zajęty.', 'danger')
            return redirect(url_for('register', email_taken=True))
           
           

        # Sprawdzenie czy hasło i jego powtórzenie są takie same
        if haslo != rhaslo:
            flash('Hasło i jego powtórzenie nie są takie same.', 'danger')
            return redirect(url_for('register'))

        # Sprawdzenie czy hasło ma minimum 8 znaków
        if len(haslo) < 8:
            flash('Hasło musi zawierać co najmniej 8 znaków.', 'danger')
            return redirect(url_for('register'))

        # Zaszyfrowanie hasła
        hashed_password = generate_password_hash(haslo)

        # Stworzenie nowego rekordu użytkownika
        nowy_uzytkownik = Uzytkownik(imie=imie, nazwisko=nazwisko, email=email, haslo=hashed_password)
        db.session.add(nowy_uzytkownik)
        db.session.commit()

        flash('Pomyślnie zarejestrowano użytkownika.', 'success')
        return redirect(url_for('index'))
    else:
        email_taken = request.args.get('email_taken', False)
        if email_taken:
            flash('Ten adres email jest już zajęty.', 'danger')
            return render_template('register.html', email_taken=email_taken)
        else:
            
            return render_template('register.html')

@app.route('/login', methods=['POST', 'GET']) 
def login():
    invalid_login = False  # Ustawienie początkowej wartości na False

    if request.method == 'POST':
        email = request.form['email']
        password = request.form['haslo']
        user = Uzytkownik.query.filter_by(email=email).first()
        if user and check_password_hash(user.haslo, password):
            session['user_id'] = user.id_u 
            session['zalogowany'] = True  
            return render_template('indexZ.html')  
        else:
            invalid_login = True  # Ustawienie na True w przypadku nieudanego logowania
            flash('Logowanie się nie powiodło. Sprawdź email i hasło.', 'danger')
            return render_template('login.html', invalid_login=invalid_login)  # Przekazanie invalid_login do szablonu

    return render_template('login.html', invalid_login=invalid_login)

@app.route('/obiekty', methods=['POST', 'GET'])
def obiekty():
    if request.method == 'POST':
        typ_obiektu = request.form['typ_obiektu']
        if typ_obiektu == 'dowolny':
            obiekty = Obiekt.query.all()
        else:
            obiekty = Obiekt.query.filter_by(typ_obiektu=typ_obiektu).all()
    else:
        obiekty = Obiekt.query.all()
        
    if 'user_id' in session:  
        return render_template('obiektyZ.html', obiekty=obiekty)
    else:
        return render_template('obiekty.html', obiekty=obiekty)
    
@app.route('/wyloguj')   
def wyloguj():
    session.clear()  
    return redirect(url_for('index'))

@app.route('/index')
def index_page():
    if 'user_id' in session:  
        return redirect(url_for('indexZ'))
    else:
        return redirect(url_for('index'))

def get_next_7_days():
    dates = []
    today = datetime.now().date()
    for i in range(7):
        date = today + timedelta(days=i)
        dates.append(date)
    return dates


def get_reservations_for_day(date, obiekt_id):
    reservations = Rezerwacja.query.filter_by(data=date, id_obiektu=obiekt_id).order_by(Rezerwacja.godzina_p).all()
    return reservations

def get_reservations_for_week(week_offset, obiekt_id):
    today = datetime.now().date()
    start_date = today + timedelta(weeks=week_offset)
    end_date = start_date + timedelta(days=6)

    reservations = {}
    for i in range(7):
        date = start_date + timedelta(days=i)
        reservations[date] = get_reservations_for_day(date, obiekt_id)
    return reservations

@app.route('/obiekt_details/<int:id>', methods=['GET'])
def obiekt_details(id):
    obiekt = Obiekt.query.get(id)
    if obiekt:
        week_offset = request.args.get('week_offset', default=0, type=int)  
        reservations = get_reservations_for_week(week_offset, obiekt.id_o)
        
      
        session['obiekt_id'] = id
        
        if 'user_id' in session:
            return render_template('obiekt_detailsZ.html', obiekt=obiekt, reservations=reservations, week_offset=week_offset)
        else:
            return render_template('obiekt_details.html', obiekt=obiekt, reservations=reservations, week_offset=week_offset)
    else:
        flash('Nie znaleziono obiektu o podanym identyfikatorze.', 'danger')
        return redirect(url_for('index'))
    
@app.template_global()
def get_current_datetime():
    return datetime.now()

@app.template_global()
def get_timedelta(days):
    return timedelta(days=days)

def get_reserved_hours(date):
    reservations = Rezerwacja.query.filter_by(data=date).all()
    reserved_hours = [reservation.godzina_p for reservation in reservations]
    return reserved_hours


@app.route('/rezerwacja', methods=['GET'])
def rezerwacja():
    if 'user_id' not in session:
        flash('Musisz być zalogowany, aby zarezerwować termin.', 'warning')
        return redirect(url_for('login'))
    else:
        obiekt_id = session.get('obiekt_id')  # Pobierz obiekt_id z sesji
        obiekt = Obiekt.query.get(obiekt_id)

        if obiekt:
            if request.method == 'GET':
                selected_date = request.args.get('data')
                if selected_date:
                    available_hours = list(range(10, 23))
                else:
                    available_hours = list(range(10, 23))

                return render_template('rezerwacja.html', obiekt=obiekt, available_hours=available_hours, obiekt_id=obiekt_id)  # Przekazujesz obiekt_id do szablonu
            else:
                return render_template('rezerwacja.html', obiekt=obiekt, obiekt_id=obiekt_id)  # Przekazujesz obiekt_id do szablonu
        else:
            flash('Nie znaleziono obiektu o podanym identyfikatorze.', 'danger')
            return redirect(url_for('index'))
        
@app.route('/make_reservation', methods=['POST'])
def make_reservation():
    if request.method == 'POST':
        obiekt_id = session.get('obiekt_id')  
        uzytkownik_id = session['user_id']
        data = request.form['data']
        godzina_p = request.form['godzina_p'] + ":00"
        dlugosc = int(request.form['dlugosc'])
        platnosc = request.form['platnosc'].replace('_', ' ').title()
        rodzaj_aktywnosci = request.form['rodzaj_aktywnosci']
        
        godzina_p_datetime = datetime.strptime(godzina_p, '%H:%M')
        godzina_z_datetime = godzina_p_datetime + timedelta(hours=dlugosc)
        godzina_z = godzina_z_datetime.strftime('%H:%M')

        overlapping_reservation = Rezerwacja.query.filter(
            and_(
                Rezerwacja.data == data,
                Rezerwacja.id_obiektu == obiekt_id,
                or_(
                    and_(
                        Rezerwacja.godzina_p < godzina_z,
                        Rezerwacja.godzina_z > godzina_p
                    )
                )
            )
        ).first()

        if overlapping_reservation:
            flash('Wybrana godzina jest już zarezerwowana.', 'danger')
            obiekt = Obiekt.query.get(obiekt_id)  # Pobierz obiekt na podstawie obiekt_id
            available_hours = list(range(10, 23))
            return render_template('rezerwacja.html', obiekt=obiekt, available_hours=available_hours)


        status_platnosci = 'niezaplacone'
        
        nowa_rezerwacja = Rezerwacja(
            data=data,
            godzina_p=godzina_p,
            godzina_z=godzina_z,
            platnosc=platnosc,
            status_platnosci=status_platnosci,
            id_obiektu=obiekt_id,
            id_uzytkownika=uzytkownik_id,
            rodzaj_aktywnosci=rodzaj_aktywnosci
        )
        db.session.add(nowa_rezerwacja)
        db.session.commit()
        
       
        return redirect(url_for('index'))


def remove_expired_reservations():
    today = datetime.now().date()
    expired_reservations = Rezerwacja.query.filter(Rezerwacja.data < today).all()
    for reservation in expired_reservations:
        db.session.delete(reservation)
    db.session.commit()


@app.route('/moje_rezerwacje')
def moje_rezerwacje():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    else:
        user_id = session['user_id']
        user_info = Uzytkownik.query.filter_by(id_u=user_id).first()
        rezerwacje = Rezerwacja.query.filter_by(id_uzytkownika=user_id).all()
        obiekty = Obiekt.query.all()  # Dodaj to

        if user_info:
            session['user_info'] = {'imie': user_info.imie, 'nazwisko': user_info.nazwisko, 'email': user_info.email}

        # Przekazujemy reservation nawet jeśli lista jest pusta
        return render_template('MojeRezerwacje.html', rezerwacje=rezerwacje, obiekty=obiekty, reservation=None)  


@app.route('/payment/<int:reservation_id>', methods=['POST', 'GET'])
def payment(reservation_id):
    reservation = Rezerwacja.query.get(reservation_id)
    cena = None
    if reservation:
        obiekt = reservation.obiekt  # Pobranie obiektu powiązanego z rezerwacją
        if obiekt:
            cena = obiekt.cena_1 if reservation.godzina_z.hour - reservation.godzina_p.hour == 1 else obiekt.cena_2
    return render_template('payment.html', cena=cena, reservation=reservation)

@app.route('/payment_confirm', methods=['POST'])
def payment_confirm():
    if request.method == 'POST':
        print(request.form)  # Print danych przesłanych z formularza
        reservation_id = request.form['reservation_id']
        numer_konta = request.form['numer_konta']

        reservation = Rezerwacja.query.get(reservation_id)
        if reservation:
            reservation.status_platnosci = 'zaplacone'
            db.session.commit()
            flash('Płatność została przetworzona pomyślnie.', 'success')
            return redirect(url_for('moje_rezerwacje'))
        else:
            flash('Błąd: Nie można znaleźć rezerwacji.', 'danger')
            return redirect(url_for('index'))

    return redirect(url_for('index'))


if __name__ == "__main__":
    app.run(debug=True)
    remove_expired_reservations()
