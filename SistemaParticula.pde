class SistemaParticula {

  int total;
  Particula[] particulas;  

  
  SistemaParticula(int total) {
    particulas = new Particula[total]; //Total de particulas que tendrá el sistema
    for (int i=0; i<total; i++) {
      particulas[i] = new Particula();
    }
  }

  void run() {
    stroke(0);
    for (Particula p : particulas) {
      if (mousePressed) { //Si le damos click las particulas se atraen al mouse
        p.attractToMouse();
      } else {
        PVector grav = gravedad.get();//Si no las atrae la gravedad y caen
        grav.mult(p.masa);
        p.addForce(grav); 
      }
      p.run();
    }
  }
}
