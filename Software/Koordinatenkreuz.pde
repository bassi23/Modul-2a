void Koordinatenkreuz() {
  fill(255);
  rect(250, 50, 500, 350);
  fill(0);
  stroke(0); 
  for (int i = 0; i < 20; i++) {
    stroke(200);
    line(250, 17.5*i + 50, 750, 17.5*i + 50);
    stroke(0);
  }
  for (int i = 0; i < 26; i++) {
    stroke(200);
    line(250 + 20*i, 50, 250 + 20*i, 400);
    stroke(0);
  }
  stroke(0); 
  line(250, 50, 250, 410);
  line(245, 55, 250, 50);
  line(250, 50, 255, 55);
  line(240, 400, 760, 400);
  line(755, 395, 760, 400);
  line(760, 400, 755, 405);

  // x Achse
  fill(0);
  text("0", 250, 420);
  text("25", 492, 420);
  text("50", 750, 420);
  text("Messpunkt (~Zeit)", 450, 440);


  // y-Achse
  text(nf(max/1000, 0, 1), 200, 50);
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  text("Widerstand [kΩ]", 250, -width/2 + 220);
  popMatrix();
}



float max = 0;
void NormalizeData() {
  max = 0;
  for (int i = 0; i < anzahlKonzentrationen*anzahlZyklen; i++) {
    for (int j = 0; j < 50; j++) {
      if (Messdaten[i][j] > max) {
        max = Messdaten[i][j];
      }
    }
  }

  for (int i = 0; i < 51; i++) {
    if (UnbekannteKonzentrationMessdaten[0][i] > max) {
      max = UnbekannteKonzentrationMessdaten[0][i];
    }
  }
}

void DatenZeichnen() {
  //Durchschnitt abgeschlossener Konzentrationen zeichnen
  for (int i = 0; i < anzahlKonzentrationen; i++) {
    for (int j = 0; j < 50; j++) {
      Durchschnitt[i][j] = 0;
    }
  }

  for (int k = 0; k < anzahlKonzentrationen; k++) {
    for (int i = 0; i < anzahlZyklen; i++) {
      for (int j = 0; j < 50; j++) {
        Durchschnitt[k][j] += Messdaten[k*anzahlZyklen + i][j];
      }
    }
  }


  for (int i = 0; i < anzahlKonzentrationen; i++) {
    for (int j = 0; j < 50; j++) {
      Durchschnitt[i][j] = Durchschnitt[i][j]/anzahlZyklen;
    }
  }

  //alte Durchschnittsaufnahmen
  textSize(14);
  if (aktuelleKonzentration == 0) {
    fill(0);
    noStroke();
    strokeWeight(1);
    text("0 ppm", 810, 150);
  } else if (aktuelleKonzentration == 1) {
    fill(0);
    noStroke();
    strokeWeight(1);
    text(Konzentration1Wert + " ppm", 810, 170);
  } else if (aktuelleKonzentration == 2) {
    noStroke();
    strokeWeight(1);
    text(Konzentration2Wert + " ppm", 810, 190);
  } else if (aktuelleKonzentration == 3) {
    noStroke();
    strokeWeight(1);
    text(Konzentration3Wert + " ppm", 810, 210);
  } else if (aktuelleKonzentration == 4 && unbekannteKonzentration == false) {
    noStroke();
    strokeWeight(1);
    text("40 ppm", 810, 230);
  } else {
    noStroke();
    strokeWeight(1);
    text("?? ppm", 810, 250);
  }



  for (int j = 0; j < aktuelleKonzentration; j++) {
    for (int i = 1; i < 50; i++) {
      if (j == 0) {
        fill(255, 0, 0);
        noStroke();
        strokeWeight(1);
        text("0 ppm", 810, 150);
        strokeWeight(2);
        stroke(255, 0, 0);
      } else if (j == 1) {
        fill(0, 0, 255);
        noStroke();
        strokeWeight(1);
        text(Konzentration1Wert + " ppm", 810, 170);
        strokeWeight(2);
        stroke(0, 0, 255);
      } else if (j == 2) {
        fill(0, 200, 0);
        noStroke();
        strokeWeight(1);
        text(Konzentration2Wert + " ppm", 810, 190);
        strokeWeight(2);
        stroke(0, 200, 0);
      } else if (j == 3) {
        fill(255, 0, 255);
        noStroke();
        strokeWeight(1);
        text(Konzentration3Wert + " ppm", 810, 210);
        strokeWeight(2);
        stroke(255, 0, 255);
      } else if (j == 4) {
        fill(255, 255, 0);
        noStroke();
        strokeWeight(1);
        text("40 ppm", 810, 230);
        strokeWeight(2);
        stroke(255, 255, 0);
      } 
      line(250 + 10*i, 400 - 350*Durchschnitt[j][i]/max, 250 + 10*(i-1), 400 - 350*Durchschnitt[j][i-1]/max);
    }
  }

  strokeWeight(1);


  //alte Aufnahmen der aktuellen Konzentration
  for (int i = aktuelleKonzentration*(anzahlZyklen); i < aktuelleKonzentration*(anzahlZyklen)+aktuellerZyklus; i++) {
    for (int j = 1; j < 50; j++) {
      stroke(100);
      line(250 + 10*j, 400 - 350*Messdaten[i][j]/max, 250 + 10*(j-1), 400 - 350*Messdaten[i][j-1]/max);
    }
  }


  //Aktuelle Aufnahme
  stroke(0);
  if (unbekannteKonzentration == false) {
    for (int i = 1; i < aktuellerMesspunkt; i++) {
      line(250 + 10*i, 400 - 350*Messdaten[aktuellerZyklus + aktuelleKonzentration*(anzahlZyklen)][i]/max, 250 + 10*(i-1), 400 - 350*Messdaten[aktuellerZyklus + aktuelleKonzentration*(anzahlZyklen)][i-1]/max);
    }
  }
  for (int i = 1; i < 50; i++) {
    line(250 + 10*i, 400 - 350*UnbekannteKonzentrationMessdaten[0][i]/max, 250 + 10*(i-1), 400 - 350*UnbekannteKonzentrationMessdaten[0][i-1]/max);
  }

  noStroke();
  //Hier befinden wir uns im Messablauf:
  textSize(14);
  fill(0);
  if (aktuellerZyklus+1 < 0) {
    text("abgeschlossene Zyklen: " + (0) + "/" + anzahlZyklen, 810, 20);
  } else {
    if (aktuellerZyklus == -1) {
      text("abgeschlossene Zyklen: " + (aktuellerZyklus+ 1) + "/" + anzahlZyklen, 810, 20);
    } else {
      text("abgeschlossene Zyklen: " + (aktuellerZyklus) + "/" + anzahlZyklen, 810, 20);
    }
  }
  text("Anzahl Zyklen: " + anzahlZyklen, 810, 60);
  text("Anzahl Konzentrationen: " + anzahlKonzentrationen, 810, 80);
  if (wait && messungGestartet) {
    textSize(30);
    text("Synchronisiere...", 410, 30);
    textSize(14);
  } else {
    text("Messpunkt: " + aktuellerMesspunkt + "/50", 810, 100);
  }
  if (aktuelleKonzentration != anzahlKonzentrationen) {
    int conc = 0;
    if (aktuelleKonzentration == 0) {
      conc = 0;
    }
    if (aktuelleKonzentration == 1) {
      conc = Konzentration1Wert;
    }
    if (aktuelleKonzentration == 2) {
      conc = Konzentration2Wert;
    }
    if (aktuelleKonzentration == 3) {
      conc = Konzentration3Wert;
    }
    if (aktuelleKonzentration == 4) {
      conc = 40;
    }



    text("Konzentration: " + conc + " ppm", 810, 40);
  } else {
    anzahlMerkmale = 0;
    if (MaxAktiv) {
      anzahlMerkmale+= 1;
    }
    if (MinAktiv) {
      anzahlMerkmale+= 1;
    }
    if (SteigAktiv) {
      anzahlMerkmale+= 1;
    }

    if (MWAktiv) {
      anzahlMerkmale+= 1;
    }


    if (unbekannteKonzentration == false) {
      fill(255);
      stroke(0);
      rect(800, 330, 240, 110);
      noStroke();
      fill(0);
      text("Anzahl ausgewählter Merkmale: " + anzahlMerkmale, 810, 40);
      if (anzahlMerkmale == 1) {
        text("Du hast momentan " + anzahlMerkmale + " Merkmal\nausgewählt.", 810, 350);
      } else {
        text("Du hast momentan " + anzahlMerkmale + " Merkmale\nausgewählt.", 810, 350);
      }
      if (anzahlMerkmale == 2) {
        text("Wenn du zufrieden bist, klicke\nauf 'weiter'.", 810, 400);
      } else {
        text("Wähle genau 2 Merkmale aus.", 810, 400);
      }
    }
  }
}




//Temperaturzyklus

void Temperaturzyklus() {
  pushMatrix();
  fill(255);
  noStroke();
  rect(250, 500, 500, 350);

  noFill();
  for (int i = 0; i < 20; i++) {
    stroke(200);
    line(250, 17.5*i +500, 750, 17.5*i + 500);
    stroke(0);
  }
  for (int i = 0; i < 26; i++) {
    stroke(200);
    line(250 + 20*i, 500, 250 + 20*i, 850);
    stroke(0);
  }

  strokeWeight(3);
  stroke(0);
  line(250, 510, 300, 510);

  line(300, 661, 500, 661);
  line(500, 510, 550, 510);
  line(550, 699, 750, 699);
  // Abgrenzungen zwischen Temperatursprüngen
  stroke(0);
  strokeWeight(2);
  for (int i = 0; i <44; i++) {
    ellipse(300, 504 + 8*i, 1, 1); 
    ellipse(500, 504 + 8*i, 1, 1); 
    ellipse(550, 504 + 8*i, 1, 1);
  }

  strokeWeight(1);
  stroke(150);
  line((aktuellerMesspunkt) * 10 + 250, 480, (aktuellerMesspunkt) * 10 + 250, 850);
  noStroke();

  stroke(0);
  line(250, 500, 250, 860);
  line(245, 505, 250, 500);
  line(250, 500, 255, 505);
  line(240, 850, 760, 850);
  line(755, 845, 760, 850);
  line(760, 850, 755, 855);
  fill(0);
  text("Messpunkt (~Zeit)", 450, 890);
  text("0", 250, 870);
  text("25", 492, 870);
  text("50", 750, 870);

  text("400", 210, 548);
  text("200", 210, 699);
  text("0", 210, 850);

  text("450 °C", 253, 535);
  text("250 °C", 380, 655);
  text("450 °C", 503, 535);
  text("200 °C", 630, 692);




  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  fill(0);
  text("Temperatur ϑ [°C]", -215, -350);
  popMatrix();

  popMatrix();
}
