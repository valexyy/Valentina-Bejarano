class HongoCayendo {
  PVector pos;
  PImage img;
  float velocidad;

  HongoCayendo(String imagePath, float x, float velocidad, int ancho, int alto) {
    img = loadImage(imagePath);
    img.resize(ancho, alto); // Ajustar el tamaño de la imagen
    pos = new PVector(x, 0);
    this.velocidad = velocidad;
  }

  void dibujar() {
    image(img, pos.x, pos.y);
  }

  void caer() {
    pos.y += velocidad;
    if (pos.y > height) {
      pos.y = 0;
      pos.x = random(width);
    }
  }
}

HongoCayendo hongo;

void setup() {
  size(400, 400);
  hongo = new HongoCayendo("hongocayendo.png", random(width), 2, 30, 30);
}

void draw() {
  background(255);
  hongo.dibujar();
  hongo.caer();
}
