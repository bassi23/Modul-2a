void matLog(float[][] m) {
  int spalten = m[0].length;
  int reihen = m.length;
  println();
  println(reihen + "x" + spalten);
  println("______________");
  for (int i = 0; i < reihen; i++) {
    for (int j = 0; j < spalten; j++) {
      print(m[i][j] + " ");
    }
    println();
  }
}


void arrLog(float[] m) {
  int reihen = m.length;
  println();
  for (int i = 0; i < reihen; i++) {
    println(m[i] + " ");
  }
}
