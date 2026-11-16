/**
 * Lietuvos vardadienių kalendorius – Lithuanian name days: names by date and dates by name.
 *
 * The calendar for people, with today's names, greetings and gift ideas:
 * https://dovanasuvardu.lt/vardadieniai/
 *
 * Code: MIT. Data: CC BY-SA 4.0 (source: Lithuanian Wikipedia).
 */
module vardadieniai;

/// Online name day calendar (Lithuanian).
enum string homepage = "https://dovanasuvardu.lt/vardadieniai/";

/// A calendar day with its names.
struct Day
{
    /// Month 1..12.
    ubyte month;
    /// Day of the month 1..31.
    ubyte day;
    /// Names celebrated on that day.
    immutable(string)[] names;
}

/// A date as (month, day).
struct MonthDay
{
    /// Month 1..12.
    int month;
    /// Day of the month.
    int day;
}

/// The whole calendar (366 days).
immutable Day[] days = [
    Day(1, 1, ["Arvaidas", "Arvaidė", "Eufrozija", "Eufrozina", "Mečislovas", "Mečys", "Arvaida", "Arvaldas", "Arvaldė", "Arvė", "Mečius"]),
    Day(1, 2, ["Bazilijus", "Fulgentas", "Gailutė", "Mažvydas", "Stefanija", "Grigalius", "Bazilė", "Gailius", "Izidorius", "Mažvydė"]),
    Day(1, 3, ["Genovaitė", "Vida", "Viltautas", "Vyda", "Vidas", "Gaudrimas", "Gordijus", "Kangeda", "Kangedas", "Kongailas", "Kongailė", "Vidgailas", "Vidgailė", "Vidginas", "Vidginė", "Vydas"]),
    Day(1, 4, ["Andželika", "Anželika", "Arimantas", "Arimantė", "Benediktas", "Titas", "Arys", "Armantas", "Arminas", "Arminė", "Benas", "Armantė", "Armina", "Arminta", "Armintas", "Benedikta", "Benė", "Malvina"]),
    Day(1, 5, ["Gaudentas", "Simas", "Simonas", "Telesforas", "Vytautas", "Vytautė", "Gaudenta", "Bytautas", "Edvardas", "Emilijonas", "Tolminė"]),
    Day(1, 6, ["Arūnas", "Arūnė", "Baltazaras", "Kasparas", "Melchioras", "Merkelis", "Aras"]),
    Day(1, 7, ["Liucijus", "Rūtenis", "Jaugeda", "Jaugedas", "Julius", "Raimundas", "Raudvilė", "Valentinas", "Jaugėla", "Jaugėlė", "Jaugilė", "Jaugys", "Liucidas", "Liucilė", "Liucina", "Liucius", "Raudvydė"]),
    Day(1, 8, ["Apolinaras", "Gintė", "Vilintas", "Severinas", "Teofilė", "Teofilis", "Teofilius", "Vilinta", "Eivada", "Eivadas", "Eivarda", "Eivardas", "Medvaišas", "Nemira", "Vilintė"]),
    Day(1, 9, ["Algis", "Gabija", "Marcijona", "Bazilė", "Julijonas", "Kergailė", "Vaigalis"]),
    Day(1, 10, ["Agatonas", "Ginvilas", "Ginvilė", "Vilhelmas", "Vilius", "Elma", "Eima", "Gintvilas", "Gintvilė", "Javinė", "Jorigis", "Kolumbas", "Palemonas", "Vyda", "Vydas", "Vydautas", "Vydautė"]),
    Day(1, 11, ["Audrius", "Marcijonas", "Palemonas", "Vilnė", "Girstis", "Marcijona", "Narutis", "Stefanija", "Audrys"]),
    Day(1, 12, ["Cezarija", "Ernestas", "Lingailė", "Vaigedas", "Arkadijus", "Cezara", "Cezarė", "Cezarijus", "Cezaris", "Vaigeda", "Cezaras", "Eigailas", "Eigailė", "Lijana", "Lingailis", "Vaigedė"]),
    Day(1, 13, ["Dargaudas", "Gilvydė", "Iveta", "Raimonda", "Vera", "Veronika", "Dargauda", "Hiliaras", "Dargenė", "Dargenis", "Dargė", "Dargilas", "Iva", "Ivas", "Vidmantas"]),
    Day(1, 14, ["Auksė", "Feliksas", "Hilarijus", "Laimis", "Lilija", "Teodozijus", "Auksys", "Auksius", "Auksuolė", "Dailius", "Laimonas", "Lelija"]),
    Day(1, 15, ["Meda", "Paulius", "Skirgaila", "Snieguolė", "Mauras", "Povilas", "Sniega", "Sniegė", "Ida"]),
    Day(1, 16, ["Marcelis", "Norgailas", "Norgailė", "Leikantas", "Leimantas", "Leimantė", "Marcelė", "Marcė", "Honoratas", "Jovaras", "Marcelijus", "Marcelina", "Marcelinas", "Marcijonas", "Marcys", "Marčius", "Norgeda", "Norgedas", "Norgėlė", "Norgilas", "Utenis"]),
    Day(1, 17, ["Dovainis", "Leonilė", "Vilda", "Antanas", "Dovainas", "Dovainė", "Dovas", "Dovė", "Kalnė", "Beatričė", "Daujotas", "Kalnius", "Merūnas", "Tariotas", "Tariotė"]),
    Day(1, 18, ["Gedgaudas", "Jogailė", "Jolita", "Liberta", "Priscilė", "Radys", "Leonardas", "Liuberta", "Liubertas", "Radmantas", "Radmantė", "Radmina", "Radminas"]),
    Day(1, 19, ["Gedvilė", "Kanutas", "Marijus", "Marius", "Morta", "Raivedys", "Marina", "Henrikas", "Kleopatra", "Kunotas"]),
    Day(1, 20, ["Daugvydas", "Fabijonas", "Nomeda", "Daugvyda", "Fabija", "Fabijus", "Gintvainas", "Sebastijona", "Sebastijonas", "Giedrius", "Gintvainė", "Gintvilas", "Gintvilė", "Henrikas", "Liaubaras", "Nomedas", "Skaistė", "Skaistis"]),
    Day(1, 21, ["Agnietė", "Galiginas", "Garsė", "Inesa", "Ineta", "Augas", "Galigina", "Ina", "Ineza", "Agnė", "Augė", "Augis", "Augius", "Augūnas", "Augūnė", "Galgintas", "Galiginta", "Galigintas", "Inezė"]),
    Day(1, 22, ["Anastazas", "Aušrius", "Skaistė", "Vincas", "Vincentas", "Anastazija", "Asta", "Džiugas", "Gaudentas", "Nastas", "Astijus", "Audrius", "Audrys", "Aušrys", "Nastazija", "Nastė", "Nastys", "Vincenta", "Vincentina", "Vincė"]),
    Day(1, 23, ["Gailigedas", "Gunda", "Raimundas", "Armandas", "Gailigedė", "Gailimantas", "Gailimantė", "Gailimina", "Gailiminas", "Algimantas", "Gundas", "Gundė", "Ildefonsas", "Ramojus"]),
    Day(1, 24, ["Artūras", "Felicija", "Gaivilė", "Milena", "Vilgaudas", "Bukanta", "Bukantas", "Gaivilas", "Pranciškus", "Guntilda", "Lėta", "Mažvydas", "Šarūnas", "Timotiejus", "Vigaudas"]),
    Day(1, 25, ["Povilas", "Viltenis", "Žiedė", "Paulius", "Viltenė", "Viltė", "Viltys", "Jaunutis", "Jomantas"]),
    Day(1, 26, ["Eigilė", "Justas", "Paulė", "Rimantas", "Timotiejus", "Frėja", "Frėjus", "Rimas", "Titas", "Dangis", "Daugis", "Edvilė", "Eigintė", "Justė", "Justina", "Justinas", "Rima"]),
    Day(1, 27, ["Ilona", "Jogundas", "Jogundė", "Natalis", "Anelė", "Angelė", "Aventinas", "Jogunda", "Jogvilas", "Jogvilė", "Mainotas", "Mainotė", "Vytenis"]),
    Day(1, 28, ["Gedautas", "Leonidas", "Manfredas", "Nijolė", "Leonida", "Leonidė", "Sambangas", "Sambartas", "Tomas", "Karlas", "Karolė", "Liaudginas", "Sambartė"]),
    Day(1, 29, ["Aivaras", "Girkantas", "Valerijus", "Žibutė", "Gilda", "Gildas", "Gintas", "Nygailas", "Ginkantas", "Nygailė", "Nykanta", "Nykantas", "Valerijonas", "Žiba", "Žibuolė"]),
    Day(1, 30, ["Banguolė", "Hiacinta", "Ipolitas", "Jacinta", "Liuda", "Liudvika", "Martė", "Milgaudas", "Martyna", "Algina", "Banga", "Bangas", "Bangius", "Bangys", "Banguolis", "Milgauda", "Milgaudė", "Milius", "Sabina"]),
    Day(1, 31, ["Budvilė", "Luiza", "Marcelė", "Skirmantas", "Budvilas", "Budvyda", "Budvydas", "Budvydė", "Liudvika", "Skirmantė", "Astra", "Astrida", "Judra", "Judrė", "Liuda", "Luizė", "Skirma", "Skirmis"]),
    Day(2, 1, ["Brigita", "Eidvilė", "Gytautas", "Ignotas", "Gita", "Jovaida", "Pijonijus", "Edvilė", "Jovaidas", "Jovaidė", "Jovainas", "Jovainė", "Sigibertas", "Vasarė", "Vasaris"]),
    Day(2, 2, ["Orinta", "Rytys", "Valdas", "Valdemaras", "Valdonė", "Vandenė", "Kandida", "Kandidas", "Oreta", "Oretas", "Orintas", "Rytis", "Valdimantas", "Voldemaras"]),
    Day(2, 3, ["Asta", "Blažiejus", "Blažys", "Oskaras", "Radvilas", "Radvilė", "Radvas", "Radvė", "Radvina", "Radvinas", "Remigijus", "Tolbaudas", "Toldravas", "Toliotas", "Toliotė"]),
    Day(2, 4, ["Andriejus", "Andrius", "Arvilė", "Joana", "Vidmantas", "Barkus", "Vydmantas", "Minija"]),
    Day(2, 5, ["Agata", "Agota", "Birutė", "Gaudvinas", "Aga", "Agatas", "Agatė", "Gaudvina", "Birenė", "Birenis", "Birutis", "Birvyda", "Birvydas", "Gaudvilas", "Gaudvilė", "Ilona"]),
    Day(2, 6, ["Alkis", "Darata", "Oksana", "Titas", "Urtė", "Živilė", "Žyvilė", "Dorotas", "Dorotėja", "Dorotėjas", "Paulius", "Povilas", "Rona", "Roneta", "Alkanta", "Alkantas", "Alkantė", "Alkmena", "Alkmenas", "Alkmenė", "Dora", "Doras", "Dorė", "Dorys", "Dorotė", "Tušė", "Tužė"]),
    Day(2, 7, ["Jomantė", "Ričardas", "Romualdas", "Vilgirdas", "Jomantas", "Romualda", "Vildaugas", "Vilgaudas", "Vilgirdė", "Augutė", "Augutis", "Jomilas", "Jomilė", "Ramutis", "Romas", "Romulas", "Romulė", "Vilgauda", "Vilgirda"]),
    Day(2, 8, ["Daugvilė", "Dromantas", "Honorata", "Saliamonas", "Salys", "Aldona", "Daugvilas", "Daugvina", "Jeronimas", "Daugvinas", "Daugvinė", "Honoratas"]),
    Day(2, 9, ["Algė", "Apolonija", "Erika", "Erikas", "Dovilė", "Joviltas", "Marijus", "Polė", "Nikiforas", "Odeta"]),
    Day(2, 10, ["Elvyra", "Gabrielius", "Girvydas", "Skolė", "Vydgailė", "Gabrielė", "Scholastika", "Skolastika", "Aušra", "Eiva", "Elvyras", "Girvilas", "Girvilė", "Girvyda"]),
    Day(2, 11, ["Adolfas", "Algirdas", "Algirdė", "Liucijus", "Teodora", "Algenė", "Algirda", "Evelina", "Algenis", "Aumantas", "Aumantė", "Dovilė", "Kertautas", "Kertautė", "Kervainas", "Kervydas"]),
    Day(2, 12, ["Benediktas", "Deimantas", "Deimantė", "Eulalija", "Mantminas", "Deimilas", "Deimilė", "Reginaldas", "Aleksiejus", "Elmis", "Eulalė", "Mantas", "Mantmina", "Rainoldas", "Renalda", "Renaldas"]),
    Day(2, 13, ["Algaudas", "Benignas", "Kotryna", "Ugnė", "Algauda", "Benigna", "Eisra", "Loreta", "Putaviras", "Putviras", "Ugnius"]),
    Day(2, 14, ["Kirilas", "Lijana", "Liliana", "Saulė", "Saulius", "Valentinas", "Valius", "Vilmantas", "Gustautas", "Gustautė", "Gutautas", "Gutautė", "Lilė", "Valentas", "Valentina"]),
    Day(2, 15, ["Girdenė", "Girdenis", "Jovita", "Jurgina", "Jurgita", "Vytis", "Faustinas", "Jordanas", "Zygfridas", "Girdas", "Girdys", "Girdmantas", "Girdmantė", "Girdutė", "Girdutis", "Jotautas", "Jotautė", "Jotys", "Jovitas"]),
    Day(2, 16, ["Julijona", "Julijonas", "Tautvydė", "Ulė", "Ulijona", "Laimutė", "Tautvydas"]),
    Day(2, 17, ["Donata", "Donatas", "Vaišvilas", "Viltė", "Aleksas", "Dona", "Donalda", "Donaldas", "Flavijus", "Selma", "Vaišvila", "Viltrūda"]),
    Day(2, 18, ["Bernadeta", "Gendrė", "Lengvenis", "Simeonas", "Simas", "Kamilė", "Karigaila", "Simonas"]),
    Day(2, 19, ["Konradas", "Nida", "Šarūnas", "Zuzana", "Butmantas", "Butmantė", "Butmina", "Butminė", "Butminta", "Butmintas", "Butmintė"]),
    Day(2, 20, ["Aidas", "Eitvydė", "Leonas", "Visgintas", "Aida", "Eitvydas", "Aidis", "Eitenė", "Eitenis", "Eitmina", "Eitminas", "Eitvyda", "Leona", "Leonė", "Leontina", "Leva", "Levas", "Žemyna"]),
    Day(2, 21, ["Eleonora", "Feliksas", "Kęstutis", "Žemyna", "Kęstas", "Kęsvilas", "Leonora", "Lionė", "Nora"]),
    Day(2, 22, ["Darvydas", "Elvinas", "Gintautė", "Margarita", "Darvainas", "Darvyda", "Darginas", "Darginė", "Darvilas", "Darvilė", "Darvydė", "Elvas", "Elvys"]),
    Day(2, 23, ["Butvilė", "Gantautas", "Roma", "Romana", "Severinas", "Gantautė", "Haroldas"]),
    Day(2, 24, ["Gedmantas", "Goda", "Matas", "Motiejus", "Demetrija", "Livija"]),
    Day(2, 25, ["Margiris", "Rasa", "Regimantas", "Viktoras", "Rasuolė"]),
    Day(2, 26, ["Aleksandras", "Aurimė", "Izabelė", "Jogintas", "Sandra", "Aleksandra", "Alė", "Alius", "Aleksas"]),
    Day(2, 27, ["Gabrielius", "Ginvilas", "Livija", "Mandravas", "Skirmantė", "Fortunatas", "Fortūnata", "Mandravė", "Fortunatė", "Gabija", "Gabrielė", "Leandras"]),
    Day(2, 28, ["Romanas", "Romas", "Vilgardas", "Žygimantė", "Draudvilas", "Draudvilė", "Osvaldas", "Ramona", "Ramonas", "Roma", "Romana", "Valdas", "Vilgarda", "Vilgardė"]),
    Day(2, 29, ["Gustis", "Tolvaldas"]),
    Day(3, 1, ["Albinas", "Antanė", "Antanina", "Rusnė", "Tulgaudas", "Alba", "Albas", "Albina", "Deividas", "Eudora", "Lieda"]),
    Day(3, 2, ["Dautara", "Eitautas", "Elena", "Marcelinas", "Simplicijus", "Eitara", "Eitaras", "Eitarė", "Eitas", "Eitautė", "Eitys", "Helė", "Helianta", "Kovas"]),
    Day(3, 3, ["Kunigunda", "Nonita", "Tulė", "Uosis", "Gunda", "Nona", "Tulgauda", "Daukantas", "Tulgaudas", "Tulkanta", "Tulkantas", "Tulmina", "Tulminas", "Tulvirda", "Tulvirdas", "Tulvirdė"]),
    Day(3, 4, ["Daina", "Daugvydas", "Kazimieras", "Vaclava", "Daugvarda", "Daugvardas", "Kazė", "Kazys", "Vacė", "Daugvyda", "Girmantė", "Kazimiera"]),
    Day(3, 5, ["Aurora", "Austra", "Giedrė", "Klemensas", "Virgilijus", "Vydotas", "Liucijus", "Olivija", "Giedra", "Giedrius", "Girmantas"]),
    Day(3, 6, ["Gerasimas", "Norvilas", "Raminta", "Rožė", "Rozina"]),
    Day(3, 7, ["Felicita", "Galmantė", "Rimtautas", "Tomas", "Adriana", "Adrianas", "Adrija", "Adrijus", "Geitautas", "Geitautė", "Geivyda", "Geivydas", "Laima", "Galmantas", "Milbartas", "Milbartė", "Rimtas", "Rimtautė"]),
    Day(3, 8, ["Beata", "Gaudvilė", "Vydminas", "Ašvilas", "Ašvilė", "Ašvyda", "Ašvydas", "Aušvyda", "Aušvydas", "Aušvydė", "Laima", "Vydmina", "Vydminė"]),
    Day(3, 9, ["Dominykas", "Pranciška", "Pranė", "Visgailė", "Žygintas", "Domas", "Klausgailas", "Klausgailė", "Klausilas", "Dominyka", "Klausilė", "Klausutė", "Klausutis", "Klausvyda", "Klausvydas", "Žyginta", "Žygintė"]),
    Day(3, 10, ["Butgailė", "Emilis", "Geraldas", "Naubartas", "Silvija", "Medūnė", "Mintautas", "Mintautė", "Naumantas"]),
    Day(3, 11, ["Gedimtas", "Konstantinas", "Kostas", "Vijolė", "Gediminas", "Konstancija", "Konstantas", "Kostė", "Paulina"]),
    Day(3, 12, ["Darmantė", "Galvirdas", "Teofanas", "Goštautas", "Žostautė"]),
    Day(3, 13, ["Kristina", "Liutauras", "Vaidilė", "Liutaurė", "Paulina", "Teodora", "Varbutas"]),
    Day(3, 14, ["Darmantas", "Karigailė", "Matilda", "Darmantė", "Lygimantas", "Lygimantė"]),
    Day(3, 15, ["Klemensas", "Lionginas", "Lukrecija", "Raigardas", "Tautas", "Tautginė", "Tautgintė"]),
    Day(3, 16, ["Henrika", "Norvilė", "Vaidotas", "Julijonas", "Norvaldė", "Vaidota", "Aistė", "Norvilas"]),
    Day(3, 17, ["Gendvilas", "Gentvila", "Gerda", "Gertrūda", "Patrikas", "Varūna", "Vita", "Patricija", "Patricijus"]),
    Day(3, 18, ["Anzelmas", "Eimutė", "Eimutis", "Sibilė", "Kirilas", "Einora"]),
    Day(3, 19, ["Juozapas", "Juozas", "Vilė", "Vilys", "Juozapota", "Juzė"]),
    Day(3, 20, ["Filomenas", "Irma", "Irmantas", "Irmgarda", "Tautvilė", "Žygimantas", "Irmantė", "Irmina", "Joakimas"]),
    Day(3, 21, ["Benediktas", "Lingailė", "Nortautas", "Reda", "Benedikta", "Mikalojus", "Redas"]),
    Day(3, 22, ["Benvenutas", "Gedgaudas", "Gedgaudė", "Kotryna", "Vydūnas"]),
    Day(3, 23, ["Akvilė", "Alfonsas", "Ūla", "Vismantė", "Galgintas", "Jovita", "Oktavija", "Tarvydas"]),
    Day(3, 24, ["Daumantas", "Donardas", "Gabrielius", "Ganvilė", "Daumantė", "Liucija"]),
    Day(3, 25, ["Normantas", "Normantė", "Merkys", "Normilė"]),
    Day(3, 26, ["Arbutas", "Emanuelis", "Liudgaras", "Teklė", "Vydmantė", "Emanuelė", "Feliksas", "Laimis", "Ema", "Josvainė", "Josvilas"]),
    Day(3, 27, ["Alkmenas", "Lidija", "Rupertas", "Rūta", "Nikodemas", "Aleksandrija", "Fortūnatas", "Gabrielius", "Ginvilas", "Skirmantė"]),
    Day(3, 28, ["Girmantė", "Odeta", "Rimkantas", "Sikstas", "Filemonas", "Siksta"]),
    Day(3, 29, ["Almantė", "Bertoldas", "Manvydas", "Helmutas", "Narcizas"]),
    Day(3, 30, ["Anelė", "Ferdinandas", "Gvidonas", "Meda", "Virmantas", "Aja", "Gvidas", "Nelė"]),
    Day(3, 31, ["Benjaminas", "Gina", "Ginas", "Kornelija", "Ginius", "Ginutis"]),
    Day(4, 1, ["Dainora", "Hugonas", "Rimgaudas", "Teodoras", "Teodora", "Ringailė", "Ringaudas"]),
    Day(4, 2, ["Elona", "Jostautas", "Jostautė", "Pranciškus", "Pranas", "Minalgas"]),
    Day(4, 3, ["Kristijonas", "Ričardas", "Rimtautė", "Vytenis", "Irena", "Rikardas", "Vytenė"]),
    Day(4, 4, ["Algaudas", "Ambraziejus", "Eglė", "Izidorius", "Dzidas", "Izidora"]),
    Day(4, 5, ["Irena", "Rimvydas", "Zenius", "Zenonas", "Žygintė", "Krescencija", "Samanta", "Vincentas", "Balandis", "Ira"]),
    Day(4, 6, ["Celestinas", "Dagnė", "Daugirutis", "Žintautė", "Gerardas", "Dangerūta", "Izolda"]),
    Day(4, 7, ["Donata", "Hermanas", "Minvydas", "Kantautė", "Hermis", "Saurimė"]),
    Day(4, 8, ["Alma", "Girtautas", "Julija", "Skirgailė", "Valteris", "Dionizas", "Girtautė"]),
    Day(4, 9, ["Aurimas", "Dalia", "Gitana", "Kleopas", "Paladijus", "Dalė", "Dalius", "Gitanas", "Maja", "Milena"]),
    Day(4, 10, ["Agna", "Apolonijus", "Margarita", "Mintautas", "Apolonija", "Hilda", "Polė", "Polina"]),
    Day(4, 11, ["Daugailė", "Leonas", "Vykintas", "Arielė", "Arielis", "Arielius", "Eigmantas", "Stanislovas", "Eigminas"]),
    Day(4, 12, ["Damijonas", "Galmantas", "Julius", "Jūratė", "Galkantas", "Galkantė", "Julijus", "Zenonas"]),
    Day(4, 13, ["Ida", "Mingaudas", "Algaudė", "Idalija", "Liaugaudas", "Martynas", "Liaugintė"]),
    Day(4, 14, ["Justinas", "Vaišvydė", "Valerijonas", "Visvaldas", "Liuda", "Liudvika", "Luiza", "Valerijus", "Visvaldė"]),
    Day(4, 15, ["Gema", "Liudvina", "Modestas", "Vaidotė", "Vilnius", "Anastazijus", "Josmina", "Josminas"]),
    Day(4, 16, ["Algedė", "Giedrius", "Kalikstas", "Ūdrys", "Benediktas"]),
    Day(4, 17, ["Anicetas", "Dravenis", "Robertas", "Skaidra", "Aniceta", "Heraklis", "Skaidrė", "Skaidrys"]),
    Day(4, 18, ["Apolonijus", "Eitvilas", "Girmantė", "Undinė", "Kaributas", "Žara"]),
    Day(4, 19, ["Aistė", "Eirimas", "Laisvūnas", "Leontina", "Laisvūnė", "Leonas", "Simonas", "Nogailė", "Putrimas"]),
    Day(4, 20, ["Agnė", "Eisvydė", "Gostautas", "Marcijonas", "Agnetė", "Traidenis"]),
    Day(4, 21, ["Amalija", "Anzelmas", "Milgedas", "Skalvė", "Anzelma", "Arijus", "Konradas", "Skalvis"]),
    Day(4, 22, ["Kajus", "Leonas", "Leonidas", "Norvaidė", "Vadimas", "Visgailas", "Visgaudė", "Visgirdas"]),
    Day(4, 23, ["Adalbertas", "Daugaudas", "Jurga", "Jurgis", "Vygailė", "Jurgita", "Juras"]),
    Day(4, 24, ["Ervina", "Fidelis", "Gražvyda", "Kantrimas", "Viltrūda"]),
    Day(4, 25, ["Morkus", "Tolmantas", "Žadmantė", "Žadmantas", "Žavinta", "Arėjus"]),
    Day(4, 26, ["Dargailė", "Gailenis", "Klaudijus", "Vilūnė", "Klaudija"]),
    Day(4, 27, ["Anastazas", "Aušra", "Edilija", "Gotautas", "Zita", "Žydrė", "Aušrė", "Aušrinė"]),
    Day(4, 28, ["Rimgailė", "Valerija", "Vitalius", "Vygantas", "Prudencijus", "Valė", "Vygandė"]),
    Day(4, 29, ["Augustinas", "Indrė", "Rita", "Tarmantas", "Geidutė", "Kotryna"]),
    Day(4, 30, ["Marijonas", "Sofija", "Venta", "Virbutas", "Pijus", "Skaudvilas", "Vaišmantė"]),
    Day(5, 1, ["Anelė", "Vydmantė", "Zigmantas", "Zigmas", "Žilvinas", "Juozapas", "Ridmantas", "Vidmantė"]),
    Day(5, 2, ["Atanazas", "Eidmantas", "Meilė", "Meilutė", "Sigizmundas"]),
    Day(5, 3, ["Arvystas", "Juvenalis", "Kantvydė", "Aleksandras", "Jokūbas", "Pilypas", "Dovydas"]),
    Day(5, 4, ["Dargailas", "Florijonas", "Mintautė", "Monika", "Vitalija", "Antanina"]),
    Day(5, 5, ["Angelas", "Anielius", "Barvydas", "Neris", "Pijus", "Irena", "Mykolas", "Barutė", "Sigita"]),
    Day(5, 6, ["Benedikta", "Eidmantė", "Judita", "Liucijus", "Minvydas", "Benė", "Benis"]),
    Day(5, 7, ["Butautas", "Danutė", "Domicelė", "Domicijonas", "Rimutė", "Stanislovas", "Dana"]),
    Day(5, 8, ["Džiugas", "Mykolas", "Stasys", "Audrė", "Stanislovas", "Viktoras", "Stanislova", "Stasė"]),
    Day(5, 9, ["Austėja", "Edita", "Grigalius", "Mingailas", "Austė", "Beatas", "Austinėja"]),
    Day(5, 10, ["Putinas", "Sangailė", "Viktorina", "Antoninas"]),
    Day(5, 11, ["Mamertas", "Miglė", "Pilypas", "Skirgaudas", "Dileta", "Vaitnoras", "Vaitnorė"]),
    Day(5, 12, ["Achilas", "Nerėjas", "Nerijus", "Vaidutis", "Vilgailė", "Nerys"]),
    Day(5, 13, ["Alvydė", "Tautmilas", "Milda", "Ofelija", "Tautminas", "Tautminė"]),
    Day(5, 14, ["Bonifacas", "Gintaras", "Gintarė", "Motiejus", "Vilda", "Livita"]),
    Day(5, 15, ["Algedas", "Izidorius", "Jaunutė", "Sofija", "Zofija"]),
    Day(5, 16, ["Bitė", "Ubaldas", "Vaidmantas", "Andriejus", "Andrius", "Celestinas", "Gilvinas", "Taura"]),
    Day(5, 17, ["Bazilė", "Gailė", "Paskalis", "Virkantas"]),
    Day(5, 18, ["Erdvilas", "Erikas", "Julita", "Rytė", "Venancijus"]),
    Day(5, 19, ["Celestinas", "Gilvinas", "Tauras"]),
    Day(5, 20, ["Akvilas", "Alfreda", "Eidvilas", "Vygintė", "Bernardinas", "Eidvilė"]),
    Day(5, 21, ["Teobaldas", "Vaidevutis", "Valentas", "Vydmina", "Aldas", "Vaidivutis"]),
    Day(5, 22, ["Aldona", "Eimantas", "Elena", "Julė", "Julija", "Rita", "Aldas"]),
    Day(5, 23, ["Gertautas", "Ivona", "Tautvydė", "Žydrūnas", "Žydrūnė"]),
    Day(5, 24, ["Gerardas", "Gina", "Vilmantas", "Žana", "Žaneta", "Joana", "Vincentas"]),
    Day(5, 25, ["Almantas", "Bedas", "Danutė", "Urbonas", "Evelina", "Magdalena", "Alvyda"]),
    Day(5, 26, ["Algimantas", "Eduardas", "Milvydė", "Pilypas", "Vilhelmina"]),
    Day(5, 27, ["Brunonas", "Genadijus", "Leonora", "Virgaudas", "Žymantė", "Augustinas"]),
    Day(5, 28, ["Augustinas", "Jogirdas", "Rima", "Justas"]),
    Day(5, 29, ["Algedas", "Erdvilė", "Magdalena", "Magdė", "Teodozija"]),
    Day(5, 30, ["Ferdinandas", "Joana", "Vyliaudas", "Žana", "Fernandas", "Jomilė", "Žaneta"]),
    Day(5, 31, ["Angelė", "Gintautas", "Petronėlė", "Rimvilė", "Nojus", "Petrė"]),
    Day(6, 1, ["Galindė", "Jogaila", "Juvencijus", "Konradas", "Justinas"]),
    Day(6, 2, ["Auksė", "Ąžuolas", "Erazmas", "Eugenijus", "Marcelinas"]),
    Day(6, 3, ["Dovilė", "Klotilda", "Tautkantas", "Karolis"]),
    Day(6, 4, ["Dausprungas", "Deimena", "Kornelijus", "Pranciškus", "Vincenta", "Vincė", "Vincentas"]),
    Day(6, 5, ["Kantautas", "Kantvydė", "Marcė", "Kantalgas", "Kantalgė", "Kantas", "Kantautė", "Vinfridas", "Bonfacas", "Elvyra", "Kantenis", "Kantė", "Namkantas", "Namkantė", "Namkinta", "Namkintas", "Namkintė"]),
    Day(6, 6, ["Bogumilas", "Mėta", "Norbertas", "Paulina", "Tauras", "Klaudijus", "Smiltė"]),
    Day(6, 7, ["Lukrecija", "Radvydė", "Ratautas", "Roberta", "Robertas", "Lukrecijus", "Svajūnas", "Svajūnė"]),
    Day(6, 8, ["Eigintė", "Medardas", "Merūnas", "Edgaras"]),
    Day(6, 9, ["Felicijonas", "Felicijus", "Gintas", "Gintė", "Vitalija", "Efremas"]),
    Day(6, 10, ["Galindas", "Liutgarda", "Margarita", "Pelagija", "Vingailė", "Diana", "Pelagijus"]),
    Day(6, 11, ["Aluona", "Flora", "Tvirmantas", "Barnarbas"]),
    Day(6, 12, ["Anupras", "Dovė", "Kristė", "Kristijonas", "Kristis", "Ramūnas", "Vilma", "Krisčius", "Kristijona", "Kristina", "Kristinas", "Mangirdas", "Ramūnė"]),
    Day(6, 13, ["Akvilina", "Antanas", "Kunotas", "Skalvė", "Antanina", "Nina"]),
    Day(6, 14, ["Almina", "Digna", "Labvardas", "Bazilijus", "Rufinas", "Valerijus", "Kristina", "Liutauras", "Paulina", "Teodora", "Vaidilė"]),
    Day(6, 15, ["Bargailė", "Krescencija", "Tanvilas", "Vitas", "Aelita", "Jolanta"]),
    Day(6, 16, ["Benas", "Julita", "Jūra", "Tolminas", "Bena", "Benadas", "Benė", "Tolmina", "Aurimas", "Jūratė", "Jūris", "Jūrius", "Tolminė"]),
    Day(6, 17, ["Adolfas", "Daugantas", "Laura", "Vilmantė", "Adolfa", "Adolfina", "Adolis", "Dauganta", "Grigalius", "Rimvydas"]),
    Day(6, 18, ["Arnulfas", "Ginbutas", "Marina", "Vaiva", "Marcelinas", "Morkus", "Erdmantas", "Erdmantė", "Erdmas", "Erdmė", "Erdmilas", "Erdmilė", "Erikas", "Julita", "Rytė", "Rytis", "Venancijus", "Venantas"]),
    Day(6, 19, ["Deodatas", "Dovilas", "Ramunė", "Gervazas", "Julijona", "Protazas", "Protazijus", "Romas", "Romualdas", "Svaigeda", "Svaigedas", "Dovilė", "Gaudvilas", "Romualda", "Svaigedė"]),
    Day(6, 20, ["Florentina", "Nandas", "Silverijus", "Žadvainas", "Žintautė", "Nautara", "Silverija", "Nautaras", "Nautarė", "Nauvyda", "Nauvydas", "Nauvydė", "Žadvainė"]),
    Day(6, 21, ["Alicija", "Aloyzas", "Galminas", "Vasarė", "Aloyza", "Galmina", "Galminė", "Iliuminata", "Irtuona"]),
    Day(6, 22, ["Inocentas", "Kaributas", "Laima", "Paulinas", "Eigauda", "Eigaudas", "Eigaudė", "Tomas", "Eigeda", "Eigedas", "Eigė", "Kentautas", "Kentautė", "Laimutė", "Paulina"]),
    Day(6, 23, ["Agripina", "Arvydas", "Ligita", "Vaida", "Vaidas", "Vanda", "Zenonas", "Arvyda", "Ligitas", "Rūtilė", "Arvydė", "Arvys", "Vaidauga", "Vaidaugas", "Vaidenė", "Vaidenis", "Vandalinas", "Vandalius", "Žydrius"]),
    Day(6, 24, ["Eiviltas", "Janina", "Jonas", "Ansas", "Eivilitas", "Eivilitė", "Janė", "Jonaudas", "Jonaudė", "Jonė", "Jonis", "Žana", "Žanas", "Žaneta"]),
    Day(6, 25, ["Baniutė", "Geistautas", "Geistautė", "Geisvydas", "Vilhelmas", "Epika", "Geismantas", "Geismantė", "Geistara", "Geisvyda", "Vilius", "Geistaras", "Geisvina", "Geisvinas", "Girvydas", "Prosperas", "Vilhelma", "Vilhelmina"]),
    Day(6, 26, ["Jaunius", "Jaunutis", "Viltautė", "Virgilijus", "Jaunė", "Jaunys", "Jaunutė", "Mingauda", "Paulius", "Povilas", "Mingaudas", "Ramunė", "Viltautas"]),
    Day(6, 27, ["Ema", "Gediminas", "Norgailė", "Vladas", "Vladislovas", "Gediminė", "Kirilas", "Ladas", "Vlada", "Ladys", "Vladislova", "Vladys"]),
    Day(6, 28, ["Gaudrė", "Irenėjus", "Tulgedas", "Serena", "Serenas", "Irenijas", "Leonas", "Šarūnas", "Tolgeda", "Tulgirda", "Tulgirdas", "Tulgirdė", "Tulys"]),
    Day(6, 29, ["Benita", "Gedrimė", "Mantigirdas", "Petras", "Povilas", "Benitas", "Paulius", "Benius", "Giedrimė", "Manta", "Paulė", "Petrė", "Svirkanta", "Svirkantas", "Svirkantė", "Svirmantas", "Svirmantė"]),
    Day(6, 30, ["Adelė", "Emilija", "Liucina", "Tautginas", "Novilė", "Otas", "Otonas", "Emilis"]),
    Day(7, 1, ["Julijus", "Julius", "Liepa", "Tautrimas", "Julė", "Julijona", "Julijonas", "Regina"]),
    Day(7, 2, ["Gantautė", "Jotvingas", "Marijonas", "Martinijonas", "Martys", "Jotvingė", "Jotvingis", "Marijona", "Napoleonas"]),
    Day(7, 3, ["Anatolijus", "Liaudmina", "Tomas", "Vaidilas", "Heliodoras", "Leonas", "Liaudbaras", "Liaudmantas", "Liaudminas", "Liaudminė", "Rytė", "Rytis", "Vaidilė"]),
    Day(7, 4, ["Berta", "Gedgailė", "Malvina", "Skalvis", "Teodoras", "Elžbieta", "Ulrikas"]),
    Day(7, 5, ["Butginas", "Filomena", "Karolina", "Antanas", "Mantmilė"]),
    Day(7, 6, ["Domė", "Dominyka", "Ginvilė", "Nerilė", "Nervilas", "Nervydas", "Marija", "Mindaugas", "Nerilis", "Nervilė"]),
    Day(7, 7, ["Astijus", "Estera", "Sangailas", "Vilgailė", "Elita", "Sangaudas", "Aistė", "Almantė"]),
    Day(7, 8, ["Arnoldas", "Elzė", "Elžbieta", "Vaitautas", "Virga", "Virginija", "Arentas", "Arnas", "Valmantė"]),
    Day(7, 9, ["Algirdas", "Algirdė", "Leonardas", "Marcelina", "Veronika", "Marcė", "Vera"]),
    Day(7, 10, ["Amalija", "Eirimė", "Gilvainas", "Prudencija", "Rufina", "Amelija", "Gilvainė", "Melė", "Lija", "Neikantas", "Neikantė", "Neimantas", "Neimantė", "Sigutė"]),
    Day(7, 11, ["Kipras", "Pijus", "Vilmantas", "Benediktas", "Kiprijonas", "Šarūnas"]),
    Day(7, 12, ["Izabelė", "Margiris", "Sigitas", "Vyliaudė", "Bonifacas", "Brunonas", "Sigisbertas"]),
    Day(7, 13, ["Anakletas", "Anys", "Arvilas", "Arvilė", "Eugenijus", "Henrikas", "Meinardas", "Rida", "Ridas", "Ridija", "Ridijus", "Ryda", "Rydas", "Šarūnas"]),
    Day(7, 14, ["Eigilė", "Kamilas", "Libertas", "Vydas"]),
    Day(7, 15, ["Bonaventūras", "Gerimantė", "Henrikas", "Mantas", "Rozalija", "Rožė", "Herkus", "Enrikas", "Henrieta"]),
    Day(7, 16, ["Danguolė", "Faustas", "Marija", "Vaigaudas"]),
    Day(7, 17, ["Aleksas", "Darius", "Girėnas", "Vaiga", "Darutis", "Magdalena", "Narimantas"]),
    Day(7, 18, ["Eimantė", "Ervinas", "Fridrikas", "Kamilis", "Tautvilas", "Arentas", "Arnas", "Arnoldas"]),
    Day(7, 19, ["Aurėja", "Galigantas", "Mantigailė", "Vincentas", "Auksė", "Vincas"]),
    Day(7, 20, ["Alvyda", "Alvydas", "Česlovas", "Elijas", "Jeronimas", "Vismantė", "Aurelijus"]),
    Day(7, 21, ["Danielius", "Lionginas", "Rimvydas", "Rimvydė", "Laurynas"]),
    Day(7, 22, ["Dalius", "Magdalena", "Mantilė"]),
    Day(7, 23, ["Apolinaras", "Brigita", "Gilmina", "Romula", "Tarvilas", "Roma", "Saida", "Saidas"]),
    Day(7, 24, ["Dargvilas", "Dargvilė", "Kristina", "Kristupas", "Kristoforas", "Kunigunda", "Živilė"]),
    Day(7, 25, ["Jokūbas", "Kargaudas", "Kristoforas", "Kristupas", "Aušrinė", "Tėja"]),
    Day(7, 26, ["Daugintas", "Eigirdė", "Joakimas", "Ona", "Ana", "Aneta", "Jokimas", "Eigis", "Milė"]),
    Day(7, 27, ["Natalija", "Panteleonas", "Sergijus", "Svalia", "Žintautas", "Nazaras", "Subartas", "Sugauda", "Danguolė", "Sugaudas", "Sugaudė", "Suginta", "Sugintas", "Žintautė"]),
    Day(7, 28, ["Ada", "Augmina", "Inocentas", "Nazaras", "Nazarijus", "Vytaras", "Vytas"]),
    Day(7, 29, ["Beatričė", "Mantvydas", "Mantvydė", "Morta", "Faustinas", "Feliksas", "Laimis", "Simplicijus"]),
    Day(7, 30, ["Abdonas", "Donatilė", "Nortautas", "Radvilė"]),
    Day(7, 31, ["Elena", "Ignacas", "Ignotas", "Sanginas", "Vykintė"]),
    Day(8, 1, ["Almeda", "Bartautas", "Bartautė", "Alfonsas"]),
    Day(8, 2, ["Alfonsas", "Euzebijus", "Guoda", "Gustavas", "Tautvilas", "Steponas"]),
    Day(8, 3, ["Augustė", "Mangirdas", "Lengvinė", "Lidija", "Steponas", "Galimantas"]),
    Day(8, 4, ["Dominykas", "Gerimantas", "Milgedė", "Domantas", "Irta"]),
    Day(8, 5, ["Mintarė", "Nona", "Osvaldas", "Rimtas", "Vilija", "Paris", "Felicismas"]),
    Day(8, 6, ["Bylotas", "Daiva", "Sikstas", "Karolina"]),
    Day(8, 7, ["Drąsutis", "Jogilė", "Kajetonas", "Klaudija", "Donatas", "Jogailė", "Sikstas"]),
    Day(8, 8, ["Daina", "Elidijus", "Gustavas", "Tulgirdas", "Dominykas"]),
    Day(8, 9, ["Mintaras", "Rolanda", "Rolandas", "Romanas", "Tarvilė", "Rolana", "Romas", "Jorūnas", "Virginija"]),
    Day(8, 10, ["Asterija", "Astra", "Laima", "Laurynas", "Aistė", "Aurimas", "Narimantas", "Normantas"]),
    Day(8, 11, ["Ligija", "Visalgas", "Visvilė", "Zuzana", "Filomena", "Klara", "Severas", "Butenis", "Visgaldas"]),
    Day(8, 12, ["Klara", "Laimona", "Laimonas", "Radegunda", "Radė", "Laima", "Aiškutė"]),
    Day(8, 13, ["Diana", "Gilvilė", "Ipolitas", "Kasijonas", "Naglis", "Poncijonas"]),
    Day(8, 14, ["Euzebijus", "Grintautas", "Guostė", "Maksimilijonas"]),
    Day(8, 15, ["Napalys", "Napoleonas", "Rugilė", "Sigita", "Visvilas", "Vydenė", "Visvydas"]),
    Day(8, 16, ["Alvita", "Butvydas", "Jokimas", "Rokas", "Steponas"]),
    Day(8, 17, ["Hiacintas", "Jacintas", "Jackus", "Mažvilė", "Saulenis", "Laisva", "Laisvydas", "Sigutė"]),
    Day(8, 18, ["Gendvilė", "Ilona", "Mantautas", "Elena"]),
    Day(8, 19, ["Argaudas", "Balys", "Boleslovas", "Tolvina", "Emilija"]),
    Day(8, 20, ["Bernardas", "Neringa", "Tolvinas", "Beržas", "Nemunas", "Renaldas", "Samuelis"]),
    Day(8, 21, ["Gaudvydas", "Joana", "Kazimiera", "Linda", "Medeinė", "Pijus"]),
    Day(8, 22, ["Ipolitas", "Karijotas", "Rimantė", "Siga", "Sigita", "Zigfridas"]),
    Day(8, 23, ["Girmantas", "Pilypas", "Tautgailė", "Rožė"]),
    Day(8, 24, ["Baltramiejus", "Rasuolė", "Viešvilas", "Alicija", "Baltrus", "Michalina", "Mykolė"]),
    Day(8, 25, ["Liucilė", "Liudas", "Liudvikas", "Mangailas", "Juozapas", "Mangailė", "Patricija"]),
    Day(8, 26, ["Aleksandras", "Algintė", "Gailutis", "Zefirinas", "Gailius", "Kazimieras", "Vilandas"]),
    Day(8, 27, ["Aušrinė", "Cezarijus", "Tolvydas", "Geidė", "Monika", "Tolvyda"]),
    Day(8, 28, ["Augustina", "Steigvilė", "Tarvilas"]),
    Day(8, 29, ["Barvydas", "Beatričė", "Gaudvydė", "Sabina", "Adolfas", "Nirmeda", "Svaigaudas"]),
    Day(8, 30, ["Adauktas", "Augūna", "Gaudencija", "Joris", "Kintenis", "Feliksas", "Laimis", "Rosita", "Rozita", "Vesta"]),
    Day(8, 31, ["Raimondas", "Raimunda", "Raimundas", "Vilmantas", "Vilmantė", "Izabelė"]),
    Day(9, 1, ["Egidijus", "Gytautas", "Gytis", "Verena", "Burvilė"]),
    Day(9, 2, ["Ingrida", "Protenis", "Steponas", "Vilgaudė", "Vilgaudas", "Arijus", "Jauvydas"]),
    Day(9, 3, ["Berta", "Bronislava", "Bronislovas", "Mirga", "Sirtautas", "Bronislova", "Grigalius"]),
    Day(9, 4, ["Germantė", "Germina", "Girstautas", "Rozalija", "Rožė", "Ida"]),
    Day(9, 5, ["Dingailė", "Erdenis", "Justina", "Stanislava", "Stasė", "Laurynas"]),
    Day(9, 6, ["Beata", "Faustas", "Tautenė", "Vaištautas"]),
    Day(9, 7, ["Bartas", "Bartė", "Klodas", "Klodoaldas", "Palmyra", "Pulcherija", "Regina", "Falmira", "Palmira"]),
    Day(9, 8, ["Adrijonas", "Daumantė", "Klementina", "Liaugaudas", "Marija", "Adriana", "Marė"]),
    Day(9, 9, ["Argintas", "Ramutė", "Serapina", "Sergijus", "Sonata", "Arginta", "Pobiltas", "Darius", "Sergejus"]),
    Day(9, 10, ["Konstancija", "Mikalojus", "Tautgirdas", "Dionyzas", "Girmintė", "Kostė", "Salvijus"]),
    Day(9, 11, ["Augantas", "Gytautė", "Gytė", "Helga", "Hiacintas", "Jacintas", "Jackus"]),
    Day(9, 12, ["Gvidas", "Marija", "Tolvaldas", "Vaidmantė", "Ovidijus"]),
    Day(9, 13, ["Barmantas", "Barvydė"]),
    Day(9, 14, ["Eisvina", "Eisvinas", "Krescencijus", "Sanija", "Sanita", "Santa", "Krescencija"]),
    Day(9, 15, ["Nikodemas", "Vismantas", "Eugenija", "Rimgailė", "Rolandas"]),
    Day(9, 16, ["Edita", "Eufemija", "Jogintė", "Kamilė", "Liudmila", "Rimgaudas", "Kipras", "Kiprijonas", "Kornelijus"]),
    Day(9, 17, ["Pranas", "Pranciškus", "Sintautas", "Sintautė", "Robertas"]),
    Day(9, 18, ["Galmantė", "Mingailas", "Stefa", "Stefanija", "Elita", "Juozapas", "Stanislovas"]),
    Day(9, 19, ["Girvinas", "Vilė", "Vilhelmina", "Vytė", "Arnulfas", "Januarijus"]),
    Day(9, 20, ["Eustachijus", "Fausta", "Tautgirdė", "Vainora", "Kolumba", "Vainoras", "Matas", "Vaišgirdas", "Vaižgantas"]),
    Day(9, 21, ["Mantvilas", "Matas", "Viskintė"]),
    Day(9, 22, ["Mauricijus", "Tarvinas", "Tomas", "Virmantė", "Eigantė", "Tamošius"]),
    Day(9, 23, ["Galintas", "Galintė", "Lina", "Linas", "Teklė", "Linė"]),
    Day(9, 24, ["Gedvinas", "Gedvinė", "Gerardas"]),
    Day(9, 25, ["Aurelija", "Kleopas", "Ramvydė", "Vaigintas", "Vladislovas"]),
    Day(9, 26, ["Damijonas", "Gražina", "Justė", "Justina", "Kipras", "Vydenis"]),
    Day(9, 27, ["Adalbertas", "Daugilė", "Kovaldas", "Damijonas", "Vincentas"]),
    Day(9, 28, ["Lana", "Svetlana", "Tautvydas", "Vacys", "Vaclovas", "Vientautė", "Saliamonas"]),
    Day(9, 29, ["Kęsgailas", "Kęsgailė", "Michalina", "Mykolas", "Rapolas", "Gabrielius", "Mykolė"]),
    Day(9, 30, ["Jeronimas", "Sofija", "Žymantas", "Bytautė", "Zofija"]),
    Day(10, 1, ["Benigna", "Mantas", "Mintė", "Remigijus", "Arielė", "Arielis", "Arielius", "Emanuelis", "Teresė"]),
    Day(10, 2, ["Eidvilas", "Getautė", "Modestas", "Gervilė", "Gervydas", "Geržadas"]),
    Day(10, 3, ["Alanta", "Evaldas", "Milgintas", "Teresė", "Alanas", "Kristina", "Valda"]),
    Day(10, 4, ["Eivydė", "Mąstautas", "Pranciškus", "Edvinas", "Eivė", "Eivydas", "Pranas", "Auksuolė"]),
    Day(10, 5, ["Donata", "Galė", "Gilda", "Palemonas", "Edvinas", "Placidas"]),
    Day(10, 6, ["Brunonas", "Budvydas", "Vytenė", "Renatas", "Eismantas", "Renė"]),
    Day(10, 7, ["Butrimas", "Eivina", "Justina", "Morkus", "Renatas"]),
    Day(10, 8, ["Aina", "Brigita", "Daugas", "Demetras", "Gaivilė", "Benedikta", "Marcelis", "Sergijus", "Arminas", "Demetrijus", "Gaivenė", "Gaivenis"]),
    Day(10, 9, ["Dionyzas", "Gedėtas", "Virgailė", "Gedimtas", "Liudas", "Liudvikas", "Virbutas"]),
    Day(10, 10, ["Butautė", "Danielius", "Gilvydas", "Danys", "Pranciškus"]),
    Day(10, 11, ["Daugvydė", "Germanas", "Rimgaudas", "Zina", "Zinaida"]),
    Day(10, 12, ["Deimintė", "Gantas", "Rudolfas", "Salvinas", "Serapinas", "Ralfas"]),
    Day(10, 13, ["Edgaras", "Eduardas", "Edvardas", "Mintaras", "Nortautė", "Nortautas", "Venancijus"]),
    Day(10, 14, ["Fortunata", "Kalikstas", "Mindaugas", "Rimvydė", "Vincentas", "Burgailas", "Burgailė"]),
    Day(10, 15, ["Domantė", "Leonardas", "Teresė", "Galimintas"]),
    Day(10, 16, ["Ambraziejus", "Dovaidas", "Dovaidė", "Dovaldė", "Greta", "Gutautas", "Jadvyga", "Aurelija", "Galius", "Gretė", "Margarita"]),
    Day(10, 17, ["Gytė", "Kintautas", "Margarita", "Marijonas", "Ignacas", "Ignotas"]),
    Day(10, 18, ["Kęsmina", "Liubartas", "Lukas", "Vaiva"]),
    Day(10, 19, ["Akvilinas", "Frida", "Geisvilas", "Izaokas", "Kantrimė", "Kleopatra", "Laura", "Paulius", "Povilas"]),
    Day(10, 20, ["Adelė", "Adelina", "Gedas", "Adelija", "Deimina", "Irena"]),
    Day(10, 21, ["Gilanda", "Hiliaras", "Raitvilas", "Uršulė", "Vilma"]),
    Day(10, 22, ["Aliodija", "Mingedė", "Severinas", "Viltaras", "Donatas", "Malvina", "Severas"]),
    Day(10, 23, ["Odilija", "Ramvydė", "Sanginas"]),
    Day(10, 24, ["Daugailas", "Gilbertas", "Rapolas", "Švitrigailė", "Antanas"]),
    Day(10, 25, ["Darija", "Inga", "Krizantas", "Krizas", "Švitrigaila", "Vaigedė", "Darijus", "Ingeborga", "Švitrė"]),
    Day(10, 26, ["Evaristas", "Liaudginas", "Mingintė", "Vita", "Liauda", "Liudginas", "Liaudys", "Ramojus", "Sabina", "Tautmilė"]),
    Day(10, 27, ["Ramojus", "Sabina", "Tautmilė", "Vincentas", "Vincas"]),
    Day(10, 28, ["Gaudrimas", "Judas", "Tadas", "Almantė", "Simas", "Simonas"]),
    Day(10, 29, ["Ermelinda", "Gelgaudas", "Narcizas", "Tolvydė", "Violeta", "Žaimantas"]),
    Day(10, 30, ["Darata", "Edmundas", "Skirgaila", "Skirvydė", "Volfas", "Volfgangas", "Liucilė"]),
    Day(10, 31, ["Tanvilė", "Alfonsas", "Liucilė", "Vygandas", "Volfgangas"]),
    Day(11, 1, ["Andrius", "Milvydė", "Žygaudas", "Milvydas"]),
    Day(11, 2, ["Gedartas", "Valys", "Valentinas", "Gedvilė", "Viskantas"]),
    Day(11, 3, ["Hubertas", "Norvainė", "Silvija", "Vidmantė", "Vidmantas"]),
    Day(11, 4, ["Agrikola", "Eibartas", "Karolis", "Modesta", "Vaidmina", "Vitalijus", "Vitalis"]),
    Day(11, 5, ["Audangas", "Elžbieta", "Florijonas", "Gedvydė", "Elzė"]),
    Day(11, 6, ["Ašmantas", "Leonardas", "Melanijus", "Vygaudė"]),
    Day(11, 7, ["Ernestas", "Gotautė", "Karina", "Sirtautas", "Evelina"]),
    Day(11, 8, ["Domantė", "Gotfridas", "Severijonas", "Severinas", "Svirbutas", "Viktorinas"]),
    Day(11, 9, ["Dargintas", "Estela", "Skirtautė", "Teodoras", "Aurelijus", "Paulina", "Dargis", "Stela"]),
    Day(11, 10, ["Andrius", "Leonas", "Vaišviltas", "Evelina", "Dainius", "Galvydė", "Vaišvilas", "Vaišvilė"]),
    Day(11, 11, ["Anastazija", "Martynas", "Milvydė", "Nastė", "Vygintas", "Vygirtė"]),
    Day(11, 12, ["Juozapotas", "Kristinas", "Renata", "Ašmantas", "Kristina", "Teodoras", "Akvilė"]),
    Day(11, 13, ["Arkadijus", "Eirimė", "Norvydas"]),
    Day(11, 14, ["Emilis", "Judita", "Ramantas", "Saulenė", "Emilija", "Gotfridas", "Ramas"]),
    Day(11, 15, ["Albertas", "Leopoldas", "Vaidilas", "Žadvydė"]),
    Day(11, 16, ["Edmundas", "Gerdvilė", "Gertrūda", "Vaišvydas", "Margarita"]),
    Day(11, 17, ["Getautas", "Gilvilė", "Viktorija", "Dionyzas", "Elžbieta", "Grigalius", "Salomėja", "Benita"]),
    Day(11, 18, ["Ginvydas", "Ginvydė", "Otas", "Otonas", "Romanas", "Giniotas", "Salomėja", "Vestas"]),
    Day(11, 19, ["Dainius", "Matilda", "Rimgaudė", "Dainotas"]),
    Day(11, 20, ["Feliksas", "Jovydas", "Vaidvilė", "Neringa"]),
    Day(11, 21, ["Alberta", "Eibartė", "Gomantas", "Honorijus", "Eibutas", "Gomantė"]),
    Day(11, 22, ["Cecilija", "Cilė", "Dargintė", "Steigintas", "Suvainė"]),
    Day(11, 23, ["Adelė", "Doviltas", "Klemensas", "Kolumbanas", "Kolumbas", "Liubartė", "Felicita"]),
    Day(11, 24, ["Mantvinas", "Žybartas", "Gerardas"]),
    Day(11, 25, ["Germilė", "Kotryna", "Santautas", "Jaukanta", "Jaukantas", "Jaukantė", "Jaumantas", "Jaumantė", "Katarina", "Katrė", "Katryna", "Kotrė", "Santautė", "Sanvyda", "Sanvydas", "Sanvydė", "Trynė"]),
    Day(11, 26, ["Dobilas", "Silvestras", "Vygantė", "Dobilė", "Krizostomas", "Leonardas", "Vaigeta", "Vygintė"]),
    Day(11, 27, ["Girvydė", "Maksimas", "Skomantas", "Virgilijus", "Maksas", "Maksima", "Skomantė", "Virgas", "Almanta", "Almantas", "Maksimilijonas", "Skomina", "Skominas", "Vergilija", "Vergilijus", "Virgilija"]),
    Day(11, 28, ["Rimgaudas", "Vakarė", "Egmontas", "Eidenė", "Eidenis", "Gintenė", "Jokūbas", "Rufas", "Steponas", "Gintenis", "Gintilas", "Gintilė", "Rimgauda", "Rimgaudė"]),
    Day(11, 29, ["Butvydė", "Daujotas", "Saturnas", "Saturninas"]),
    Day(11, 30, ["Andriejus", "Andrius", "Dovainė", "Saugirdas", "Saugarda", "Saugardas", "Saugirdė", "Andrė", "Andrėja", "Andrys", "Saugardė", "Saugina", "Sauginas", "Sauginė"]),
    Day(12, 1, ["Algmina", "Butigeidas", "Eligijus", "Natalija", "Aleksandras", "Baltenė", "Baltenis", "Eligas", "Balys", "Melita", "Nata", "Natalė", "Natalis", "Natas", "Natė"]),
    Day(12, 2, ["Aurelija", "Milmantė", "Paulina", "Svirgailas", "Aura", "Aurė", "Aurėja", "Milkanta", "Milkantas", "Svirgailė", "Svirganta", "Svirgauda", "Svirgaudas", "Svirgaudė", "Svirgeda", "Svirgedas", "Vėjūnas", "Viviana"]),
    Day(12, 3, ["Audinga", "Gailintas", "Ksaveras", "Atalija", "Audingas", "Ksavera", "Ksaverija", "Linvyda", "Linvydas", "Linvydė"]),
    Day(12, 4, ["Barbora", "Liugailė", "Osmundas", "Vainotas", "Airė", "Barbė", "Barė", "Vainota", "Bušė", "Liutauras", "Liutaurė", "Nadruvė", "Nadruvis", "Vainotė"]),
    Day(12, 5, ["Eimintas", "Gratas", "Eimina", "Eiminė", "Eiminta", "Eimilas", "Eimilė", "Eimintė", "Geisvinė", "Grata", "Sabas", "Svaigaudas"]),
    Day(12, 6, ["Bilmantas", "Mikalojus", "Norvydė", "Bylenis", "Bilmantė", "Bilminas", "Bilminė", "Koleta", "Mikas", "Mikita"]),
    Day(12, 7, ["Ašmantas", "Ašmantė", "Laigeda", "Laigedas", "Laigedė", "Leinartas", "Leinartė", "Leonarda", "Leonardas", "Lynartas", "Lynartė", "Melanijus", "Vygaudė"]),
    Day(12, 8, ["Zenonas", "Vaidgina", "Gedimina", "Gedminas", "Guntildas", "Zenė"]),
    Day(12, 9, ["Gedenė", "Leokadija", "Vakaris", "Valerija", "Bartmina", "Bartminas", "Pamela", "Vakarė", "Valmantas"]),
    Day(12, 10, ["Eidimtas", "Ilma", "Loreta", "Eidas", "Eidė", "Eidginta", "Eidgintas", "Eidimtė", "Eidinta", "Eidintas", "Lora", "Rimas", "Žydrė"]),
    Day(12, 11, ["Aistis", "Dovydas", "Aistė", "Artūras", "Damas", "Damazas", "Deividas", "Tautvaldė", "Lauksmė", "Lauksmina", "Lauksminas", "Lauksminė", "Lauksvyda", "Lauksvydas"]),
    Day(12, 12, ["Dagmara", "Gaiva", "Gilmina", "Gilminas", "Vaingeda", "Kirbutas", "Kirkanta", "Kirkantas", "Vainė", "Vaingedas", "Vainius"]),
    Day(12, 13, ["Eiviltė", "Kastautas", "Kastytis", "Liucija", "Otilija", "Kastautė", "Kastė", "Liucė", "Lucė", "Lucija"]),
    Day(12, 14, ["Alfredas", "Kintvilė", "Tarvainas", "Alfreda", "Augeda", "Augedas", "Kintvilas", "Augenė", "Augenis", "Fredas", "Kintibutas", "Kintrimas", "Kintrimė", "Tarvainė"]),
    Day(12, 15, ["Gaudenė", "Gaudenis", "Justas", "Kristijona", "Kristijonas", "Celsas", "Čiovyda", "Čiovydas", "Gaudas", "Gaudencija", "Gaudė", "Libartė", "Libertas", "Lygauda", "Lygaudas"]),
    Day(12, 16, ["Albina", "Algina", "Alina", "Audronė", "Vygaudas", "Adas"]),
    Day(12, 17, ["Drovydė", "Jolanta", "Mantgailas", "Olimpija", "Jokinta", "Jokintas", "Joleta", "Jolė", "Jolita", "Lozorius", "Olimpijus", "Rachelė"]),
    Day(12, 18, ["Eivilė", "Gracijonas", "Eivilas", "Eivina", "Eivinas", "Girdvainas", "Girdvainė", "Girvyda", "Girvydas", "Gracija", "Gracius", "Vykanta", "Vykantas"]),
    Day(12, 19, ["Darijus", "Gerdvilas", "Rimantė", "Lėja"]),
    Day(12, 20, ["Daugardas", "Gražvilė", "Teofilis", "Abraomas", "Abrys", "Dominykas", "Namvaldas", "Namvaldė", "Pastoras", "Teofilė", "Teofilija", "Teofilius", "Topilė", "Topilius"]),
    Day(12, 21, ["Girenė", "Tomas", "Norgaudė", "Abraomas", "Daugardas", "Gražvilė", "Narnvaldas", "Pastoras", "Teofilė", "Topilius"]),
    Day(12, 22, ["Gedvydas", "Ksavera", "Zenonas", "Dovilė", "Gedvyda", "Ksaveras", "Rimbertas", "Gedvarda", "Gedvardas", "Gedvardė", "Gedvė"]),
    Day(12, 23, ["Mina", "Veliuona", "Viktorija", "Vilbutas", "Viktė", "Vilas", "Vilbutė", "Vilė", "Vilys"]),
    Day(12, 24, ["Adomas", "Ieva", "Adas", "Adelė", "Gudmina", "Gudminas", "Gudvainas", "Gudvainė", "Gudvilas", "Gudvilė", "Gudvina", "Gudvinas", "Jieva"]),
    Day(12, 25, ["Eugenija", "Genė", "Gražvydas", "Sanrimė", "Anastazija", "Gražinė", "Gražinis", "Gražys", "Nastė", "Aiškutė", "Gražmantas", "Gražvaldas", "Gražvaldė", "Gražvilas", "Gražvilė", "Gražvyda"]),
    Day(12, 26, ["Gaudilė", "Gindvilė", "Steponas", "Gaudilas", "Ginda", "Gindas", "Gindvilas", "Relinda", "Stepa", "Stepanija", "Stepas", "Steponė"]),
    Day(12, 27, ["Dautartas", "Fabijolė", "Gedvinė", "Dautarta", "Dautartė", "Eglė", "Visalgas", "Visalgė", "Visbartas", "Visbartė", "Visdagrė", "Visdargas"]),
    Day(12, 28, ["Ema", "Ingeborga", "Irvita", "Kamilė", "Kantvilas", "Vaidilutė", "Albutas", "Albutė", "Inga", "Ivita", "Algardas", "Algardė", "Jaugina", "Jauginas", "Vidas"]),
    Day(12, 29, ["Gaja", "Gentvainas", "Teofilė", "Tomas"]),
    Day(12, 30, ["Dovydas", "Gražvilas", "Sabinas", "Gedrimas", "Gedrimė", "Gedvaida", "Gedvaidas", "Sabina", "Gedvainas", "Gedvainė", "Sabys", "Vykintas"]),
    Day(12, 31, ["Melanija", "Mingailė", "Silvestras", "Gedganta", "Gedgantas", "Gedgantė", "Melanijus", "Silva", "Silvas", "Silvestra", "Silvija", "Silvijus"]),
];

/// Lowercases the text and removes Lithuanian diacritics (`Ąžuolas` -> `azuolas`).
string fold(string text) pure @safe
{
    import std.array : appender;
    import std.string : strip;
    import std.uni : toLower;

    auto result = appender!string();
    foreach (dchar c; text.strip.toLower)
    {
        switch (c)
        {
        case 'ą': result.put('a'); break;
        case 'č': result.put('c'); break;
        case 'ę': case 'ė': result.put('e'); break;
        case 'į': result.put('i'); break;
        case 'š': result.put('s'); break;
        case 'ų': case 'ū': result.put('u'); break;
        case 'ž': result.put('z'); break;
        default: result.put(c);
        }
    }
    return result.data;
}

/// Names celebrated on the given day; empty for a date that is not in the calendar.
immutable(string)[] namesOn(int month, int day) pure nothrow @safe @nogc
{
    foreach (ref d; days)
        if (d.month == month && d.day == day)
            return d.names;
    return null;
}

/// Days on which the name is celebrated (case and diacritics are ignored).
MonthDay[] daysFor(string name) pure @safe
{
    const wanted = fold(name);
    MonthDay[] result;
    foreach (ref d; days)
        foreach (n; d.names)
            if (fold(n) == wanted)
            {
                result ~= MonthDay(d.month, d.day);
                break;
            }
    return result;
}

///
unittest
{
    import std.algorithm.searching : canFind;

    assert(days.length == 366);
    assert(namesOn(11, 9).canFind("Teodoras"));
    assert(namesOn(2, 30).length == 0);
    assert(daysFor("TEODORAS").canFind(MonthDay(11, 9)));
    assert(daysFor("nera-tokio").length == 0);
    assert(fold(" Ąžuolas ") == "azuolas");
}
