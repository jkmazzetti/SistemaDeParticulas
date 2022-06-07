class Boton {
  boolean estado;
  int x, y, tm;
  String tipo;
  Boton(int x, int y, int tm, String tipo) {
    this.x=x;
    this.y=y;
    this.tm=tm;
    this.tipo=tipo;
    this.estado=false;
  }
  public void mostrar() {

    if (this.tipo=="obstaculo") {
      fill(150);
    } else if (this.tipo=="arena") {
      fill(240, 100, 0);
    } else if (this.tipo=="borrar") {
      fill(150, 80);
      stroke(255, 0, 0);
      line(x-tm/2, y-tm/2, x+tm/2, y+tm/2);
    }
    if (estado) {
      stroke(255);
      strokeWeight(3);
    } else {
      noStroke();
    }
    rectMode(CENTER);
    rect(x, y, tm, tm);
  }
  public void cambiarEstado() {
    if (dist(mouseX, mouseY, this.x, this.y)<=tm/2 && mousePressed) {
      if (!estado) {
        this.estado=true;
      }else {
      this.estado=false;
      }
      delay(100);
    }
  }
    public void desactivar() {
      this.estado=false;
    }
  }
