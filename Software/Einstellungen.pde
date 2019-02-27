void Einstellungen() {
  pushMatrix();
  for (int i = 0; i < 1500; i++) {
    stroke(255 - 255 * i / 1500);
    line(0, i, width, i);
  }

  textSize(20);
  fill(0);
  text("Wähle COM-Port:", 20, 200);
  text("Anzahl Konzentrationen:", 20, 100);
  anzahlZyklen_.show();
  text("Anzahl Zyklen pro Konzentration:", 20, 150);
  anzahlKonzentrationen_.show();
  text("Baudrate: ", 550, 200);
  text("(default: 9600)", 800, 200);
  baudRate.show();
  if (mouseX > 400 && mouseX < 550 && mouseY > 400 && mouseY < 450) {
    fill(255);
  } else {
    fill(220);
  }

  rect(400, 400, 150, 50);

  d1.show();
  fill(0);
  text("Hauptmenü", 420, 430);

  if (d1.isMouseOver()) {
    d1.clear(); //Delete all the items
    for (int i=0; i<Serial.list().length; i++) {
      d1.addItem(Serial.list()[i], i); //add the items in the list
    }
  }
  
  
  if(mouseX > 400 && mouseX < 500 && mouseY < 350 && mouseY > 300){
    fill(255);
  }else{
    fill(220);
  }  
  rect(400, 300, 100, 50);
  fill(0);
  textSize(25);
  text("RESET", 415,333);
  textSize(12);
  text("Bei Fragen zum Programm, lesen Sie bitte zunächst das 'readme.pdf'. Bei sonstigen Fragen oder Problemen, wenden Sie sich bitte an:", 20, 620);
  text("Sebastian Höfner\nLehrstuhl für Messtechnik\nFachrichtung Systems Engineering\nUniversität des Saarlandes\nTel.: +49 681 302-2235\nmail: s.hoefner@lmt.uni-saarland.de\n", 20, 650);
  popMatrix();
}
