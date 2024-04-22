class FondoMario {
  PImage img;

  FondoMario(String rutaImagen, int ancho, int alto) {
    img = loadImage(rutaImagen);
    img.resize(ancho, alto); // Ajustar el tamaño de la imagen
  }

  void dibujar() {
    image(img, 0, 0, width, height);
  }
}

FondoMario fondoMario;

void setup() {
  size(700, 450);
  fondoMario = new FondoMario("fondomario.png", width, height);
}

void draw() {
  fondoMario.dibujar();
}
