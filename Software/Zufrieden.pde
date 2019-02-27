boolean auswertung = false;


void Zufrieden() {
  pushMatrix();
  fill(255);
  stroke(0);

  //Messagebox
  rect(200, 500, 600, 100);
  //Ja Button
  rect(350, 550, 100, 40);
  //Nein Button
  rect(550, 550, 100, 40);
  fill(0);
  textSize(30);
  if (aktuelleKonzentration < anzahlKonzentrationen + 1) {
    fill(255);
    stroke(0);
    //Messagebox
    rect(200, 500, 600, 150);
    if (Aufforderung == false) {
      //Ja Button
      if (mouseX > 350 && mouseX < 450 && (mouseY-translation) > 550 && (mouseY-translation) < 590) {
        fill(255);
      } else {
        fill(220);
      }
      rect(350, 550, 100, 40);
      //Nein Button
      if (mouseX > 550 && mouseX < 650 && (mouseY-translation) > 550 && (mouseY-translation) < 590) {
        fill(255);
      } else {
        fill(220);
      }
      rect(550, 550, 100, 40);
    } else {
      //weiter Button
      if (mouseX > 450 && mouseX < 550 && (mouseY-translation) > 600 && (mouseY-translation) < 640) {
        fill(255);
      } else {
        fill(220);
      }
      rect(450, 600, 100, 40);
    }
    fill(0);
    textSize(30);
    if (Aufforderung == false) {
      text("Bist du mit der Messung zufrieden?", 250, 533);
      text("Ja", 390, 580);
      text("Nein", 570, 580);
    } else {
      if (aktuelleKonzentration != anzahlKonzentrationen-1) {
        textSize(20);
        if (aktuelleKonzentration == 0) {
          float temp = Konzentration1Wert / ppmProMlWert;
          String temp2 = nf(temp, 0, 2);
          String temp3 = nf(round(Konzentration1Wert), 0, 0).replace('.', ',');
          text("Spritze nun " + temp2.replace('.', ',') + "ml in die Messkammer, um eine Konzen-\ntration von " + temp3 + " ppm zu erhalten.", 220, 533);
        }
        if (aktuelleKonzentration == 1) {
          float temp0 = Konzentration2Wert - Konzentration1Wert;
          float temp = temp0 / ppmProMlWert;
          String temp2 = nf(temp, 0, 2);
          String temp3 = nf(round(Konzentration2Wert), 0, 0).replace('.', ',');
          text("Spritze nun " + temp2.replace('.', ',') + "ml in die Messkammer, um eine Konzen-\ntration von " + temp3 + " ppm zu erhalten.", 220, 533);
        }
        if (aktuelleKonzentration == 2) {
          float temp0 = Konzentration3Wert - Konzentration2Wert;
          float temp = temp0 / ppmProMlWert;
          String temp2 = nf(temp, 0, 2);
          String temp3 = nf(round(Konzentration3Wert), 0, 0).replace('.', ',');
          text("Spritze nun " + temp2.replace('.', ',') + " ml in die Messkammer, um eine Konzen-\ntration von " + temp3 + " ppm zu erhalten.", 220, 533);
        }

        if (aktuelleKonzentration == 3) {
          float temp0 = 40 - Konzentration3Wert;
          float temp = temp0 / ppmProMlWert;
          String temp2 = nf(temp, 0, 2);
          text("Spritze nun " + temp2.replace('.', ',') + " ml in die Messkammer, um eine Konzen-\ntration von 40 ppm zu erhalten.", 220, 533);
        }

        textSize(26);
        text("weiter", 465, 630);
      }
    }
  }

  textSize(14);

  //Nicht zufrieden, Messung wiederholen
  if (mousePressed && mouseX > 550 && mouseX <650 && (mouseY-translation) > 550 && (mouseY-translation)< 590 ) {
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
  popMatrix();
}



void ErklaerungMerkmale() {
  if (erklaerung) {
    fill(200, 220);
    noStroke();
    rect(0, 0, width, height);
    fill(255);
    stroke(0);
    rect(50, 150, 950, 335);
    fill(0);
    noStroke();
    textSize(20);
    text("Bestimme nun die Unterschiede zwischen den Kurven. Du hast die Auswahl zwischen Maxi-\nmum, Minimum, Steigung und Mittelwert in verschiedenen Bereichen.", 60, 180);
    text("Klicke mit der Maus auf die Buttons auf der linken Seite, um ein Merkmal auszuwählen. Du\nkannst den Bereich, in dem diese Merkmale bestimmt werden, im Graphen verschieben,\nindem du mit der Maus in diesen Bereich klickst und die Maus gedrückt hälst.", 60, 270);
    text("Klickst du ein zweites Mal auf die linken Buttons wird deine Auswahl aufgehoben.", 60, 380);
    text("Wähle zwei Merkmale aus. Anschließend erscheint ein 'weiter' Button, der dich wieder in\nden Selbstlernkurs führt.", 60, 430);


    fill(255);
    if (mouseX > 475 && mouseX < 625 && mouseY > 500 && mouseY < 550) {
      fill(255);
    } else {
      fill(220);
    }
    stroke(0);
    rect(475, 500, 150, 50);
    fill(0);
    text("Verstanden", 495, 530);
  } else {
    preview();
    if (mouseX > 475 && mouseX < 575 && (mouseY-translation) > 900 && (mouseY-translation) < 950) {
      fill(200);
    } else {
      fill(255);
    }
    if (anzahlMerkmale == 2 && unbekannteKonzentration == false) {
      rect(475, 900, 100, 50);
      fill(0);
      text("weiter", 495, 930);
    }
  }
}






void preview() {
  fill(255);
  rect(120, 500, 360, 300);
  rect(520, 500, 360, 300);

  if (unbekannteKonzentration) {
    fill(255);
    textSize(20);
    text("Merkmale der unbekannten Konzentration:", 275, 860);
  }

  //Daten zwischen 0 und 1 normalisieren:
  float MerkmaleMaxMax = 0;
  float MerkmaleMinMax = 0;
  float MerkmaleMWMax = 0;

  float MerkmaleSlopeMax = 0;
  float MerkmaleSlopeMin = 999999999;



  for (int i = 0; i < anzahlKonzentrationen; i++) {
    for (int j = 0; j < anzahlZyklen; j++) {
      if (MerkmalMaximum[i*anzahlZyklen + j] > MerkmaleMaxMax) {
        MerkmaleMaxMax = MerkmalMaximum[i*anzahlZyklen + j]*1.115;
      }
      if (MerkmalMinimum[i*anzahlZyklen + j] > MerkmaleMinMax) {
        MerkmaleMinMax = MerkmalMinimum[i*anzahlZyklen + j]*1.115;
      }

      if (MerkmalMittelwert[i*anzahlZyklen + j] > MerkmaleMWMax) {
        MerkmaleMWMax = MerkmalMittelwert[i*anzahlZyklen + j]*1.115;
      }
      if (MerkmalSteigung[i*anzahlZyklen + j] > MerkmaleSlopeMax) {
        MerkmaleSlopeMax = MerkmalSteigung[i*anzahlZyklen + j];
      }      
      if (MerkmalSteigung[i*anzahlZyklen + j] < MerkmaleSlopeMin) {
        MerkmaleSlopeMin = MerkmalSteigung[i*anzahlZyklen + j];
      }
    }
  }
  pushMatrix();
  translate(width/2, height/2);
  rotate(3*PI/2);
  fill(0);
  text("kΩ", -125, -420);
  text("0", -265, -420);
  stroke(200);
  line(10, -405, 10, -45);
  line(10, -5, 10, 355);
  popMatrix();

  int anz = 0;
  if(MaxAktiv){
    anz += 1;
  }
  if(MinAktiv){
    anz += 1;
  }
  if(MWAktiv){
    anz += 1;
  }

  if (SteigAktiv && anz == 1) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(3*PI/2);
    fill(0);
    text("kΩ/Messpunkt", -160, -20);
    text(round(MerkmaleSlopeMax/1000), -10, -20);
    text(round(MerkmaleSlopeMin/1000), -255, -20);
    stroke(200);
    line(-230, -5, -230, 355);
    popMatrix();
  } else {
    pushMatrix();
    translate(width/2, height/2);
    rotate(3*PI/2);
    fill(0);
    text("kΩ", -125, -20);
    text("0", -265, -20);
    popMatrix();
  }
  stroke(0);

  textAlign(CENTER);

  if (MaxAktiv && MinAktiv && MWAktiv == false && SteigAktiv == false) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(3*PI/2);
    fill(0);
    text(round(MerkmaleMaxMax/1000),  10, -420);
    text(round(MerkmaleMinMax/1000), 10, -20);
    popMatrix();



    fill(0, 0, 255, 50); 
    rect(120, 500, 360, 300);
    fill(255, 0, 0, 50);
    rect(520, 500, 360, 300);
    fill(0);
    textSize(18);
    text("Maximum", 295, 485);
    text("Minimum", 695, 485);
    for (int i = 0; i < anzahlKonzentrationen; i++) {
      for (int j = 0; j < anzahlZyklen; j++) {
        noStroke();
        if (i == 0) {
          fill(255, 0, 0, 100);
        } else if (i == 1) {
          fill(0, 0, 255, 100);
        } else if (i == 2) {
          fill(0, 200, 0, 100);
        } else if (i == 3) {
          fill(255, 0, 255, 100);
        } else if (i == 4) {
          fill(255, 255, 0, 100);
        }

        ellipse(150 + 60*i, 800 - 300*MerkmalMaximum[i*anzahlZyklen + j]/MerkmaleMaxMax, 10, 10);
        ellipse(550 + 60*i, 800 - 300*MerkmalMinimum[i*anzahlZyklen + j]/MerkmaleMinMax, 10, 10);
      }
    }

    if (unbekannteKonzentration) {
      fill(0, 100);
      ellipse(450, 800 - 300*MerkmalMaximumUnbekannt/MerkmaleMaxMax, 10, 10);
      ellipse(850, 800 - 300*MerkmalMinimumUnbekannt/MerkmaleMinMax, 10, 10);
      fill(255);

      text("Maximum: " + int(MerkmalMaximumUnbekannt)/1000  + " kΩ", 500, 910);
      text("Minimum: " + int(MerkmalMinimumUnbekannt)/1000  + " kΩ", 500, 940);
    }
  } else if (MaxAktiv && SteigAktiv && MWAktiv == false && MinAktiv == false) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(3*PI/2);
    fill(0);
    text(round(MerkmaleMaxMax/1000), 10, -420);
    popMatrix();

    fill(0, 0, 255, 50); 
    rect(120, 500, 360, 300);
    fill(255, 255, 0, 50);
    rect(520, 500, 360, 300);
    fill(0);
    textSize(18);
    text("Maximum", 295, 485);
    text("Steigung", 695, 485);
    for (int i = 0; i < anzahlKonzentrationen; i++) {
      for (int j = 0; j < anzahlZyklen; j++) {
        noStroke();
        if (i == 0) {
          fill(255, 0, 0, 100);
        } else if (i == 1) {
          fill(0, 0, 255, 100);
        } else if (i == 2) {
          fill(0, 200, 0, 100);
        } else if (i == 3) {
          fill(255, 0, 255, 100);
        } else if (i == 4) {
          fill(255, 255, 0, 100);
        }

        ellipse(150 + 60*i, 800 - 300*MerkmalMaximum[i*anzahlZyklen + j]/MerkmaleMaxMax, 10, 10);
        ellipse(550 + 60*i, 770 - 240*((MerkmalSteigung[i*anzahlZyklen + j]-MerkmaleSlopeMin)/(MerkmaleSlopeMax-MerkmaleSlopeMin)), 10, 10);
      }
    }



    if (unbekannteKonzentration) {
      fill(0, 100);
      ellipse(450, 800 - 300*MerkmalMaximumUnbekannt/MerkmaleMaxMax, 10, 10);
      ellipse(850, 800 - 300*(MerkmalSteigungUnbekannt-MerkmaleSlopeMin)/(MerkmaleSlopeMax-MerkmaleSlopeMin), 10, 10);
      fill(255);
      text("Maximum: " + int(MerkmalMaximumUnbekannt)/1000  + " kΩ", 500, 910);
      text("Steigung: " + int(MerkmalSteigungUnbekannt)/1000  + " kΩ/Messpunkt", 500, 940);
    }
  } else if (MaxAktiv && MWAktiv && MinAktiv == false && SteigAktiv == false) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(3*PI/2);
    fill(0);
    text(round(MerkmaleMaxMax/1000), 10, -420);
    text(round(MerkmaleMWMax/1000), 10, -20);
    popMatrix();
    fill(0, 0, 255, 50); 
    rect(120, 500, 360, 300);
    fill(0, 255, 0, 50);
    rect(520, 500, 360, 300);
    fill(0);
    textSize(18);
    text("Maximum", 295, 485);
    text("Mittelwert", 695, 485);
    for (int i = 0; i < anzahlKonzentrationen; i++) {
      for (int j = 0; j < anzahlZyklen; j++) {
        noStroke();
        if (i == 0) {
          fill(255, 0, 0, 100);
        } else if (i == 1) {
          fill(0, 0, 255, 100);
        } else if (i == 2) {
          fill(0, 200, 0, 100);
        } else if (i == 3) {
          fill(255, 0, 255, 100);
        } else if (i == 4) {
          fill(255, 255, 0, 100);
        }

        ellipse(150 + 60*i, 800 - 300*MerkmalMaximum[i*anzahlZyklen + j]/MerkmaleMaxMax, 10, 10);
        ellipse(550 + 60*i, 800 - 300*(MerkmalMittelwert[i*anzahlZyklen + j]/MerkmaleMWMax), 10, 10);
      }
    }


    if (unbekannteKonzentration) {
      fill(0, 100);
      ellipse(450, 800 - 300*MerkmalMaximumUnbekannt/MerkmaleMaxMax, 10, 10);
      ellipse(850, 800 - 300*MerkmalMittelwertUnbekannt/MerkmaleMWMax, 10, 10);
      fill(255);

      text("Maximum: " + int(MerkmalMaximumUnbekannt)/1000  + " kΩ", 500, 910);
      text("Mittelwert: " + int(MerkmalMittelwertUnbekannt)/1000  + " kΩ", 500, 940);
    }
  } else if (MinAktiv && MWAktiv && MaxAktiv == false && SteigAktiv == false) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(3*PI/2);
    fill(0);
    text(round(MerkmaleMinMax/1000), 10, -420);
    text(round(MerkmaleMWMax/1000), 10, -20);
    popMatrix();
    fill(255, 0, 0, 50); 
    rect(120, 500, 360, 300);
    fill(0, 255, 0, 50);
    rect(520, 500, 360, 300);
    fill(0);
    textSize(18);
    text("Minimum", 265, 485);
    text("Mittelwert", 665, 485);
    for (int i = 0; i < anzahlKonzentrationen; i++) {
      for (int j = 0; j < anzahlZyklen; j++) {
        noStroke();
        if (i == 0) {
          fill(255, 0, 0, 100);
        } else if (i == 1) {
          fill(0, 0, 255, 100);
        } else if (i == 2) {
          fill(0, 200, 0, 100);
        } else if (i == 3) {
          fill(255, 0, 255, 100);
        } else if (i == 4) {
          fill(255, 255, 0, 100);
        }

        ellipse(150 + 60*i, 800 - 300*MerkmalMinimum[i*anzahlZyklen + j]/MerkmaleMinMax, 10, 10);
        ellipse(550 + 60*i, 800 - 300*(MerkmalMittelwert[i*anzahlZyklen + j]/MerkmaleMWMax), 10, 10);
      }
    }


    if (unbekannteKonzentration) {
      fill(0, 100);
      ellipse(450, 800 - 300*MerkmalMinimumUnbekannt/MerkmaleMinMax, 10, 10);
      ellipse(850, 800 - 300*MerkmalMittelwertUnbekannt/MerkmaleMWMax, 10, 10);

      fill(255);
      text("Minimum: " + int(MerkmalMinimumUnbekannt)/1000  + " kΩ", 500, 910);
      text("Mittelwert: " + int(MerkmalMittelwertUnbekannt)/1000  + " kΩ", 500, 940);
    }
  } else if (MinAktiv && SteigAktiv && MaxAktiv == false && MWAktiv == false) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(3*PI/2);
    fill(0);
    text(round(MerkmaleMinMax/1000), 10, -420);
    popMatrix();
    fill(255, 0, 0, 50); 
    rect(120, 500, 360, 300);
    fill(255, 255, 0, 50);
    rect(520, 500, 360, 300);
    fill(0);
    textSize(18);
    text("Minimum", 295, 485);
    text("Steigung", 695, 485);
    for (int i = 0; i < anzahlKonzentrationen; i++) {
      for (int j = 0; j < anzahlZyklen; j++) {
        noStroke();
        if (i == 0) {
          fill(255, 0, 0, 100);
        } else if (i == 1) {
          fill(0, 0, 255, 100);
        } else if (i == 2) {
          fill(0, 200, 0, 100);
        } else if (i == 3) {
          fill(255, 0, 255, 100);
        } else if (i == 4) {
          fill(255, 255, 0, 100);
        }

        ellipse(150 + 60*i, 800 - 300*MerkmalMinimum[i*anzahlZyklen + j]/MerkmaleMinMax, 10, 10);
        ellipse(550 + 60*i, 750 - 280*((MerkmalSteigung[i*anzahlZyklen + j]-MerkmaleSlopeMin)/(MerkmaleSlopeMax-MerkmaleSlopeMin)), 10, 10);
      }
    }



    if (unbekannteKonzentration) {
      fill(0, 100);
      ellipse(450, 800 - 300*MerkmalMinimumUnbekannt/MerkmaleMinMax, 10, 10);
      ellipse(850, 800 - 300*(MerkmalSteigungUnbekannt-MerkmaleSlopeMin)/(MerkmaleSlopeMax-MerkmaleSlopeMin), 10, 10);

      fill(255);
      text("Minimum: " + int(MerkmalMinimumUnbekannt)/1000  + " kΩ", 500, 910);
      text("Steigung: " + int(MerkmalSteigungUnbekannt)/1000  + " kΩ/Messpunkt", 500, 940);
    }
  } else if (MWAktiv && SteigAktiv && MaxAktiv == false && MinAktiv == false) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(3*PI/2);
    fill(0);
    text(round(MerkmaleMWMax/1000), 10, -420);
    popMatrix();
    fill(0, 255, 0, 50); 
    rect(120, 500, 360, 300);
    fill(255, 255, 0, 50);
    rect(520, 500, 360, 300);
    fill(0);
    textSize(18);
    text("Mittelwert", 295, 485);
    text("Steigung", 695, 485);
    for (int i = 0; i < anzahlKonzentrationen; i++) {
      for (int j = 0; j < anzahlZyklen; j++) {
        noStroke();
        if (i == 0) {
          fill(255, 0, 0, 100);
        } else if (i == 1) {
          fill(0, 0, 255, 100);
        } else if (i == 2) {
          fill(0, 200, 0, 100);
        } else if (i == 3) {
          fill(255, 0, 255, 100);
        } else if (i == 4) {
          fill(255, 255, 0, 100);
        }

        ellipse(150 + 60*i, 800 - 300*(MerkmalMittelwert[i*anzahlZyklen + j]/MerkmaleMWMax), 10, 10);
        ellipse(550 + 60*i, 750 - 280*((MerkmalSteigung[i*anzahlZyklen + j]-MerkmaleSlopeMin)/(MerkmaleSlopeMax-MerkmaleSlopeMin)), 10, 10);
      }
    }



    if (unbekannteKonzentration) {
      fill(0, 100);
      ellipse(450, 800 - 300*MerkmalMittelwertUnbekannt/MerkmaleMWMax, 10, 10);
      ellipse(850, 800 - 300*(MerkmalSteigungUnbekannt-MerkmaleSlopeMin)/(MerkmaleSlopeMax-MerkmaleSlopeMin), 10, 10);
      fill(255);

      text("Mittelwert: " + int(MerkmalMittelwertUnbekannt)/1000  + " kΩ", 500, 910);
      text("Steigung: " + int(MerkmalSteigungUnbekannt)/1000  + " kΩ/Messpunkt", 500, 940);
    }
  }

  stroke(0);
  for (int i = 0; i < 5; i++) {
    line(180 + 60*i, 500, 180 + 60*i, 810);
    line(580 + 60*i, 500, 580 + 60*i, 810);
  }
  textAlign(CORNER);
  fill(0);
  noStroke();
  textSize(14);
  text("0 ppm", 130, 820);
  text(Konzentration1Wert + " ppm", 185, 820);
  text(Konzentration2Wert + " ppm", 245, 820);
  text(Konzentration3Wert + " ppm", 305, 820);
  text("40 ppm", 365, 820);
  text("?? ppm", 425, 820);

  text("0ppm", 530, 820);
  text(Konzentration1Wert + " ppm", 585, 820);
  text(Konzentration2Wert + " ppm", 645, 820);
  text(Konzentration3Wert + " ppm", 705, 820);
  text("40 ppm", 765, 820);
  text("?? ppm", 825, 820);
  stroke(0);
  textSize(20);
}
