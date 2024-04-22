class Personaje {
  PVector pos;
  PImage img;
  float velocidad;

  Personaje(String imagePath, float x, float y, float velocidad, int ancho, int alto) {
    img = loadImage(imagePath);
    img.resize(ancho, alto); // Ajustar el tamaño de la imagen
    pos = new PVector(x, y);
    this.velocidad = velocidad;
  }

  void dibujar() {
    image(img, pos.x, pos.y);
  }

  void mover() {
    if (keyPressed) {
      if (keyCode == LEFT) {
        pos.x -= velocidad;
      } else if (keyCode == RIGHT) {
        pos.x += velocidad;
      }
    }
  }
}

Personaje mario;

void setup() {
  size(400, 400);
  mario = new Personaje("mariocorriendo.gif", width / 2, height / 2, 5, 100, 100);
}

void draw() {
  background(255);
  mario.dibujar();
}
