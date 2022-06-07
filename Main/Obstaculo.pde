class Obstaculo {
  Grilla grilla;
  Casillero obs[]=new Casillero[1];
  Obstaculo(Grilla unaGrilla) {
    this.grilla=unaGrilla;
  }
  void crear(boolean activado) {
    int x, y;
    if (keyPressed && activado) {
      x=mouseX;
      y=mouseY;
      for (int i=0; i<this.grilla.matriz.length; i++) {
        for (int j=0; j<this.grilla.matriz[i].length; j++) {
          if (dist(x, y, this.grilla.matriz[i][j].x, this.grilla.matriz[i][j].y)<=this.grilla.matriz[i][j].tm/2) {
            if (this.obs[0]==null) {
              this.obs[0]=new Casillero(this.grilla.matriz[i][j].x, this.grilla.matriz[i][j].y, this.grilla.matriz[i][j].tm, "obs");
              this.grilla.matriz[i][j].tipo="obs";
            } else {
              Casillero obsCopia[]=new Casillero[this.obs.length+1];
              for (int k=0; k<this.obs.length; k++) {
                obsCopia[k]=this.obs[k];
              }
              obsCopia[this.obs.length]=new Casillero(this.grilla.matriz[i][j].x, this.grilla.matriz[i][j].y, this.grilla.matriz[i][j].tm, "obs");
              this.obs=obsCopia;
            }
            break;
          }
        }
      }
    }
  }
  public void mostrar() {
    for (int i=0; i<this.obs.length && this.obs[0]!=null; i++) {
      this.obs[i].dibujar();
    }
  }
  public void borrar(boolean activado) {
    if (activado) {
      int c=0;
      Casillero auxA[]=new Casillero [this.obs.length];
      for (int i=0; i<this.obs.length; i++) {
        if (this.obs[i]!=null && dist(this.obs[i].x, this.obs[i].y, mouseX, mouseY)>this.obs[i].tm/2) {
          auxA[c]=this.obs[i];
          c++;
        }
      }
      if (c==0) {
        c++;
      }
      Casillero auxB[]=new Casillero[c];
      for (int j=0; j<auxB.length; j++) {
        auxB[j]=auxA[j];
      }
      this.obs=auxB;
    }
  }
}
