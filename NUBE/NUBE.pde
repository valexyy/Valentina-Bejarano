class Nube {
  PVector pos;
  PImage img;
  float velocidad;
  int direccion = 1;

  Nube(String imagePath, float x, float y, float velocidad, int ancho, int alto) {
    img = loadImage(imagePath);
    img.resize(ancho, alto); // Ajustar el tamaño de la imagen
    pos = new PVector(x, y);
    this.velocidad = velocidad;
  }

  void dibujar() {
    image(img, pos.x, pos.y);
  }

  void mover() {
    pos.x += velocidad * direccion;
    if (pos.x > width - img.width || pos.x < 0) {
      direccion *= -1;
    }
  }
}

Nube nube;

void setup() {
  size(400, 400);
  nube = new Nube("nubes.png", random(width), random(height), 1, 80, 40);
}

void draw() {
  background(255);
  nube.dibujar();
  nube.mover();
}
