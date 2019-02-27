boolean tutor = false;

int seiteTutorial = 0;



void tutorial() {
  pushMatrix();
  for (int i = 0; i < 1500; i++) {
    stroke(255 - 255 * i / 2500);
    line(0, i, width, i);
  }

  if (seiteTutorial == 0) {
    seite0();
  } else if (seiteTutorial == 1) {
    seite1();
  } else if (seiteTutorial == 2) {
    seite2();
  } else if (seiteTutorial == 3) {
    seite3();
  } else if (seiteTutorial == 4) {
    seite4();
  } else if (seiteTutorial == 5) {
    seite5();
  } else if (seiteTutorial == 6) {
    seite6();
  } else if (seiteTutorial == 7) {
    seite7();
  } else if (seiteTutorial == 8) {
    seite8();
  } else if (seiteTutorial == 9) {
    seite9();
  } else if (seiteTutorial == 10) {
    seite10();
  } else if (seiteTutorial == 11) {
    seite11();
  } else if (seiteTutorial == 12) {
    seite12();
  } else if (seiteTutorial == 13) {
    seite13();
  }

  //zurück
  if (seiteTutorial > 0) {
    if (mouseX > 50 &&  mouseX < 150 && (mouseY-translation) > 800 &&(mouseY-translation) < 850) {
      fill(255);
    } else {
      fill(220);
    }
    if (seiteTutorial == 12) {
      if (mouseX > 50 &&  mouseX < 150 && (mouseY-translation) > 850 &&(mouseY-translation) < 900) {
        fill(255);
      } else {
        fill(220);
      }
    }
    rect(50, 800, 100, 50);
    fill(0);
    text("zurück", 65, 830);
  }
  if (seiteTutorial < 13) {
    if (mouseX > 900 &&  mouseX < 1000 && (mouseY-translation) > 800 && (mouseY-translation) < 850) {
      fill(255);
    } else {
      fill(220);
    }    
    if (seiteTutorial == 12) {
      if (mouseX > 900 &&  mouseX < 1000 && (mouseY-translation) > 850 &&(mouseY-translation) < 900) {
        fill(255);
      } else {
        fill(220);
      }
    }
    rect(900, 800, 100, 50);
    fill(0);
    text("weiter", 920, 830);
  }



  if (seiteTutorial != 3) {
    if (mouseX > 450 &&  mouseX < 580 && (mouseY-translation) > 800 && (mouseY-translation) < 850) {
      fill(255);
    } else {
      fill(220);
    }
    if (seiteTutorial == 12) {
      if (mouseX > 450 &&  mouseX < 580 && (mouseY-translation) > 850 &&(mouseY-translation) < 900) {
        fill(255);
      } else {
        fill(220);
      }
    }
      rect(450, 800, 130, 50);
      fill(0);
      text("Hauptmenü", 460, 830);
    }
    popMatrix();
  }



  void seite0() {
    fill(0);
    textSize(20);
    text("Willkommen zum Tutorial des Kalibrierprogramms!", 20, 50);
    textSize(16);
    fill(255);
    rect(10, 130, 1000, 75);

    fill(0);


    text("Hier wird dir der Ablauf des Versuchs erklärt. Sobald du das Tutorial abgeschlossen hast, kannst du loslegen.", 20, 150);
    text("Klicke auf 'weiter', um den nächsten Schritt anzuzeigen. Du kannst jederzeit wieder Schritte zurückgehen, oder das Tutorial\nbeenden.", 20, 174);
    textSize(20);
  }
  void seite1() {
    textSize(16);
    fill(255);
    rect(10, 25, 1000, 90);
    fill(0);
    text("Im Programm gibt es einen Graphen, auf dem die gemessenen Widerstände gegen die Zeit aufgetragen sind. Ein Durchlauf ent-\nspricht einem Temperaturzyklus. Sobald auf auf 'Messung starten' klickst, wird der Sensor zunächst mit dem Programm syn-\nchronisiert. Anschließend werden die Messwerte live eingetragen. ", 20, 50);
    translate(0, 200);

    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 225 && (mouseY-translation) < 275) {
      fill(255);
    } else {
      fill(220);
    }
    textSize(16);
    rect(75, 25, 100, 50);
    fill(0);
    text("Messung \n starten", 91, 45);  

    Koordinatenkreuz();
    translate(0, -200);
    textSize(20);

    noFill();
    stroke(255, 0, 0);
    strokeWeight(4);
    ellipse(125, 250, 150, 100);

    strokeWeight(1);
    stroke(0);
  }



  float fakeZyklus[] = {1, 1, 1, 1, 1, 4, 3.9, 3.8, 3.7, 3.6, 3.55, 3.5, 3.47, 3.43, 3.4, 3.36, 3.32, 3.3, 3.28, 3.27, 3.26, 3.25, 3.24, 3.23, 3.22, 1, 1, 1, 1, 1, 5, 4.9, 4.8, 4.7, 4.6, 4.55, 4.5, 4.47, 4.43, 4.4, 4.36, 4.32, 4.3, 4.28, 4.27, 4.26, 4.25, 4.24, 4.23, 4.22};
  float timerTutorial = 0;

  void seite2() {
    textSize(16);
    text("Ein solcher Messablauf kann beispielsweise so aussehen:", 20, 50);

    if (timerTutorial < 10) {
      textSize(30);
      text("Synchronisiere...", 400, 200);
    }
    translate(0, 200);

    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 225 && (mouseY-translation) < 275) {
      fill(255);
    } else {
      fill(220);
    }
    textSize(16);
    rect(75, 25, 100, 50);
    fill(0);
    text("Messung \n starten", 91, 45);

    Koordinatenkreuz();
    translate(0, -200);

    for (int i = 1; i < (timerTutorial - 10); i++) {
      if (i > 0 && i < 50) {
        line(250 + 10*i, 600-70*fakeZyklus[i], 250 + 10*(i-1), 600-70*fakeZyklus[i-1]);
      }
    }
    for (int i = 220; i < 270; i++) {
      stroke(255 - 255 * i / 2500);
      line(200, i, 245, i);
    }
    textSize(16);
    fill(0);
    text(200, 198, 249);
    textSize(20);
    stroke(0);

    timerTutorial +=0.1;

    if (timerTutorial > 100) {
      timerTutorial = 0;
    }
  }




  void seite3() {
    textSize(16);
    text("Unterhalb des Zeit-Widerstands-Graphen, siehst du den Temperaturzyklus.", 20, 50);

    if (timerTutorial < 10) {
      textSize(30);
      text("Synchronisiere...", 400, 200);
    }
    translate(0, 50);

    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 75 && (mouseY-translation) < 125) {
      fill(255);
    } else {
      fill(220);
    }
    textSize(16);
    rect(75, 25, 100, 50);
    fill(0);
    text("Messung \n starten", 91, 45);

    Koordinatenkreuz();
    translate(0, -200);

    for (int i = 1; i < (timerTutorial - 10); i++) {
      if (i > 0 && i < 50) {
        line(250 + 10*i, 600-70*fakeZyklus[i], 250 + 10*(i-1), 600-70*fakeZyklus[i-1]);
      }
    }
    for (int i = 70; i < 120; i++) {
      stroke(255 - 255 * i / 2500);
      line(200, (i+150), 245, (i+150));
    }
    textSize(16);
    fill(0);
    text(200, 198, 249);
    textSize(20);
    stroke(0);

    timerTutorial +=0.1;

    if (timerTutorial > 100) {
      timerTutorial = 0;
    }

    translate(0, 175);
    textSize(16);
    Temperaturzyklus();
    textSize(20);
    translate(0, -25);
  }


  void seite4() {
    textSize(20);
    text("Auf der rechten Seite werden dir die folgenden Informationen angezeigt:", 20, 50);
    textSize(16);
    fill(255);
    rect(95, 75, 870, 80);

    fill(0);
    text("1) abgeschlossene Zyklen: Für jede Konzentration sollst du 10 Messkurven aufnehmen", 100, 100);
    text("2) Konzentration: Eine Info für dich, welche Konzentration sich momentan in der Messkammer befinden sollte", 100, 120);
    text("3) Messpunkt: Zeigt an, an welchem Punkt im Zyklus sich der Sensor befindet", 100, 140);

    textSize(14);
    text("abgeschlossene Zyklen: 1/10", 800, 250);
    text("Konzentration: 0 ppm", 800, 270);
    text("Messpunkt: 37/50", 800, 290);

    translate(0, 200);
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 225 && (mouseY-translation) < 275) {
      fill(255);
    } else {
      fill(220);
    }
    textSize(16);
    rect(75, 25, 100, 50);
    fill(0);
    text("Messung \n starten", 91, 45);

    Koordinatenkreuz();
    translate(0, -200);

    for (int i = 1; i < 50; i++) {
      line(250 + 10*i, 600-70*fakeZyklus[i], 250 + 10*(i-1), 600-70*fakeZyklus[i-1]);
    }
    for (int i = 220; i < 270; i++) {
      stroke(255 - 255 * i / 2500);
      line(200, i, 245, i);
    }
    textSize(16);
    fill(0);
    text(200, 198, 249);
    textSize(20);
    noFill();
    stroke(255, 0, 0);
    strokeWeight(4);
    ellipse(900, 265, 240, 120);

    strokeWeight(1);
    stroke(0);
  }



  void seite5() {
    textSize(16);
    text("Wenn 10 Messkurven aufgenommen wurden, wirst du gefragt, ob du mit der Messung zufrieden bist:", 20, 50);


    textSize(14);
    text("abgeschlossene Zyklen: 10/10", 800, 100);
    text("Konzentration: 0 ppm", 800, 120);
    text("Messpunkt: 50/50", 800, 140);

    translate(0, 50);
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 125 && (mouseY-translation) < 175) {
      fill(255);
    } else {
      fill(220);
    }
    textSize(16);
    rect(75, 25, 100, 50);
    fill(0);
    text("Messung \n starten", 91, 45);

    Koordinatenkreuz();
    translate(0, -50);


    for (int j = 0; j < 10; j++) {
      for (int i = 1; i < 50; i++) {
        line(250 + 10*i, 450-70*fakeZyklus[i]/(0.1*j + 1), 250 + 10*(i-1), 450-70*fakeZyklus[i-1]/(0.1*j + 1));
      }
    }

    for (int i = 70; i < 120; i++) {
      stroke(255 - 255 * i / 2500);
      line(200, i, 245, i);
    }
    textSize(16);
    fill(0);
    text(200, 198, 99);
    textSize(20);
    stroke(0);

    translate(0, 60);



    fill(255);
    stroke(0);

    //Messagebox
    rect(200, 450, 600, 100);
    //Ja Button
    rect(350, 500, 100, 40);
    //Nein Button
    rect(550, 500, 100, 40);
    fill(0);
    textSize(30);
    //Ja Button
    if (mouseX > 350 && mouseX < 450 && (mouseY-translation) > 560 && (mouseY-translation) < 600) {
      fill(255);
    } else {
      fill(220);
    }
    rect(350, 500, 100, 40);
    //Nein Button
    if (mouseX > 550 && mouseX < 650 && (mouseY-translation) > 560 && (mouseY-translation) < 600) {
      fill(255);
    } else {
      fill(220);
    }
    rect(550, 500, 100, 40);
    fill(0);
    textSize(30);
    text("Bist du mit der Messung zufrieden?", 250, 483);
    text("Ja", 390, 530);
    text("Nein", 570, 530);
    noFill();
    stroke(255, 0, 0);
    strokeWeight(3);

    ellipse(500, 500, 750, 100);

    strokeWeight(1);
    translate(0, -60);
    stroke(0);
    textSize(20);
  }



  void seite6() {
    textSize(16);
    text("Wenn 10 Messkurven aufgenommen wurden, wirst du gefragt, ob du mit der Messung zufrieden bist:", 20, 50);


    textSize(14);
    text("abgeschlossene Zyklen: 10/10", 800, 100);
    text("Konzentration: 0 ppm", 800, 120);
    text("Messpunkt: 50/50", 800, 140);

    translate(0, 50);
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 75 && (mouseY-translation) < 125) {
      fill(255);
    } else {
      fill(220);
    }
    textSize(16);
    rect(75, 25, 100, 50);
    fill(0);
    text("Messung \n starten", 91, 45);

    Koordinatenkreuz();
    translate(0, -50);

    strokeWeight(1);
    for (int j = 0; j < 10; j++) {
      for (int i = 1; i < 50; i++) {
        line(250 + 10*i, 450-70*fakeZyklus[i]/(0.1*j+1), 250 + 10*(i-1), 450-70*fakeZyklus[i-1]/(0.1*j+1));
      }
    }
    strokeWeight(1);
    for (int i = 70; i < 120; i++) {
      stroke(255 - 255 * i / 2500);
      line(200, i, 245, i);
    }
    textSize(16);
    fill(0);
    text(200, 198, 99);
    textSize(20);
    stroke(0);

    translate(0, 60);
    fill(255);
    stroke(0);

    //Messagebox
    rect(200, 450, 600, 100);
    //Ja Button
    rect(350, 500, 100, 40);
    //Nein Button
    rect(550, 500, 100, 40);
    fill(0);
    textSize(30);
    //Ja Button
    if (mouseX > 350 && mouseX < 450 && (mouseY-translation) > 560 && (mouseY-translation) < 600) {
      fill(255);
    } else {
      fill(220);
    }
    rect(350, 500, 100, 40);
    //Nein Button
    if (mouseX > 550 && mouseX < 650 && (mouseY-translation) > 560 && (mouseY-translation) < 600) {
      fill(255);
    } else {
      fill(220);
    }
    rect(550, 500, 100, 40);
    fill(0);
    textSize(30);
    text("Bist du mit der Messung zufrieden?", 250, 483);
    text("Ja", 390, 530);
    text("Nein", 570, 530);
    translate(0, -60);
    textSize(16);
    noFill();
    strokeWeight(4);
    stroke(255, 0, 0);
    ellipse(600, 580, 120, 60);
    fill(0);
    strokeWeight(1);
    fill(255);
    stroke(0);
    rect(150, 640, 700, 110);

    fill(0);
    noStroke();
    text("Das Ethanol braucht eine gewisse Zeit bis es sich gleichmäßig in der Messkammer ver-\nteilt hat. In dieser Zeit ändert sich das Messignal noch deutlich (siehe oben).\nWenn du auf 'Nein' klickst, werden die Messkurven der aktuellen Konzentration gelöscht,\nund erneut 10 Zyklen aufgenommen.", 160, 662);
    //text("Wenn du auf 'Nein' klickst, wird die Messung wiederholt. Du kannst jederzeit die Messung durch Klicken auf den Button 'Messung\nwiederholen' klicken (beispielsweise, wenn abzusehen ist, dass die 10 Messkurven stark voneinander abweichen).", 20, 660);
    //stroke(0);
    //if (mouseX > 810 && mouseX < 930 && mouseY > 400 && mouseY < 450) {
    //  fill(255);
    //} else {
    //  fill(220);
    //}
    //rect(810, 400, 120, 50);
    //fill(0);
    //text("  Messung\nwiederholen", 825, 418);
    textSize(20);
    stroke(0);
  }


  void seite7() {
    textSize(16);
    text("Wenn 10 Messkurven aufgenommen wurden, wirst du gefragt, ob du mit der Messung zufrieden bist:", 20, 50);


    textSize(14);
    text("abgeschlossene Zyklen: 5/10", 800, 100);
    text("Konzentration: 0 ppm", 800, 120);
    text("Messpunkt: 50/50", 800, 140);

    translate(0, 50);
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 75 && (mouseY-translation) < 125) {
      fill(255);
    } else {
      fill(220);
    }
    textSize(16);
    rect(75, 25, 100, 50);
    fill(0);
    text("Messung \n starten", 91, 45);

    Koordinatenkreuz();
    translate(0, -50);

    for (int j = 0; j < 5; j++) {
      for (int i = 1; i < 50; i++) {
        line(250 + 10*i, 450-70*fakeZyklus[i]/(0.05*j+1), 250 + 10*(i-1), 450-70*fakeZyklus[i-1]/(0.05*j+1));
      }
    }
    for (int i = 70; i < 120; i++) {
      stroke(255 - 255 * i / 2500);
      line(200, i, 245, i);
    }
    textSize(16);
    fill(0);
    text(200, 198, 99);
    textSize(20);
    stroke(0);

    translate(0, 60);

    fill(255);
    stroke(0);

    //Messagebox
    rect(200, 450, 600, 100);
    //Ja Button
    rect(350, 500, 100, 40);
    //Nein Button
    rect(550, 500, 100, 40);
    fill(0);
    textSize(30);
    //Ja Button
    if (mouseX > 350 && mouseX < 450 && (mouseY-translation) > 560 && (mouseY-translation) < 600) {
      fill(255);
    } else {
      fill(220);
    }
    rect(350, 500, 100, 40);
    //Nein Button
    if (mouseX > 550 && mouseX < 650 && (mouseY-translation) > 560 && (mouseY-translation) < 600) {
      fill(255);
    } else {
      fill(220);
    }
    rect(550, 500, 100, 40);
    fill(0);
    textSize(30);
    text("Bist du mit der Messung zufrieden?", 250, 483);
    text("Ja", 390, 530);
    text("Nein", 570, 530);
    translate(0, -60);
    textSize(16);
    fill(255);
    stroke(0);
    rect(150, 640, 700, 110);

    fill(0);
    noStroke();
    text("Wenn du bereits nach wenigen Zyklen merkst, dass das Ethanol sich noch nicht gleich-\nmäßig verteilt hat, kannst auch direkt auf 'Messung wiederholen' klicken.\nAuch dann werden die Zyklen dieser Konzentration gelöscht, und die 10 Zyklen starten\nerneut.", 160, 662);
    //text("Wenn du auf 'Nein' klickst, wird die Messung wiederholt. Du kannst jederzeit die Messung durch Klicken auf den Button 'Messung\nwiederholen' klicken (beispielsweise, wenn abzusehen ist, dass die 10 Messkurven stark voneinander abweichen).", 20, 660);
    stroke(0);
    if (mouseX > 810 && mouseX < 930 && mouseY > 400 && mouseY < 450) {
      fill(255);
    } else {
      fill(220);
    }
    rect(810, 400, 120, 50);
    fill(0);
    text("  Messung\nwiederholen", 825, 418);
    noFill();
    strokeWeight(4);
    stroke(255, 0, 0);
    ellipse(870, 425, 120, 60);
    strokeWeight(1);
    textSize(20);
    stroke(0);
  }



  void seite8() {
    textSize(16);
    text("Wenn 10 Messkurven aufgenommen wurden, wirst du gefragt, ob du mit der Messung zufrieden bist:", 20, 50);


    textSize(14);
    text("abgeschlossene Zyklen: 10/10", 800, 100);
    text("Konzentration: 0 ppm", 800, 120);
    text("Messpunkt: 50/50", 800, 140);

    translate(0, 50);
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 75 && (mouseY-translation) < 125) {
      fill(255);
    } else {
      fill(220);
    }
    textSize(16);
    rect(75, 25, 100, 50);
    fill(0);
    text("Messung \n starten", 91, 45);

    Koordinatenkreuz();
    translate(0, -50);

    for (int j = 0; j < 10; j++) {
      for (int i = 1; i < 50; i++) {
        line(250 + 10*i, 450-70*fakeZyklus[i]/(0.003*j+1), 250 + 10*(i-1), 450-70*fakeZyklus[i-1]/(0.003*j+1));
      }
    }
    for (int i = 70; i < 120; i++) {
      stroke(255 - 255 * i / 2500);
      line(200, i, 245, i);
    }
    textSize(16);
    fill(0);
    text(200, 198, 99);
    textSize(20);
    stroke(0);

    translate(0, 60);
    fill(255);
    stroke(0);

    //Messagebox
    rect(200, 450, 600, 100);
    //Ja Button
    rect(350, 500, 100, 40);
    //Nein Button
    rect(550, 500, 100, 40);
    fill(0);
    textSize(30);
    //Ja Button
    if (mouseX > 350 && mouseX < 450 && (mouseY-translation) > 560 && (mouseY-translation) < 600) {
      fill(255);
    } else {
      fill(220);
    }
    rect(350, 500, 100, 40);
    //Nein Button
    if (mouseX > 550 && mouseX < 650 && (mouseY-translation) > 560 && (mouseY-translation) < 600) {
      fill(255);
    } else {
      fill(220);
    }
    rect(550, 500, 100, 40);
    fill(0);
    textSize(30);
    text("Bist du mit der Messung zufrieden?", 250, 483);
    text("Ja", 390, 530);
    text("Nein", 570, 530);
    translate(0, -60);
    textSize(16);
    noFill();
    strokeWeight(4);
    stroke(255, 0, 0);
    ellipse(400, 580, 120, 60);
    fill(0);
    strokeWeight(1);
    fill(255);
    stroke(0);
    rect(150, 640, 700, 85);

    fill(0);
    noStroke();
    text("Wenn die Messkurven sich nicht stark unterscheiden, hat sich das Ethanol gleich-\nmäßig verteilt. In diesem Fall kannst du auf 'Ja' klicken. Dann wirst du aufgefordert die\nEthanol-Konzentration zu erhöhen.", 160, 662);
    //text("Wenn du auf 'Nein' klickst, wird die Messung wiederholt. Du kannst jederzeit die Messung durch Klicken auf den Button 'Messung\nwiederholen' klicken (beispielsweise, wenn abzusehen ist, dass die 10 Messkurven stark voneinander abweichen).", 20, 660);
    stroke(0);
    if (mouseX > 810 && mouseX < 930 && mouseY > 400 && mouseY < 450) {
      fill(255);
    } else {
      fill(220);
    }
    rect(810, 400, 120, 50);
    fill(0);
    text("  Messung\nwiederholen", 825, 418);
    textSize(20);
    stroke(0);
  }




  void seite9() {
    textSize(16);
    text("Der Durchschnitt der Signale einer Konzentration wird farbig dargestellt:", 20, 50);
    textSize(14);
    text("abgeschlossene Zyklen: 10/10", 800, 100);
    text("Konzentration: 40 ppm", 800, 120);
    text("Messpunkt: 50/50", 800, 140);

    translate(0, 50);
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 125 && (mouseY-translation) < 175) {
      fill(255);
    } else {
      fill(220);
    }
    textSize(16);
    rect(75, 25, 100, 50);
    fill(0);
    text("Messung \n starten", 91, 45);

    Koordinatenkreuz();
    translate(0, -50);

    strokeWeight(3);
    for (int j = 0; j < 5; j++) {
      for (int i = 1; i < 50; i++) {
        if (j == 0) {
          stroke(255, 0, 0);
        } else if (j== 1) {
          stroke(0, 200, 0);
        } else if (j ==2) {
          stroke(255, 0, 255);
        } else if (j ==3) {
          stroke(255, 255, 0);
        } else if (j ==4) {
          stroke(0, 255, 255);
        }
        line(250 + 10*i, 450-70*fakeZyklus[i]/((j+1)), 250 + 10*(i-1), 450-70*fakeZyklus[i-1]/((j+1)));
      }
    }
    fill(255, 0, 0);
    text("0 ppm", 810, 200);
    fill(0, 200, 0);
    text("10 ppm", 810, 220);
    fill(255, 0, 255);
    text("20 ppm", 810, 240);
    fill(255, 255, 0);
    text("30 ppm", 810, 260);
    fill(0, 255, 255);
    text("40 ppm", 810, 280);





    strokeWeight(1);
    for (int i = 70; i < 120; i++) {
      stroke(255 - 255 * i / 2500);
      line(200, i, 245, i);
    }
    textSize(16);
    fill(0);
    text(200, 198, 99);
    textSize(20);
    stroke(0);
    textSize(20);
  }








  void seite10() {
    textSize(20);
    textSize(14);
    text("abgeschlossene Zyklen: 10/10", 800, 100);
    text("Konzentration: 40 ppm", 800, 120);
    text("Messpunkt: 50/50", 800, 140);

    translate(0, 50);
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 75 && (mouseY-translation) < 125) {
      fill(255);
    } else {
      fill(220);
    }
    textSize(16);
    rect(75, 25, 100, 50);
    fill(0);
    text("Messung \n starten", 91, 45);

    Koordinatenkreuz();
    translate(0, -50);

    strokeWeight(3);
    for (int j = 0; j < 5; j++) {
      for (int i = 1; i < 50; i++) {
        if (j == 0) {
          stroke(255, 0, 0);
        } else if (j== 1) {
          stroke(0, 200, 0);
        } else if (j ==2) {
          stroke(255, 0, 255);
        } else if (j ==3) {
          stroke(255, 255, 0);
        } else if (j ==4) {
          stroke(0, 255, 255);
        }
        line(250 + 10*i, 450-70*fakeZyklus[i]/((j+1)), 250 + 10*(i-1), 450-70*fakeZyklus[i-1]/((j+1)));
      }
    }
    fill(255, 0, 0);
    text("0 ppm", 810, 200);
    fill(0, 200, 0);
    text("10 ppm", 810, 220);
    fill(255, 0, 255);
    text("20 ppm", 810, 240);
    fill(255, 255, 0);
    text("30 ppm", 810, 260);
    fill(0, 255, 255);
    text("40 ppm", 810, 280);





    strokeWeight(1);
    for (int i = 70; i < 120; i++) {
      stroke(255 - 255 * i / 2500);
      line(200, i, 245, i);
    }
    textSize(16);
    fill(0);
    text(200, 198, 99);
    stroke(0);
    translate(0, 50);

    fill(255);
    rect(10, 475, 1015, 190);
    fill(0);
    text("Wenn 5 verschiedene Konzentrationen aufgenommen wurden, hast du die Aufgabe 2 Merkmale der Kurven zu bestim-\nmen. Dazu stehen dir Maximum, Minimum, Mittelwert und Steigung innerhalb eines Intervalls zur Auswahl.\nKlicke auf die jeweiligen Buttons (links) und wähle 2 Merkmale aus. Wenn du mit der Maus in das Intervall klickst, kanns du es\nverschieben. Durch erneutes Klicken auf den Button wählst du das Merkmal ab.\n\nWenn du genau 2 Merkmale ausgewählt hast erscheint ein Button. Wenn du zufrieden bist, kommst du mit einem Klick darauf\nweiter.", 20, 500);
    textSize(20);  


    text("Merkmale", 75, 120);
    stroke(0);
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 195 && (mouseY-translation) < 245) {
      fill(0, 0, 255, 20);
    } else {
      fill(100, 100, 255, 220);
    }
    //Maximum
    rect(75, 145, 100, 50);
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 270 && (mouseY-translation) < 320) {
      fill(255, 100, 100, 20);
    } else {
      fill(255, 0, 0, 220);
    }
    //Minimum
    rect(75, 220, 100, 50);


    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 345 && (mouseY-translation) < 395) {
      fill(255, 255, 0, 20);
    } else {
      fill(255, 255, 0, 220);
    }
    //Steigung
    rect(75, 295, 100, 50);
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) >420 && (mouseY-translation) < 470) {
      fill(0, 255, 0, 20);
    } else {
      fill(0, 255, 0, 220);
    }
    //Mittelwert
    rect(75, 370, 100, 50);

    fill(0);
    textSize(16);
    text("Maximum", 87, 175);
    text("Minimum", 87, 250);
    text("Steigung", 90, 325);
    text("Mittelwert", 87, 400);

    textSize(20);  
    if (SteigAktiv) {
      Steigung();
    }
    if (MWAktiv) {
      Mittelwert();
    }
    if (MaxAktiv) {
      Maximum();
    }
    if (MinAktiv) {
      Minimum();
    }

    translate(0, -50);
  }


  void seite11() {
    textSize(20);
    textSize(14);
    text("abgeschlossene Zyklen: 10/10", 800, 100);
    text("Konzentration: 40 ppm", 800, 120);
    text("Messpunkt: 50/50", 800, 140);

    translate(0, 50);
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 75 && (mouseY-translation) < 125) {
      fill(255);
    } else {
      fill(220);
    }
    textSize(16);
    rect(75, 25, 100, 50);
    fill(0);
    text("Messung \n starten", 91, 45);

    Koordinatenkreuz();
    translate(0, -50);

    strokeWeight(3);
    for (int j = 0; j < 5; j++) {
      for (int i = 1; i < 50; i++) {
        if (j == 0) {
          stroke(255, 0, 0);
        } else if (j== 1) {
          stroke(0, 200, 0);
        } else if (j ==2) {
          stroke(255, 0, 255);
        } else if (j ==3) {
          stroke(255, 255, 0);
        } else if (j ==4) {
          stroke(0, 255, 255);
        }
        line(250 + 10*i, 450-70*fakeZyklus[i]/((j+1)), 250 + 10*(i-1), 450-70*fakeZyklus[i-1]/((j+1)));
      }
    }
    fill(255, 0, 0);
    text("0 ppm", 810, 200);
    fill(0, 200, 0);
    text("10 ppm", 810, 220);
    fill(255, 0, 255);
    text("20 ppm", 810, 240);
    fill(255, 255, 0);
    text("30 ppm", 810, 260);
    fill(0, 255, 255);
    text("40 ppm", 810, 280);






    strokeWeight(1);
    for (int i = 70; i < 120; i++) {
      stroke(255 - 255 * i / 2500);
      line(200, i, 245, i);
    }
    textSize(16);
    fill(0);
    text(200, 198, 99);
    stroke(0);
    translate(0, 50);

    fill(255);
    rect(210, 460, 580, 30);
    fill(0);
    text("Du kannst dir die Merkmale, auch in dem unteren Graphen anschauen.", 220, 480);
    textSize(20);  


    text("Merkmale", 75, 120);
    stroke(0);
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 195 && (mouseY-translation) < 245) {
      fill(0, 0, 255, 20);
    } else {
      fill(100, 100, 255, 220);
    }
    //Maximum
    rect(75, 145, 100, 50);
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 270 && (mouseY-translation) < 320) {
      fill(255, 100, 100, 20);
    } else {
      fill(255, 0, 0, 220);
    }
    //Minimum
    rect(75, 220, 100, 50);


    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 345 && (mouseY-translation) < 395) {
      fill(255, 255, 0, 20);
    } else {
      fill(255, 255, 0, 220);
    }
    //Steigung
    rect(75, 295, 100, 50);
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) >420 && (mouseY-translation) < 470) {
      fill(0, 255, 0, 20);
    } else {
      fill(0, 255, 0, 220);
    }
    //Mittelwert
    rect(75, 370, 100, 50);

    fill(0);
    textSize(16);
    text("Maximum", 87, 175);
    text("Minimum", 87, 250);
    text("Steigung", 90, 325);
    text("Mittelwert", 87, 400);

    textSize(20);  
    if (SteigAktiv) {
      Steigung();
    }
    if (MWAktiv) {
      Mittelwert();
    }
    if (MaxAktiv) {
      Maximum();
    }
    if (MinAktiv) {
      Minimum();
    }

    fill(0);
    text("Maximum", 230, 520);
    text("Steigung", 635, 520);

    fill(255);
    rect(125, 525, 300, 200);
    rect(525, 525, 300, 200);
    fill(100, 100, 255, 50);
    rect(125, 525, 300, 200);
    fill(255, 255, 0, 50);
    rect(525, 525, 300, 200);


    stroke(0);
    line(125, 525, 125, 730);
    line(120, 725, 400, 725);

    for (int i = 0; i < 5; i++) {
      line(175 + 50*i, 525, 175 + 50*i, 730); 
      line(575 + 50*i, 525, 575 + 50*i, 730);
    }


    line(625, 525, 625, 730);
    line(620, 725, 800, 725);

    textSize(12);
    fill(0);
    text("0 ppm", 130, 740);
    text("10 ppm", 180, 740);
    text("20 ppm", 230, 740);
    text("30 ppm", 280, 740);
    text("40 ppm", 330, 740);
    text("?? ppm", 380, 740);

    text("0 ppm", 530, 740);
    text("10 ppm", 580, 740);
    text("20 ppm", 630, 740);
    text("30 ppm", 680, 740);
    text("40 ppm", 730, 740);
    text("?? ppm", 780, 740);
    textSize(20);
    translate(0, -50);

    GrenzeMaximumLinks = 10;
    GrenzeSteigungLinks = 30;

    noStroke();  
    for (int i = 0; i <10; i++) {
      fill(255, 0, 0, 100);
      ellipse(150, 610+i, 10, 10);
      ellipse(550, 740 + 0.1*i, 10, 10);
      fill(0, 200, 0, 100);
      ellipse(200, 660+i, 10, 10);
      ellipse(600, 690 + 0.1*i, 10, 10);
      fill(255, 0, 255, 100);
      ellipse(250, 695+i, 10, 10);
      ellipse(650, 660 + 0.1*i, 10, 10);
      fill(255, 255, 0, 100);
      ellipse(300, 710+i, 10, 10);
      ellipse(700, 630 + 0.1*i, 10, 10);
      fill(0, 255, 255, 100);
      ellipse(350, 720+i, 10, 10);
      ellipse(750, 610 + 0.1*i, 10, 10);
    }    


    stroke(0);
  }


  void seite12() {
    textSize(20);
    textSize(14);
    text("abgeschlossene Zyklen: 10/10", 800, 100);
    text("Konzentration: 40 ppm", 800, 120);
    text("Messpunkt: 50/50", 800, 140);

    translate(0, 50);
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 75 && (mouseY-translation) < 125) {
      fill(255);
    } else {
      fill(220);
    }
    textSize(16);
    rect(75, 25, 100, 50);
    fill(0);
    text("Messung \n starten", 91, 45);

    Koordinatenkreuz();
    translate(0, -50);

    strokeWeight(3);
    for (int j = 0; j < 5; j++) {
      for (int i = 1; i < 50; i++) {
        if (j == 0) {
          stroke(255, 0, 0);
        } else if (j== 1) {
          stroke(0, 200, 0);
        } else if (j ==2) {
          stroke(255, 0, 255);
        } else if (j ==3) {
          stroke(255, 255, 0);
        } else if (j ==4) {
          stroke(0, 255, 255);
        }
        line(250 + 10*i, 450-70*fakeZyklus[i]/((j+1)), 250 + 10*(i-1), 450-70*fakeZyklus[i-1]/((j+1)));
      }
    }

    for (int i = 1; i < 50; i++) {
      stroke(0);
      line(250 + 10*i, 450-70*fakeZyklus[i]/((1.7+1)), 250 + 10*(i-1), 450-70*fakeZyklus[i-1]/((1.7+1)));
    }






    fill(255, 0, 0);
    text("0 ppm", 810, 200);
    fill(0, 200, 0);
    text("10 ppm", 810, 220);
    fill(255, 0, 255);
    text("20 ppm", 810, 240);
    fill(255, 255, 0);
    text("30 ppm", 810, 260);
    fill(0, 255, 255);
    text("40 ppm", 810, 280);
    fill(0);
    text("?? ppm", 810, 300);





    strokeWeight(1);
    for (int i = 70; i < 120; i++) {
      stroke(255 - 255 * i / 2500);
      line(200, i, 245, i);
    }
    textSize(16);
    fill(0);
    text(200, 198, 99);
    stroke(0);
    translate(0, 50);

    fill(255);
    rect(10, 460, 1020, 85);
    fill(0);
    text("Nachdem du alle Trainingsdaten aufgenommen hast, werden wir ein mathematisches Modell erstellen, das uns, bei gegebenen\nMerkmalen, eine Vorhersage für die Konzentration liefert. Das Modell werden wir dann an einer unbekannten Konzentration\ntesten, indem wir erneut Merkmale aufnehmen.", 20, 480);
    textSize(20);  


    text("Merkmale", 75, 120);
    stroke(0);
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 195 && (mouseY-translation) < 245) {
      fill(0, 0, 255, 20);
    } else {
      fill(100, 100, 255, 220);
    }
    //Maximum
    rect(75, 145, 100, 50);
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 270 && (mouseY-translation) < 320) {
      fill(255, 100, 100, 20);
    } else {
      fill(255, 0, 0, 220);
    }
    //Minimum
    rect(75, 220, 100, 50);


    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) > 345 && (mouseY-translation) < 395) {
      fill(255, 255, 0, 20);
    } else {
      fill(255, 255, 0, 220);
    }
    //Steigung
    rect(75, 295, 100, 50);
    if (mouseX > 75 && mouseX < 175 && (mouseY-translation) >420 && (mouseY-translation) < 470) {
      fill(0, 255, 0, 20);
    } else {
      fill(0, 255, 0, 220);
    }
    //Mittelwert
    rect(75, 370, 100, 50);

    fill(0);
    textSize(16);
    text("Maximum", 87, 175);
    text("Minimum", 87, 250);
    text("Steigung", 90, 325);
    text("Mittelwert", 87, 400);

    textSize(20);  
    if (SteigAktiv) {
      Steigung();
    }
    if (MWAktiv) {
      Mittelwert();
    }
    if (MaxAktiv) {
      Maximum();
    }
    if (MinAktiv) {
      Minimum();
    }
    translate(0, 50);
    fill(0);
    text("Maximum", 230, 520);
    text("Steigung", 635, 520);

    fill(255);
    rect(125, 525, 300, 200);
    rect(525, 525, 300, 200);
    fill(100, 100, 255, 50);
    rect(125, 525, 300, 200);
    fill(255, 255, 0, 50);
    rect(525, 525, 300, 200);


    stroke(0);
    line(125, 525, 125, 730);
    line(120, 725, 400, 725);

    for (int i = 0; i < 5; i++) {
      line(175 + 50*i, 525, 175 + 50*i, 730); 
      line(575 + 50*i, 525, 575 + 50*i, 730);
    }


    line(625, 525, 625, 730);
    line(620, 725, 800, 725);

    textSize(12);
    fill(0);
    text("0 ppm", 130, 740);
    text("10 ppm", 180, 740);
    text("20 ppm", 230, 740);
    text("30 ppm", 280, 740);
    text("40 ppm", 330, 740);
    text("?? ppm", 380, 740);

    text("0 ppm", 530, 740);
    text("10 ppm", 580, 740);
    text("20 ppm", 630, 740);
    text("30 ppm", 680, 740);
    text("40 ppm", 730, 740);
    text("?? ppm", 780, 740);
    textSize(20);
    translate(0, -50);

    GrenzeMaximumLinks = 10;
    GrenzeSteigungLinks = 30;

    noStroke();  
    for (int i = 0; i <10; i++) {
      fill(255, 0, 0, 100);
      ellipse(150, 610+i, 10, 10);
      ellipse(550, 740 + 0.1*i, 10, 10);
      fill(0, 200, 0, 100);
      ellipse(200, 660+i, 10, 10);
      ellipse(600, 690 + 0.1*i, 10, 10);
      fill(255, 0, 255, 100);
      ellipse(250, 695+i, 10, 10);
      ellipse(650, 660 + 0.1*i, 10, 10);
      fill(255, 255, 0, 100);
      ellipse(300, 710+i, 10, 10);
      ellipse(700, 630 + 0.1*i, 10, 10);
      fill(0, 255, 255, 100);
      ellipse(350, 720+i, 10, 10);
      ellipse(750, 610 + 0.1*i, 10, 10);
    }
    fill(0, 100);
    ellipse(400, 670, 10, 10);
    ellipse(800, 660, 10, 10);
   
    noFill();
    stroke(255,0,0);
    strokeWeight(4);
    ellipse(840, 250, 90, 50);
    ellipse(400, 670, 30, 30);
    
    ellipse(800, 660, 30, 30);
    
    
    
    stroke(0);
    strokeWeight(1);
  }

  void seite13() {
    textSize(20);
    textAlign(CENTER);
    text("Du kannst nun zur echten Messung. Wenn du während des Versuchs Fragen hast, stehen dir die Betreuer\nzur Verfügung.", 525, 300);
    textAlign(NORMAL);
  }
