boolean MaxAktiv = false;
boolean MinAktiv = false;
boolean SteigAktiv = false;
boolean MWAktiv = false;



boolean unbekannteKonzentration = false;


int GrenzeMaximumLinks = 6;
int GrenzeMinimumLinks = 10;
int GrenzeSteigungLinks = 14;
int GrenzeMittelwertLinks = 18;



void Maximum() {
  // Graphische Darstellung
  fill(0, 0, 255, 100);
  rect(250+GrenzeMaximumLinks*10, 50, 6*10, 350);
}

void Minimum() {
  // Graphische Darstellung
  fill(255, 0, 0, 100);
  rect(250+GrenzeMinimumLinks*10, 50, 6*10, 350);
}

void Steigung() {
  // Graphische Darstellung
  fill(255, 255, 0, 100);
  rect(250+GrenzeSteigungLinks*10, 50, 6*10, 350);
}

void Mittelwert() {
  // Graphische Darstellung
  fill(0, 255, 0, 100);
  rect(250+GrenzeMittelwertLinks*10, 50, 6*10, 350);
}

void mouseDragged() {
  //Wenn der Maximumsbereich zu sehen ist und man die Maus auf ihm hat, kann man ihn durch Maus gedrückt halten verschieben
  if (MaxAktiv && mouseX > 250+GrenzeMaximumLinks*10 && mouseX < 310+GrenzeMaximumLinks*10 && (mouseY-translation) > 50 && (mouseY-translation) < 400 && mouseX > 260 && mouseX < 720 && unbekannteKonzentration == false) {
    GrenzeMaximumLinks = floor((mouseX - 270)/10);
    //GrenzeMaximumLinks += (mouseX - pmouseX)/4;
  }
  if (MinAktiv && mouseX > 250+GrenzeMinimumLinks*10 && mouseX < 310+GrenzeMinimumLinks*10 && (mouseY-translation) > 50 && (mouseY-translation) < 400 && mouseX > 260 && mouseX < 720 && unbekannteKonzentration == false) {
    GrenzeMinimumLinks = floor((mouseX - 270)/10);
  }
  if (SteigAktiv && mouseX > 250+GrenzeSteigungLinks*10 && mouseX < 310+GrenzeSteigungLinks*10 && (mouseY-translation) > 50 && (mouseY-translation) < 400 && mouseX > 280 && mouseX < 700 && unbekannteKonzentration == false) {
    GrenzeSteigungLinks = floor((mouseX - 270)/10);
  }
  if (MWAktiv && mouseX > 250+GrenzeMittelwertLinks*10 && mouseX < 310+GrenzeMittelwertLinks*10 && (mouseY-translation) > 50 && (mouseY-translation) < 400 && mouseX > 260 && mouseX < 720 && unbekannteKonzentration == false) {
    GrenzeMittelwertLinks = floor((mouseX - 270)/10);
  }
}
void mouseWheel(MouseEvent event) {
  int e = event.getCount();
  //println(e);

  if (translation < 1 && translation > -200) {
    translation -= 5*e;
  }
}


void mouseReleased() {
  //Maximum ausgewählt
  if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 145 && (mouseY-translation) < 195 && messung && unbekannteKonzentration == false && erklaerung == false) {
    if (MaxAktiv) {
      MaxAktiv = false;
    } else {
      MaxAktiv = true;
    }
  }
  if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 220 && (mouseY-translation) < 270 && messung && unbekannteKonzentration == false && erklaerung == false) {

    if (MinAktiv) {
      MinAktiv = false;
    } else {
      MinAktiv = true;
    }
  }


  if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 295 && (mouseY-translation) < 345 && messung && unbekannteKonzentration == false && erklaerung == false) {

    if (SteigAktiv) {
      SteigAktiv = false;
    } else {
      SteigAktiv = true;
    }
  }

  if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 370 && (mouseY-translation) < 420 && messung && unbekannteKonzentration == false && erklaerung == false) {

    if (MWAktiv) {
      MWAktiv = false;
    } else {
      MWAktiv = true;
    }
  }

  if (aktuelleKonzentration == anzahlKonzentrationen && anzahlMerkmale == 2) {
    if (mouseX > 475 && mouseX < 575 && (mouseY-translation) > 900 && (mouseY-translation) < 950) {
      launch("test.html");
      unbekannteKonzentration = true;
      println("HI");
    }
  }


  //Vom Hauptmenu zur Messung
  if (mouseX > 400 && mouseX < 700 && (mouseY-translation) > 625 && (mouseY-translation) < 700 && menu && tutor == false) {
    menu = false;    
    messung = true;
    tutor = false;
    Konzentration1.show();
    Konzentration2.show();
    Konzentration3.show();
    ppmProMl.show();
  }

  if (mouseX > 400 && mouseX < 630 && mouseY > 700 && mouseY < 750 && messung && messungEinstellung && erlaubnis) {
    messungEinstellung = false;     
    Konzentration1.hide();
    Konzentration2.hide();
    Konzentration3.hide();
    ppmProMl.hide();
  }


  //Von Messung zurück zum Hauptmenu
  if (mouseX > 815 && mouseX < 915 && (mouseY-translation) > 900 && (mouseY-translation) < 950 && menu == false && messung) {
    menu = true;
    messung = false;
    tutor = false;
    settings = false;
    messungEinstellung = true;
  }


  //Starte Tutorial
  if (mouseX > 400 && mouseX < 700 && (mouseY-translation) > 525 && (mouseY-translation) < 600 && menu && messung == false) {
    tutor = true;
    messung = false;
    menu = false;
    settings = false;
  }


  if (messung && aktuellerZyklus == anzahlZyklen && mouseX > 350 && mouseX <450 && (mouseY-translation) > 550 && (mouseY-translation)< 590) {
    if (aktuelleKonzentration != anzahlKonzentrationen-1) {
      Aufforderung = true;
    } else {
      myPort.clear();
      wait = true;
      aktuellerZyklus = 0;
      Aufforderung = false;

      if (aktuelleKonzentration < anzahlKonzentrationen) {
        aktuelleKonzentration += 1;
      }
      if (aktuelleKonzentration == anzahlKonzentrationen) {
        auswertung = true;
      }
    }
  }

  if (messung && Aufforderung && aktuellerZyklus == anzahlZyklen && mouseX > 350 && mouseX > 450 && mouseX < 550 && (mouseY-translation) > 600 && (mouseY-translation) < 640) {
    myPort.clear();
    wait = true;
    aktuellerZyklus = 0;
    Aufforderung = false;

    if (aktuelleKonzentration < anzahlKonzentrationen) {
      aktuelleKonzentration += 1;
    }
    if (aktuelleKonzentration == anzahlKonzentrationen) {
      auswertung = true;
    }
  }


  if (messung && mouseX > 475 && mouseX < 625 && mouseY > 500 && mouseY < 550 && aktuelleKonzentration == anzahlKonzentrationen) {
    erklaerung = false;
  }

  //Einstellungen - Resette alle Messwerte

  if (mouseX > 400 && mouseX < 500 && mouseY < 350 && mouseY > 300 && settings) {
    aktuelleKonzentration = 0;
    aktuellerZyklus = 0;
    // Alles auf null
    for (int i = 0; i < aktuelleKonzentration*(anzahlZyklen) + anzahlZyklen; i++) {
      for (int j = 0; j < 50; j++) {
        Messdaten[i][j] = 0;
      }
    }
  }

  ////


  if (tutor) {
    if (mouseX > 900 &&  mouseX < 1000 && (mouseY-translation) > 800 && (mouseY-translation) < 850 && seiteTutorial < 13 && seiteTutorial !=12) {
      if (seiteTutorial == 9) {
        MaxAktiv = true;
        SteigAktiv = true;
        MinAktiv = false;
        MWAktiv = false;
      }

      seiteTutorial += 1;
    }
   if (mouseX > 900 &&  mouseX < 1000 && (mouseY-translation) > 850 && (mouseY-translation) < 900 && seiteTutorial ==12) {
      seiteTutorial += 1;
    }
    if (mouseX > 50 &&  mouseX < 150 && (mouseY-translation) > 800 && (mouseY-translation) < 850 && seiteTutorial > 0 && seiteTutorial != 12) {
      seiteTutorial -= 1;
    }
    if (mouseX > 50 &&  mouseX < 150 && (mouseY-translation) > 850 && (mouseY-translation) < 900 && seiteTutorial > 0 && seiteTutorial == 12) {
      seiteTutorial -= 1;
    }
    //Man klickt auf Messung starten
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 225 && (mouseY-translation) < 275 && seiteTutorial == 1) {
      seiteTutorial += 1;
    }
    //Von Tutorial ins Hauptmenü
    if (mouseX > 450 &&  mouseX < 580 && (mouseY-translation) > 800 && (mouseY-translation) < 850 && seiteTutorial != 3) {
      tutor = false;
      menu = true;
      messung = false;
      seiteTutorial = 0;
      settings = false;
    }



    //Maximum ausgewählt
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 205 && (mouseY-translation) < 265 && seiteTutorial == 9) {
      if (MaxAktiv) {
        MaxAktiv = false;
      } else {
        MaxAktiv = true;
      }
    }
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 280 && (mouseY-translation) < 330 && seiteTutorial == 9) {

      if (MinAktiv) {
        MinAktiv = false;
      } else {
        MinAktiv = true;
      }
    }


    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 355 && (mouseY-translation) < 415 && seiteTutorial == 9) {

      if (SteigAktiv) {
        SteigAktiv = false;
      } else {
        SteigAktiv = true;
      }
    }

    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 430 && (mouseY-translation) < 480 && seiteTutorial == 9) {
      if (MWAktiv) {
        MWAktiv = false;
      } else {
        MWAktiv = true;
      }
    }
  }


  //Einstellungen öffnen
  if (mouseX > 400 && mouseX < 700 && (mouseY-translation) > 725 && (mouseY-translation) < 800 && menu) {
    settings = true;
    menu = false;
    tutor = false;
    messung = false;
  }

  //Einstellungen schließen
  if (mouseX > 400 && mouseX < 550 && mouseY > 400 && mouseY < 450 && settings) {
    menu = true;
    settings = false;
    tutor = false;
    messung = false;
  }
} 
