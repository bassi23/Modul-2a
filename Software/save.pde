float[] Outputs = new float[anzahlKonzentrationen*anzahlZyklen];

void Speichern() {
  for (int i = 0; i < anzahlZyklen*anzahlKonzentrationen; i++) {
    float max = 0;
    float min = 999999999;
    float slope = 0;
    float mean = 0;



    for (int j = 0; j < 50; j++) {
      if (j >= GrenzeMaximumLinks && j <GrenzeMaximumLinks + 6) {
        if (max < Messdaten[i][j]) {
          max = Messdaten[i][j];
          MerkmalMaximum[i] = Messdaten[i][j];
        }
      }

      if (j >= GrenzeMinimumLinks && j <GrenzeMinimumLinks + 6) {
        if (min > Messdaten[i][j]) {
          min = Messdaten[i][j];
          MerkmalMinimum[i] = Messdaten[i][j];
        }
      }
    }

    slope = (-Messdaten[i][GrenzeSteigungLinks] + Messdaten[i][GrenzeSteigungLinks + 6])/6;
    MerkmalSteigung[i] = slope;

    for (int j = 0; j < 6; j++) {
      mean += Messdaten[i][GrenzeMittelwertLinks+j];
    }
    mean = mean/6;
    MerkmalMittelwert[i] = mean;
  }




  for (int j = 0; j < 50; j++) {
    if (j >= GrenzeMaximumLinks && j <GrenzeMaximumLinks + 6) {
      if (MerkmalMaximumUnbekannt < UnbekannteKonzentrationMessdaten[0][j]) {
        MerkmalMaximumUnbekannt = UnbekannteKonzentrationMessdaten[0][j];
      }
    }

    if (j >= GrenzeMinimumLinks && j <GrenzeMinimumLinks + 6) {
      if (MerkmalMinimumUnbekannt > UnbekannteKonzentrationMessdaten[0][j]) {
        MerkmalMinimumUnbekannt = UnbekannteKonzentrationMessdaten[0][j];
      }
    }
  }

  float mean = 0;
 
  for (int j = 0; j < 6; j++) {
    mean += UnbekannteKonzentrationMessdaten[0][GrenzeMittelwertLinks+j];
  }
  mean = mean/6;
  MerkmalMittelwertUnbekannt = mean;
  MerkmalSteigungUnbekannt = (-UnbekannteKonzentrationMessdaten[0][GrenzeSteigungLinks] + UnbekannteKonzentrationMessdaten[0][GrenzeSteigungLinks + 6])/6;







  String[] Training = new String[anzahlKonzentrationen*anzahlZyklen];
  for (int i = 0; i< anzahlKonzentrationen*anzahlZyklen; i++) {
    Training[i] = "";
  }
  Training[0] = "let max = false; let min = false; let slope = false; let mean = false; let training_data = [";
  if (MaxAktiv && MinAktiv) {

    for (int i = 0; i < anzahlKonzentrationen*anzahlZyklen; i++) {
      Training[i] = Training[i] + "{inputs: [" + MerkmalMaximum[i] + "," + MerkmalMinimum[i] + "], outputs:[" + Outputs[i] + "]},";
    }
    Training[anzahlKonzentrationen*anzahlZyklen-1] = Training[anzahlKonzentrationen*anzahlZyklen - 1] + "]; max = true; min = true;";
  } else if (MaxAktiv && SteigAktiv) {
    for (int i = 0; i < anzahlKonzentrationen*anzahlZyklen; i++) {
      Training[i] = Training[i] + "{inputs: [" + MerkmalMaximum[i] + "," + MerkmalSteigung[i] + "], outputs:[" + Outputs[i] + "]},";
    }
    Training[anzahlKonzentrationen*anzahlZyklen-1] = Training[anzahlKonzentrationen*anzahlZyklen - 1] + "]; max = true; slope = true;";
  } else if (MaxAktiv && MWAktiv) {
    for (int i = 0; i < anzahlKonzentrationen*anzahlZyklen; i++) {
      Training[i] = Training[i] + "{inputs: [" + MerkmalMaximum[i] + "," + MerkmalMittelwert[i] + "], outputs:[" + Outputs[i] + "]},";
    }
    Training[anzahlKonzentrationen*anzahlZyklen-1] = Training[anzahlKonzentrationen*anzahlZyklen - 1] + "]; max = true; mean = true;";
  } else if (MinAktiv && SteigAktiv) {
    for (int i = 0; i < anzahlKonzentrationen*anzahlZyklen; i++) {
      Training[i] = Training[i] + "{inputs: [" + MerkmalMinimum[i] + "," + MerkmalSteigung[i] + "], outputs:[" + Outputs[i] + "]},";
    }
    Training[anzahlKonzentrationen*anzahlZyklen-1] = Training[anzahlKonzentrationen*anzahlZyklen - 1] + "]; min = true; slope = true;";
  } else if (MinAktiv && MWAktiv) {
    for (int i = 0; i < anzahlKonzentrationen*anzahlZyklen; i++) {
      Training[i] = Training[i] + "{inputs: [" + MerkmalMinimum[i] + "," + MerkmalMittelwert[i] + "], outputs:[" + Outputs[i] + "]},";
    }
    Training[anzahlKonzentrationen*anzahlZyklen-1] = Training[anzahlKonzentrationen*anzahlZyklen - 1] + "]; min = true; mean = true;";
  } else if (SteigAktiv && MWAktiv) {
    for (int i = 0; i < anzahlKonzentrationen*anzahlZyklen; i++) {
      Training[i] = Training[i] + "{inputs: [" + MerkmalSteigung[i] + "," + MerkmalMittelwert[i] + "], outputs:[" + Outputs[i] + "]},";
    }
    Training[anzahlKonzentrationen*anzahlZyklen-1] = Training[anzahlKonzentrationen*anzahlZyklen - 1] + "]; slope = true; mean = true;";
  }
  saveStrings("lib/Trainingsdaten.js", Training);
}
