int anzahlKonzentrationen = 5;
int aktuelleKonzentration = 0;
int anzahlZyklen = 10;
int aktuellerZyklus = 0;
int aktuellerMesspunkt = 0;

float[][]Durchschnitt = new float[anzahlKonzentrationen][50];
float[][]Messdaten = new float[anzahlKonzentrationen*anzahlZyklen][50];

float[][]UnbekannteKonzentrationMessdaten = new float[1][51];
int UnbekannteKonzentrationZyklus = 0;


boolean wait = true;

float[] MerkmalMaximum = new float[anzahlKonzentrationen*anzahlZyklen];
float[] MerkmalMinimum = new float[anzahlKonzentrationen*anzahlZyklen];
float[] MerkmalSteigung = new float[anzahlKonzentrationen*anzahlZyklen];
float[] MerkmalMittelwert = new float[anzahlKonzentrationen*anzahlZyklen];

float MerkmalMaximumUnbekannt = 0;
float MerkmalMinimumUnbekannt = 999999999;
float MerkmalSteigungUnbekannt = 0;
float MerkmalMittelwertUnbekannt = 0;


int outputsAbstand = 10;
int anzahlMerkmale = 0;



boolean res = true;

void Messung() {  
  if (messungGestartet) {
    if (myPort.available() > 0) {
      String Daten = "...";
      if (aktuelleKonzentration < anzahlKonzentrationen) {
        if (aktuellerZyklus != anzahlZyklen) {
          Daten = myPort.readStringUntil('\n');
        }

        int Widerstand = 0;
        if (Daten != null) {
          // Wenn die Daten existieren, wird der String in ein Int umgewandelt
          float SensorDaten = PApplet.parseFloat(Daten);
          Widerstand = PApplet.parseInt(SensorDaten);
          if (Widerstand == 1) {
            wait = false;
          }
        }


        if (Widerstand == 1 || Widerstand == 25 || Widerstand == 50 && wait == false) {
          aktuellerMesspunkt = Widerstand;
        } else if (aktuelleKonzentration < anzahlKonzentrationen && Daten != null && Widerstand != 0 && wait == false) {
          Messdaten[aktuellerZyklus + aktuelleKonzentration*(anzahlZyklen)][aktuellerMesspunkt] =  Widerstand;
          aktuellerMesspunkt += 1;
        }
        if (aktuellerMesspunkt == 49) {
          aktuellerMesspunkt = 0;
          if (aktuellerZyklus < anzahlZyklen) {
            aktuellerZyklus += 1;
            //matLog(Messdaten);
            wait = true;
          }
        }
        //Kalibrierung abgeschlossen
      }
    }
  }


  //UnbekannteKonuentration
  if (unbekannteKonzentration) {
    if (res) {
      myPort.clear();
      res = false;
    }


    if (myPort.available() > 0) {
      String Daten = "...";

      if (aktuellerZyklus != anzahlZyklen) {
        Daten = myPort.readStringUntil('\n');
      }

      int Widerstand = 0;
      if (Daten != null) {
        // Wenn die Daten existieren, wird der String in ein Int umgewandelt
        float SensorDaten = PApplet.parseFloat(Daten);
        Widerstand = PApplet.parseInt(SensorDaten);
        if (Widerstand == 1) {
          wait = false;
        }
      }


      if (Widerstand == 1 || Widerstand == 25 || Widerstand == 50) {
        aktuellerMesspunkt = Widerstand;
      } else if (Daten != null && Widerstand != 0) {
        UnbekannteKonzentrationMessdaten[0][aktuellerMesspunkt] =  Widerstand;
        aktuellerMesspunkt += 1;
      }
      if (aktuellerMesspunkt == 49) {
        aktuellerMesspunkt = 0;
      }
      if (aktuellerMesspunkt == GrenzeMaximumLinks) {
        MerkmalMaximumUnbekannt = 0;
      }
      if (aktuellerMesspunkt == GrenzeMinimumLinks) {
        MerkmalMinimumUnbekannt = 999999999;
      }
    }
  }
}
