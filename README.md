# Shiffs stuff

## Sites

### Login
- [] login(versicherungsnummer, geburtsdatum)

### Bestägige Userdaten
- [] getUserData(userID)
- [] saveUserData(userID, data)

### Passagenübersicht
- [] getAllPassage()
- [] goToCheckout(passageID)

### Checkout
- [] doBooking(passageID, userID)

### (optional) Buchungsübersicht
- [] getAllBookings(userID)

## DB Schema

CREATE TABLE PERSON(
	Geburtsdatum date,
	Versicherungsnummer varchar(4),
	Vorname varchar(255),
	Nachname varchar(255),
	Postleitzahl varchar(255),
	Ort varchar(255),
	Strasse varchar(255),
	Hausnummer varchar(10),
	Tel1 varchar(50),
	Tel2 varchar(50),
	Tel3 varchar(50),
	primary key(Geburtsdatum, Versicherungsnummer)
)

CREATE TABLE PASSAGIER(
	Geburtsdatum date not null,
	Versicherungsnummer varchar(4) not null,
	Passagiernummer varchar(255) primary key,
	FOREIGN KEY (Geburtsdatum, Versicherungsnummer) REFERENCES PERSON(Geburtsdatum, Versicherungsnummer),
	UNIQUE(Geburtsdatum, Versicherungsnummer)
)

CREATE TABLE PASSAGE(
	Passagennummer varchar(255) primary key,
	Abfahrtshafen varchar(255) not null,
	Zielhafen varchar(255) not null,
	Abfahrtszeit TIMESTAMP not null,
	Ankunftszeit TIMESTAMP not null
)
	
CREATE TABLE BUCHUNG(
	Passagiernummer varchar(255) not null,
	Passagennummer varchar(255) not null,
	Buchungsnummer varchar(255) primary key,
	Buchungsdatum Date not null,
	Klasse varchar(15) not null CONSTRAINT chk_Klasse CHECK (Klasse IN ('Business','Economy','First Class')),
	FOREIGN KEY (Passagennummer) REFERENCES PASSAGE(Passagennummer),
	FOREIGN KEY (Passagiernummer) REFERENCES PASSAGIER(Passagiernummer)
)

CREATE TABLE PASSAGE_WARTET(
	passage1 varchar(255),
	passage2 varchar(255),
	primary key(passage1, passage2),
	FOREIGN KEY (passage1) REFERENCES PASSAGE(Passagennummer),
	FOREIGN KEY (passage2) REFERENCES PASSAGE(Passagennummer)
)

