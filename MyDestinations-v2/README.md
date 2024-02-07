# MyDestinations
Cilj laboratorijskih vježbi je kreirati mobilnu aplikaciju u kojoj korisnik može pohranjivati podatke o turističkim destinacijama koje je isti posijetio. Kroz različite zahtijeve vježbe prolaze kroz osnovne građevne blokove koji se koriste prilikom izrade iOS mobilnih aplikacija. Od struktura, objekata i klasa do korištenja vanjskih library-a i dependency-ja. Prolaskom kroz ove laboratorijske vježbe student stječe osnovna znanja za razvoj iOS mobilnih aplikacija.

# Razvoj mobilnih aplikacija - LV 2

Druga po redu laboratorijska vježba iz kolegija Razvoj mobilnih aplikacija kroz koju će se studenti upoznati sa strukutrama i njihovom primjenom, UIAlertController-om i MKMapView-om.

  

Prvi dio vježbe će staviti fokus na Struct-ove i kako ih možemo iskoristiti za konfiguriranje UIView elemenata kroz cijelu aplikaciju. Generiranje custom klase za UITableViewCell koji smo definirali u LV 1 i style-anje iste kroz definirane strukture.

  

Drugi dio vježbe je nadograditi aplikaciju kako bi ista mogla prikazati detalje destinacije (koristeći definirane strukture za style-anje UIView-ova) koji će uključivati prikaz na mapama, dodati prethodnoj aplikaciji logiku za uklanjanje postojećih destinacija kroz UITableViewRowAction-e uz upozorenje korisniku prije brisanja iste.

  

U trećem djelu vježbe ćemo iskoristiti Swift Package Manager kako bi unutar aplikacije dodali [SDWebImage](https://github.com/SDWebImage/SDWebImage) library koji ćemo koristiti za prikaz slike destinacije.

  

## MyDestinations - iOS

## Zadatak 1

- Proširiti Destination objekt da ima informacije o url-u slike, latitudi i longitudi destinacije. Unutar DataEntryViewController-a kreirati UI elemente potrebne za unos novih parametara destinacije.

- Omogućiti brisanje cell-a pomoću UITableViewRowAction-a

- Dodati UIAlertController za potvrdu brisanja akcije

- Kreirati custom cell koji će u sebi prikazivati naslov i opis destinacije

- Kreirati strukturu pomoću koje ćemo style-ati cell (napraviti Extension na UILabel kako bismo mogli lakše aplicirati željeni style)
  

## Zadatak 2

- Kroz Swift Package Manager dodati SDWebImage kao external library

- Na listi svih destinacija editirati cell koji smo kreirali u prvom zadatku i na isti dodati UIImageView za prikaz slike (prikazati sliku pomoću SDWebImageView-a)

- Napomena: slika se prikazuje ukoliko je postavljena

## Zadatak 3

- Kroz delegat metodu UITableView-a omogućiti otvaranje prikaza detalja o destinaciji

- Detalji destinacije moraju sadržavati prikaz slijedećih stavki: id, naslov i opis destinacije (za style elemenata koji prikazuju id, naslov i opis koristiti strukturu koju smo definirali prethodno)

- Kada se otvore detalji destinacije, također dodati UIImageView i prikazati sliku destinacije unutar istoga

- Ukoliko destinacija ima unešene informacije o latitudi i longitudi dodati MKMapView i na mapi prikazati lokaciju odabrane destinacije


### Prikaz screen-ova
1. [Lista proizvoda](https://raw.githubusercontent.com/ibarisic05/MyDestinations/master/photos/lista_destinacija.png)
2. [Swipe to delete](https://raw.githubusercontent.com/ibarisic05/MyDestinations/master/photos/swipe_to_delete.png)
3. [Delete confirmation](https://raw.githubusercontent.com/ibarisic05/MyDestinations/master/photos/alert_delete.png)
4. [Unos destinacije](https://raw.githubusercontent.com/ibarisic05/MyDestinations/master/photos/unos_destinacije.png)
5. [Detalji destinacije](https://raw.githubusercontent.com/ibarisic05/MyDestinations/master/photos/detalji_destinacije.png)
# Korisni linkovi

-  [Struct and Class](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html) - dodatne informacije o klasama i strukturama

- [Swift extensions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html) - dodatne informacije o extension-ima u Swift-u

-  [UIAlertController](https://developer.apple.com/documentation/uikit/uialertcontroller) - dokumentacija za UIAlertControlleru

-  [UITableView](https://developer.apple.com/documentation/uikit/uitableview) - dokumentacija za UITableView

-  [MKMapView](https://developer.apple.com/documentation/mapkit/mkmapview) - dokumentacija za MKMapView

-  [UIImageView](https://developer.apple.com/documentation/uikit/uiimageview) - dokumentacija za UIImageView

- [Package Manager](https://swift.org/package-manager/) - detaljan opis Swift Package Managera

- [SDWebImage](https://github.com/SDWebImage/SDWebImage) - library za dohvaćanje i cache slika

  

### MISC

Image url: https://bit.ly/3gh6yH5
