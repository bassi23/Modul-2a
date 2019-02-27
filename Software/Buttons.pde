boolean messungGestartet = false;


void Buttons() {
  textSize(20);
  text("Merkmale", 75, 120);
  strokeWeight(4);
  if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 145 && (mouseY-translation) < 195) {
    fill(0, 0, 255, 20);
  } else {
    fill(100, 100, 255, 220);
  }
  //Maximum
  if (MaxAktiv) {
    strokeWeight(4);
    stroke(255);
  } else {
    strokeWeight(1);
    stroke(0);
  }
  rect(75, 145, 100, 50);
  if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 220 && (mouseY-translation) < 270) {
    fill(255, 100, 100, 20);
  } else {
    fill(255, 0, 0, 220);
  }
  //Minimum
  if (MinAktiv) {
    strokeWeight(4);
    stroke(255);
  } else {
    strokeWeight(1);
    stroke(0);
  }
  rect(75, 220, 100, 50);


  if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 295 && (mouseY-translation) < 345) {
    fill(255, 255, 0, 20);
  } else {
    fill(255, 255, 0, 220);
  }
  //Steigung
  if (SteigAktiv) {
    strokeWeight(4);
    stroke(255);
  } else {
    strokeWeight(1);
    stroke(0);
  }
  rect(75, 295, 100, 50);
  if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 370 && (mouseY-translation) < 420) {
    fill(0, 255, 0, 20);
  } else {
    fill(0, 255, 0, 220);
  }
  //Mittelwert
  if (MWAktiv) {
    strokeWeight(4);
    stroke(255);
  } else {
    stroke(0);
    strokeWeight(1);
  }
  rect(75, 370, 100, 50);
  // Start-Button
  strokeWeight(1);
  stroke(0);

  // Abbruch
  if (mouseX > 815 && mouseX < 915 && (mouseY-translation) > 350 && (mouseY-translation) < 400 && aktuelleKonzentration != anzahlKonzentrationen) {
    fill(255);
    if (mousePressed) {
      aktuellerZyklus = 0;
      wait = true;
      myPort.clear();
      // Wenn man nicht zufrieden ist, werden die Daten dieser Konzentration gelöscht
      for (int i = aktuelleKonzentration*(anzahlZyklen); i < aktuelleKonzentration*(anzahlZyklen) + anzahlZyklen; i++) {
        for (int j = 0; j < 50; j++) {
          Messdaten[i][j] = 0;
        }
      }
    }
  } else {
    fill(220);
  }

  if (aktuelleKonzentration != anzahlKonzentrationen) {
    rect(815, 350, 100, 50);
  }

  //


  if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 25 && (mouseY-translation) < 75) {
    fill(255);
    if (mousePressed && messungGestartet == false) {
      messungGestartet = true;
      myPort.clear();
    }
  } else {
    fill(220);
  }
  rect(75, 25, 100, 50);



  fill(0);
  textSize(16);
  text("Maximum", 87, 175);
  text("Minimum", 87, 250);
  text("Steigung", 90, 325);
  text("Mittelwert", 87, 400);
  text("Messung \n starten", 91, 45);
  if (aktuelleKonzentration != anzahlKonzentrationen) {
    text("  Messung\nwiederholen", 818, 368);
  }


  if (mouseX > 815 && mouseX < 915 && (mouseY-translation) > 900 && (mouseY-translation) < 950) {
    fill(255);
  } else {
    fill(220);
  }
  rect(815, 900, 100, 50);

  fill(0);
  text("Hauptmenu", 820, 930);
}
