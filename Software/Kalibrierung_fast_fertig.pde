import processing.serial.*; 
Serial myPort;
PImage SUSmobil;
PImage LMT;
PImage DBU;
PImage UdS;
PImage SFZSLS;
PImage iPhysicsLab;



import controlP5.*;
ControlP5 cp5;
DropdownList d1;


ControlP5 anzahlKonzentrationen_, anzahlZyklen_, ppmProMl, Konzentration1, Konzentration2, Konzentration3, baudRate;
String textValue = "";
String portName;
int serialListIndex;

boolean startProgramm = false;


void setup() {
  size(1050, displayHeight);
  SUSmobil = loadImage("img/SUSmobil.png");
  LMT = loadImage("img/LMT.png");
  UdS = loadImage("img/UdS.png");
  DBU = loadImage("img/DBU.png");
    iPhysicsLab = loadImage("img/iPhysicsLab.png");
  SFZSLS = loadImage("img/SFZSLS.png");
  
  
  surface.setIcon(SUSmobil);
  cp5 = new ControlP5(this);
  //surface.setResizable(true);
  PFont pfont = createFont("Arial", 10, true); //Create a font
  ControlFont font = new ControlFont(pfont, 20); //font, font-size

  d1 = cp5.addDropdownList("myList-d1")
    .setPosition(400, 170)
    .setSize(100, 50)
    .setHeight(210)
    .setItemHeight(40)
    .setBarHeight(50)
    .setFont(font)
    .setColorBackground(color(60))
    .setColorActive(color(255, 128))
    ;

  d1.getCaptionLabel().set("PORT"); //set PORT before anything is selected
  d1.hide();

  // Einstellungen:
  anzahlKonzentrationen_ = new ControlP5(this);

  anzahlKonzentrationen_.addTextfield("")
    .setPosition(400, 80)
    .setSize(100, 30)
    .setFont(font)
    .setFocus(false)
    .setColor(color(255))
    ;
  anzahlKonzentrationen_.hide();
  baudRate = new ControlP5(this);

  baudRate.addTextfield("")
    .setPosition(650, 180)
    .setSize(100, 30)
    .setFont(font)
    .setFocus(false)
    .setColor(color(255))
    ;
  baudRate.hide();

  anzahlZyklen_ = new ControlP5(this);

  anzahlZyklen_.addTextfield("")
    .setPosition(400, 125)
    .setSize(100, 30)
    .setFont(font)
    .setFocus(false)
    .setColor(color(255))
    ;
  anzahlZyklen_.hide();


  ppmProMl = new ControlP5(this);

  ppmProMl.addTextfield("")
    .setPosition(400, 150)
    .setSize(100, 30)
    .setFont(font)
    .setFocus(false)
    .setColor(color(255))
    ;
  ppmProMl.hide();

  Konzentration1 = new ControlP5(this);

  Konzentration1.addTextfield("")
    .setPosition(410, 395)
    .setSize(40, 30)
    .setFont(font)
    .setFocus(false)
    .setColor(color(255))
    ;
  Konzentration1.hide();

  Konzentration2 = new ControlP5(this);

  Konzentration2.addTextfield("")
    .setPosition(410, 445)
    .setSize(40, 30)
    .setFont(font)
    .setFocus(false)
    .setColor(color(255))
    ;
  Konzentration2.hide();

  Konzentration3 = new ControlP5(this);

  Konzentration3.addTextfield("")
    .setPosition(410, 495)
    .setSize(40, 30)
    .setFont(font)
    .setFocus(false)
    .setColor(color(255))
    ;
  Konzentration3.hide();

  ////
  if (Serial.list().length > 0) {
    portName = Serial.list()[0]; //0 as default
    myPort = new Serial(this, portName, 9600);
    startProgramm = true;
  }
  //Alle Messdaten zu Beginn auf 0 setzem
  for (int i = 0; i < anzahlKonzentrationen*anzahlZyklen; i++) {
    for (int j = 0; j < 50; j++) {
      Messdaten[i][j] = 0;
    }
  }
}


boolean auswahl = false;
boolean menu = true;
boolean messung = false;
boolean COM = false;
boolean settings = false;
int translation = 0;
boolean Aufforderung = false;
boolean erklaerung = true;
boolean messungEinstellung = true;

float ppmProMlWert = 10;
int baudrate = 9600;

int Konzentration1Wert = 10;
int Konzentration2Wert = 20;
int Konzentration3Wert = 30;


void draw() {
  if (startProgramm) {
    anzahlZyklen_.hide();
    anzahlKonzentrationen_.hide();
    baudRate.hide();

    //Outputs werden erstellt
    for (int i = 0; i < anzahlKonzentrationen; i++) {
      for (int j = 0; j < anzahlZyklen; j++) {
        if (i == 0) {
          Outputs[j + anzahlZyklen*i] = 0;
        }
        if (i == 1) {

          if (Float.isNaN(parseFloat(Konzentration1.get(Textfield.class, "").getText().replace(',', '.')))) {
            Outputs[j + anzahlZyklen*i] = 10;
          } else {
            Outputs[j + anzahlZyklen*i] = parseFloat(Konzentration1.get(Textfield.class, "").getText().replace(',', '.'));
          }
        }

        if (i == 2) {
          if (Float.isNaN(parseFloat(Konzentration2.get(Textfield.class, "").getText().replace(',', '.')))) {
            Outputs[j + anzahlZyklen*i] = 20;
          } else {
            Outputs[j + anzahlZyklen*i] = parseFloat(Konzentration2.get(Textfield.class, "").getText().replace(',', '.'));
          }
        }

        if (i == 3) {
          if (Float.isNaN(parseFloat(Konzentration3.get(Textfield.class, "").getText().replace(',', '.')))) {
            Outputs[j + anzahlZyklen*i] = 30;
          } else {
            Outputs[j + anzahlZyklen*i] = parseFloat(Konzentration3.get(Textfield.class, "").getText().replace(',', '.'));
          }
        }

        if (i == 4) {
          Outputs[j + anzahlZyklen*i] =40;
        }
      }
    }





    if (parseInt(anzahlKonzentrationen_.get(Textfield.class, "").getText()) <= 0) {
      anzahlKonzentrationen = 5;
    } else {
      anzahlKonzentrationen = parseInt(anzahlKonzentrationen_.get(Textfield.class, "").getText());
    }

    if (parseInt(anzahlZyklen_.get(Textfield.class, "").getText()) <= 0) {
      anzahlZyklen = 10;
    } else {
      anzahlZyklen = parseInt(anzahlZyklen_.get(Textfield.class, "").getText());
    }

    if (parseInt(baudRate.get(Textfield.class, "").getText()) <= 0) {
      baudrate = 9600;
    } else {
      baudrate = parseInt(baudRate.get(Textfield.class, "").getText());
    }

    if (parseFloat(ppmProMl.get(Textfield.class, "").getText().replace(',', '.')) <= 0) {
      ppmProMlWert = 0;
    } else {
      ppmProMlWert = parseFloat(ppmProMl.get(Textfield.class, "").getText().replace(',', '.'));
    }





    if (parseInt(Konzentration1.get(Textfield.class, "").getText().replace(',', '.')) <= 0) {
      Konzentration1Wert = 10;
    } else {
      Konzentration1Wert = parseInt(Konzentration1.get(Textfield.class, "").getText().replace(',', '.'));
    }

    if (parseInt(Konzentration2.get(Textfield.class, "").getText().replace(',', '.')) <= 0) {
      Konzentration2Wert = 20;
    } else {
      Konzentration2Wert = parseInt(Konzentration2.get(Textfield.class, "").getText().replace(',', '.'));
    }

    if (parseInt(Konzentration3.get(Textfield.class, "").getText().replace(',', '.')) <= 0) {
      Konzentration3Wert = 30;
    } else {
      Konzentration3Wert = parseInt(Konzentration3.get(Textfield.class, "").getText().replace(',', '.'));
    }

    if (translation < -190) {
      translation = -190;
    }
    if (translation > 1) {
      translation = 0;
    }
    background(255);

    translate(0, translation);
    if (menu) {
      image(SUSmobil, 0, 0);
      image(LMT,200,830);
      //image(UdS, 400, 850);
      image(SFZSLS, 350, 830);
      image(iPhysicsLab, 660, 830);
      
      d1.hide();
      homeScreen();
    } else if (messung) {
      for (int i = 0; i < 1500; i++) {
        stroke(255 - 255 * i / 1500);
        line(0, i, width, i);
      }

      if (messungEinstellung) {
        KonzProMl();
      } else {

        Koordinatenkreuz();
        Messung();
        NormalizeData();
        DatenZeichnen();
        Buttons();
        if (aktuellerZyklus == anzahlZyklen) {
          Zufrieden();
        } else {
          if (aktuelleKonzentration != anzahlKonzentrationen) {
            Temperaturzyklus();
          } else {
            ErklaerungMerkmale();
          }
        }
        if (auswertung) {
          messungGestartet = false;
          if (MaxAktiv) {
            Maximum();
          }
          if (MinAktiv) {
            Minimum();
          }
          if (SteigAktiv) {
            Steigung();
          }
          if (MWAktiv) {
            Mittelwert();
          }
        }
        Speichern();
      }
    } else if (tutor) {
      tutorial();
    } else if (settings) {
      Einstellungen();
    }

    if (Konzentration1Wert >= Konzentration2Wert || Konzentration1Wert >= Konzentration3Wert || Konzentration2Wert >= Konzentration3Wert || ppmProMlWert <= 0 || Konzentration1Wert >= 40 || Konzentration2Wert >= 40 || Konzentration3Wert >= 40) {
      Fehlermeldung();
      erlaubnis = false;
    } else {
      erlaubnis = true;
    }
  } else {
    background(255);
    fill(0);
    textAlign(CENTER);
    textSize(40);
    text("Kein Mikrocontroller erkannt. Überprüfe den\nAnschluss. Sobald ein Gerät erkannt wurde,\nstartet das Programm automatisch neu.", 525, 300);
    if (Serial.list().length > 0) {
      portName = Serial.list()[0]; //0 as default
      myPort = new Serial(this, portName, 9600);
      startProgramm = true;
      textAlign(CORNER);
    }
  }
  if (Serial.list().length == 0) {
    startProgramm = false;
  }
}


void controlEvent(ControlEvent theEvent) { //when something in the list is selected
  myPort.clear(); //delete the port
  myPort.stop(); //stop the port
  if (theEvent.isController() && d1.isMouseOver()) {
    portName = Serial.list()[int(theEvent.getController().getValue())]; //port name is set to the selected port in the dropDownMeny
    myPort = new Serial(this, portName, baudrate); //Create a new connection
    println("Serial index set to: " + theEvent.getController().getValue());
    delay(2000);
  }
}

boolean erlaubnis = false;


void Fehlermeldung() {
  pushMatrix();
  fill(255);
  rect(270, 600, 440, 70);
  stroke(255, 0, 0);
  fill(255, 0, 0);
  textSize(30);
  text("Überprüfe deine Angaben!", 300, 650);


  popMatrix();

  fill(0);
}
