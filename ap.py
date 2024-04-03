from flask import Flask, render_template,url_for,redirect, flash, request
from  flask_sqlalchemy import SQLAlchemy
from werkzeug.security import generate_password_hash

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI']='mysql://root@localhost/aplikacja'
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

class Uzytkownik(db.Model):
    __tablename__ = 'uzytkownicy'
    id_u = db.Column(db.Integer, primary_key=True)
    imie = db.Column(db.String(50))
    nazwisko = db.Column(db.String(50))
    email = db.Column(db.String(50), unique=True)
    haslo = db.Column(db.String(255))

@app.route('/',methods=['POST','GET'])
    

def index():
    obiekty = Obiekt.query.all()
   
    return render_template('index.html', obiekty=obiekty)

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
        if Uzytkownik.query.filter_by(email=email).first():
            flash('Ten email jest już zajęty.', 'danger')
            print('emial zajety ')
            return redirect(url_for('register'))

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
        return render_template('register.html')

if __name__ == "__main__":
    app.run(debug=True)

