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

class Elemento {
  PVector pos;
  PImage img;
  float velocidad;

  Elemento(String imagePath, float velocidad, int ancho, int alto) {
    img = loadImage(imagePath);
    img.resize(ancho, alto); // Ajustar el tamaño de la imagen
    pos = new PVector(random(width), 0);
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

  boolean tocar(Personaje mario) {
    if (abs(pos.x - mario.pos.x) < img.width && abs(pos.y - mario.pos.y) < img.height) {
      return true;
    }
    return false;
  }
}

class Fondo {
  PImage img;

  Fondo(String imagePath, int ancho, int alto) {
    img = loadImage(imagePath);
    img.resize(ancho, alto); // Ajustar el tamaño de la imagen
  }

  void dibujar() {
    image(img, 0, 0);
  }
}

class Piso {
  PVector pos;
  PImage img;

  Piso(String rutaImagen, int x, int y, int ancho, int alto) {
    img = loadImage(rutaImagen);
    img.resize(ancho, alto); // Ajustar el tamaño de la imagen
    pos = new PVector(x, y);
  }

  void dibujar() {
    image(img, pos.x, pos.y);
  }
}

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

Personaje mario;
Elemento hongo;
Fondo fondoMario;
Piso pisoMario;
Nube nube;

void setup() {
  size(700, 300);
  mario = new Personaje("mariocorriendo.gif", width / 2, height - 100, 5, 50, 50);
  hongo = new Elemento("hongocayendo.png", 2, 30, 30);
  fondoMario = new Fondo("fondomario.png", width, height);
  pisoMario = new Piso("pisomario.png", 0, height - 50, width, 50);
  nube = new Nube("nubes.png", 0, 100, 1, 80, 40);
}

void draw() {
  fondoMario.dibujar();
  pisoMario.dibujar();
  nube.dibujar();
  nube.mover();
  mario.dibujar();
  mario.mover();
  hongo.dibujar();
  hongo.caer();

  if (hongo.tocar(mario)) {
    hongo.pos.y = height; // Hacer que el hongo desaparezca o se reinicie su posición
  }
}
