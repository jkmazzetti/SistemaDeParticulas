class Grilla {
  int cantidadCasillerosX, cantidadCasillerosY;
  int tm;
  Casillero [][] matriz;
  Grilla(int tm) {
    this.tm=tm;
    this.cantidadCasillerosX=floor(displayWidth/this.tm);
    this.cantidadCasillerosY=floor(displayHeight/this.tm);
    this.matriz=new Casillero [this.cantidadCasillerosY][this.cantidadCasillerosX];
    for (int i=0; i<this.matriz.length; i++) {
      for (int j=0; j<this.matriz[i].length; j++) {
        this.matriz[i][j]=new Casillero((1+j)*this.tm, (1+i)*this.tm, this.tm,"vacio");
      }
    }
  }
  public void mostrar(){
    for (int i=0; i<this.matriz.length; i++) {
      for (int j=0; j<this.matriz[i].length; j++) {
        this.matriz[i][j].dibujar();
      }
    }
  }
   public void borrar(){
    for (int i=0; i<this.matriz.length; i++) {
      for (int j=0; i<this.matriz[i].length; i++) {
        this.matriz[i][j].borrar();
      }
    }
  }
}
