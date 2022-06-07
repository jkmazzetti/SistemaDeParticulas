Grilla grilla;
Arena arena;
Obstaculo obstaculo;
int ancho, alto;


void setup(){
 background(0);
 ancho=400;
 alro=600
 size(ancho,alto);
 grilla=new Grilla(25,ancho, alto);
 arena=new Arena(grilla);
 obstaculo=new Obstaculo(grilla);
}
void draw(){  
 grilla.mostrar();
 arena.mostrar();
 arena.crear(true);
 //arena.reducir();
 arena.animar(obstaculo.obs);
 obstaculo.mostrar();
 obstaculo.crear(true);
 
  
 
 
}
