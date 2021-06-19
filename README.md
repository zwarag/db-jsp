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

### Person
- Geburtsdatum STRING (nn)
- Versicherungsnummer STRING (nn) (4 stellig)
- Vorname STRING
- Nachname STRING
- Postleitzahl STRING
- Ort STRING
- Straße STRING
- Hausnummer STRING
- Tel1 STRING
- Tel2 STRING
- Tel3 STRING

### Passagier
- Geburtsdatum STRING (nn)
- Versicherungsnummer STRING (nn)
- Passagiernummer STRING

### Passage
- PassagenNR STRING
- Abfahrtshafen STRING
- Zielhafen STRING
- Abfahrtszeit STRING (unixTimeStamp)
- Ankunftszeit STRING (unixTimeStamp)

### Passagier_bucht_passage
- Buchungsnummer STRING
- Buchungsdatum STRING (unixTimeStamp)
- Klasse STRING
