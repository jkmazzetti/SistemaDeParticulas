Grilla grilla;
Arena arena;
Obstaculo obstaculo;
int ancho, alto;
Boton borrarObs,crearAre,crearObs;


void setup(){
 background(0,1);
 ancho=400;
 alto=500;
 size(400,1000);
 grilla=new Grilla(10,ancho, alto);
 arena=new Arena(grilla);
 obstaculo=new Obstaculo(grilla);
 borrarObs=new Boton(60,700,100,"borrar");
 crearAre=new Boton(170,700,100,"arena");
 crearObs=new Boton(280,700,100,"obstaculo");
}
void draw(){  
  background(0);
 
 grilla.mostrar(); 
 if(borrarObs.estado){
   crearAre.desactivar();
   crearObs.desactivar();
 }
 if(crearAre.estado){
   borrarObs.desactivar();
   crearObs.desactivar();
 }
  if(crearObs.estado){
   borrarObs.desactivar();
   crearAre.desactivar();
 }
 borrarObs.mostrar();
 crearAre.mostrar();
 crearObs.mostrar();
 arena.mostrar();
 arena.crear(crearAre.estado);
 arena.reducir();
 arena.animar(obstaculo.obs);
 obstaculo.mostrar();
 obstaculo.crear(crearObs.estado);
 obstaculo.borrar(borrarObs.estado);
 
 borrarObs.cambiarEstado();
 crearAre.cambiarEstado();
 crearObs.cambiarEstado();  
  
 
 
}
