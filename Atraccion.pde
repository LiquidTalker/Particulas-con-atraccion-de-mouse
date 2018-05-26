//declaramos variables
PVector gravedad;
SistemaParticula s; 

void setup() {
  size(600, 450); //Le damos el tamaño a la ventana
  //inicializamos
  gravedad = new PVector(0, 0.1); 
  s = new SistemaParticula(500); //Mandamos la cantidad de particulas que queremos generar
}

void draw() {
  background(0);
  s.run();
}
