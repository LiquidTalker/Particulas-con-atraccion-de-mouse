class Particula{

  PVector posicion, velocidad, aceleracion;
  float friccion, tamanoMaximo, tamanoMinimo, tamano, masa;

  Particula() {
    posicion = new PVector(random(width), random(5, 60)); //Posición random al momento de correr el programa
    velocidad = new PVector(0, 0);
    aceleracion = new PVector(0, 0);
    tamanoMinimo = 10; //Tamaño minimo que puede tener la particula
    tamanoMaximo = 25; //Tamaño maximo que puede tener la particula 
    tamano = random(tamanoMinimo, tamanoMaximo); //Se le da un tamaño random entre el tamaño minimo y el maximo 
    masa = map(tamano, tamanoMinimo, tamanoMaximo, 1, 2); 
    friccion = 1.2;//mayor a 1 mejor
  }

  void run() {
    update();
    drawMe();
  }

  void update() {  
    //Añadimos el valor de gravedad (aceleración) a la velocidad y velocidad a la posición
    velocidad.add(aceleracion);
    velocidad.limit(10);
    posicion.add(velocidad);
    aceleracion.mult(0);

    //comprobamos los bordes de la ventana
    //en la ventana horizontal
    if (posicion.x < tamano/2) {
      velocidad.x *= -1;
      velocidad.div(masa*friccion);//Fricción
      posicion.x = tamano/2;
    } 
    else if (posicion.x > width-tamano/2) {
      velocidad.x *= -1;
      velocidad.div(masa*friccion);//Fricción
      posicion.x = width-tamano/2;
    }
    //pero en lo vertical sólo abajo, y reduciendo cada vez la velocidad, para simular fricción.

    if (posicion.y > height-tamano/2) {
      velocidad.y *= -1;
      velocidad.div(masa*friccion);//Fricción
      //para que no se enganche:
      posicion.y = height-tamano/2;
    } 
    else if (posicion.y - tamano/2 < 0) {
      velocidad.y *= -1;
      velocidad.div(masa*friccion);//Fricción
      //para que no se enganche:
      posicion.y = tamano/2;
    }
  }

  void drawMe() {
    //Dibujamos
    ellipse(posicion.x, posicion.y, tamano, tamano);
  }

  void addForce(PVector _f) {
    PVector f = PVector.div(_f, masa);
    aceleracion.add(f);//.add(f);
  }

  //Metodo que atrae las particulas hacia el mouse  
  void attractToMouse() {
    PVector mouseVector = new PVector(mouseX, mouseY);
    PVector dis = PVector.sub(mouseVector, posicion);
    dis.div(50);
    addForce(dis);
  }
}
