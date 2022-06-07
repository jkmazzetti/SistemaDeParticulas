class Arena {
  boolean alcanzoLimite=false;
  Grilla grilla;
  Casillero granos[]=new Casillero[1];
  Arena(Grilla unaGrilla) {
    this.grilla=unaGrilla;
  }
  void crear(boolean activado) {
    int x, y;
    if (mousePressed && activado) {
      x=mouseX;
      y=mouseY;
      for (int i=1; i<this.grilla.matriz.length-1; i++) {
        for (int j=1; j<this.grilla.matriz.length-1; j++) {
          if (dist(x, y, this.grilla.matriz[i][j].x, this.grilla.matriz[i][j].y)<=this.grilla.matriz[i][j].tm/2) {
            if (this.granos[0]==null) {
              this.granos[0]=new Casillero(this.grilla.matriz[i][j].x, this.grilla.matriz[i][j].y, this.grilla.matriz[i][j].tm, "arena");
            } else {
              Casillero granosCopia[]=new Casillero [this.granos.length+1];
              for (int k=0; k<this.granos.length; k++) {
                granosCopia[k]=this.granos[k];
              }
              granosCopia[this.granos.length]=new Casillero(this.grilla.matriz[i][j].x, this.grilla.matriz[i][j].y, this.grilla.matriz[i][j].tm, "arena");
              this.granos=granosCopia;
            }
            break;
          }
        }
      }
    }
  }
  public void mostrar() {
    for (int i=0; i<this.granos.length && this.granos[0]!=null; i++) {
      this.granos[i].dibujar();
    }
  }
  public void animar(Casillero obs[]) {
    if (this.granos[0]!=null) {
      int tm=this.granos[0].tm;
      int px, py;
      boolean avanzar=true;
      boolean avanzarDerecha=true;
      boolean avanzarIzquierda=true;
      this.alcanzoLimite=false;
      for (int i=0; i<this.granos.length; i++) {
        px=(this.granos[i].x/tm)-1;
        py=(this.granos[i].y/tm)-1;
        avanzar=true;
        avanzarDerecha=true;
        avanzarIzquierda=true;
        this.alcanzoLimite=false;
        if (py<this.grilla.cantidadCasillerosY-1) {
          for (int j=0; j<obs.length; j++) {
            if (obs[j]!=null) {
              if (this.granos[i].y==obs[j].y-tm && this.granos[i].x==obs[j].x || this.grilla.matriz[py+1][px].tipo=="arena") {
                avanzar=false;
              }
              if (this.granos[i].y==obs[j].y-tm && this.granos[i].x==obs[j].x-tm || this.granos[i].y==obs[j].y && this.granos[i].x==obs[j].x-tm) {
                avanzarDerecha=false;
              }
              if (this.granos[i].y==obs[j].y-tm && this.granos[i].x==obs[j].x+tm || this.granos[i].y==obs[j].y && this.granos[i].x==obs[j].x+tm) {
                avanzarIzquierda=false;
              }
              if (!avanzar && !avanzarDerecha && !avanzarIzquierda) {
                this.grilla.matriz[py][px].tipo="arena";
              }
            }
          }
          if (avanzar && this.grilla.matriz[py+1][px].tipo=="vacio") {
            py++;
            this.granos[i].y=this.grilla.matriz[py][px].y;
          } else if (avanzarIzquierda && this.grilla.matriz[py+1][px-1].tipo=="vacio" && px>1) {
            py++;
            px--;
            this.granos[i].y=this.grilla.matriz[py][px].y;
            this.granos[i].x=this.grilla.matriz[py][px].x;
          } else if (avanzarDerecha && this.grilla.matriz[py+1][px+1].tipo=="vacio" && px+1<this.grilla.cantidadCasillerosX-1) {
            py++;
            px++;
            this.granos[i].y=this.grilla.matriz[py][px].y;
            this.granos[i].x=this.grilla.matriz[py][px].x;
          } else {
            if (this.granos[i].y==200) {
              this.alcanzoLimite=true;
            }
            this.grilla.matriz[py][px].tipo="arena";
            this.granos[i].y=this.grilla.matriz[py][px].y;
            this.granos[i].x=this.grilla.matriz[py][px].x;
          }
        }else {
          if (this.granos[i].y==200) {
            this.alcanzoLimite=true;
          }
          this.grilla.matriz[py][px].tipo="arena";
          this.granos[i].y=this.grilla.matriz[py][px].y;
          this.granos[i].x=this.grilla.matriz[py][px].x;
        } 
      }
    }
  }

  public void reducir() {
    int cantidadArena=0;
    int cantidadReducir=0;
    Casillero restantes[];
    Casillero eliminar[];
    if (this.alcanzoLimite) {
      for (int i=0; i<this.granos.length; i++) {
        if (this.granos[i].y<this.grilla.cantidadCasillerosY*this.grilla.tm) {
          cantidadArena++;
        } else {
          cantidadReducir++;
        }
      }
      restantes=new Casillero[cantidadArena];
      eliminar=new Casillero[cantidadReducir];
      int iRes=0;
      int iRed=0;
      for (int i=0; i<this.granos.length; i++) {
        if (this.granos[i].y<this.grilla.cantidadCasillerosY*this.grilla.tm) {
          restantes[iRes]=this.granos[i];
          iRes++;
        } else {
          eliminar[iRed]=this.granos[i];
          iRed++;
        }
      }
      for (int i=0; i<eliminar.length; i++) {
        eliminar[i].borrar();
      }
      this.granos=restantes;
      this.alcanzoLimite=false;
    }
    for (int i=0; i<this.grilla.matriz.length; i++) {
      for (int j=0; j<this.grilla.matriz[i].length; j++) {
        this.grilla.matriz[i][j].tipo="vacio";
      }
    }
  }
  public void borrar(boolean activado) {
    if (activado && this.granos[0]!=null) {
      int c=0;
      Casillero aux[]=new Casillero[this.granos.length-1];
      for (int i=0; i<this.granos.length; i++) {
        if (dist(this.granos[i].x, this.granos[i].y, mouseX, mouseY)>this.granos[0].tm/2) {
          aux[c]=this.granos[i];
          c++;
        }
      }
      this.granos=aux;
    }
  }
}
