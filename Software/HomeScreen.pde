


void homeScreen() {
  pushMatrix();
  // 1. 2 Optionen: Tutorial und direkt losmessen
  textSize(30);
  fill(0);
  text("Modul 2a) - Kalibrierung eines Sensors", 250, 480);

  if (mouseX > 400 && mouseX < 700 && (mouseY-translation) > 525 && (mouseY-translation) < 600) {
    fill(255);
  } else {
    fill(220);
  }
  rect(400, 525, 300, 75);

  if (mouseX > 400 && mouseX < 700 && (mouseY-translation) > 625 && (mouseY-translation) < 700) {
    fill(255);
  } else {
    fill(220);
  }

  rect(400, 625, 300, 75);
  if (mouseX > 400 && mouseX < 700 && (mouseY-translation) > 725 && (mouseY-translation) < 800) {
    fill(255);
  } else {
    fill(220);
  }
  rect(400, 725, 300, 75);



  fill(0);
  text("Tutorial", 500, 570);
  text("Messung", 495, 670);
  text("Einstellungen", 455, 770);
  popMatrix();
}
