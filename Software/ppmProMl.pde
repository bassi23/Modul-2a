


void KonzProMl(){
  textSize(20);
  text("Bevor du kalibrieren kannst, fülle bitte die folgenden Felder aus:", 20, 50);
  textSize(18);
  text("1. Um wieviel ppm erhöht sich die Konzentration in der Messkammer pro eingespritzten ml?", 100, 120);
  
  text("2. Welche 5 Konzentrationen möchtest du für die Kalibrierung verwenden? Trage sie in aufsteigender\nReihenfolge ein.\nBeachte: 0ppm und 40ppm musst du auf jeden Fall messen!", 100, 250);
  textSize(25);
  text("ppm/ml", 525, 175);
  
  
  text("1:", 350, 370);
  text("2:", 350, 420);
  text("3:", 350, 470);
  text("4:", 350, 520);
  text("5:", 350, 570);
  
  text("0    ppm", 410, 370);
  text("ppm", 458, 420);
  text("ppm", 458, 470);
  text("ppm", 458, 520);
  
  text("40  ppm", 408, 570);
  
  
  if(mouseX > 400 && mouseX < 630 && mouseY > 700 && mouseY < 750){
    fill(255);
  }else{
   fill(220); 
  }
  rect(400, 700, 180, 50);
  fill(0);
  textSize(20);
  text("Messung starten", 410, 730);
  
}
