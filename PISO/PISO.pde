class PisoMario {
  PVector pos;
  PImage img;

  PisoMario(String rutaImagen, int x, int y, int ancho, int alto) {
    img = loadImage("pisomario.png"); // Usa la ruta de la imagen proporcionada
    img.resize(ancho, alto); // Ajusta el tamaño de la imagen
    pos = new PVector(x, y);
  }

  void dibujar() {
    image(img, pos.x, pos.y);
  }
}

PisoMario pisoMario;

void setup() {
  size(400, 400);
  pisoMario = new PisoMario("pisomario.png", 0, height - 50, width, 50);
}

void draw() {
  background(255);
  pisoMario.dibujar();
}
