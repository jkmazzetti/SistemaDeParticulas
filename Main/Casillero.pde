class Casillero {
  int x, y, tm;
  color relleno;
  String tipo; //Probablemente despues cambie a enum.
  Casillero(int x, int y, int tm, String tipo) {
    this.x=x;
    this.y=y;
    this.tm=tm;
    this.tipo=tipo;
  }

  public void dibujar() {
    if (this.tipo=="vacio") {
      relleno=color(0);
      fill(relleno);
      stroke(255,50);
      rectMode(CENTER);
      rect(this.x, this.y, this.tm, this.tm);
    }
    if (this.tipo=="obs") {
      relleno=color(175);
      fill(relleno, 20);
      noStroke();
      rectMode(CENTER);
      rect(this.x, this.y, this.tm, this.tm);
    }
    if (this.tipo=="arena") {
      relleno=color(200, 150, 0);
      fill(relleno);
      noStroke();
      rectMode(CENTER);
      rect(this.x, this.y, this.tm, this.tm);
    }
  }
  public void borrar(){
   if(dist(mouseX,mouseY,this.x, this.y)<tm && this.tipo=="arena"){
    this.tipo="vacio";
    this.relleno=color(0);     
   }
  }
}
