PImage backgroundImg, playerImg, enemyImg, floorImg, cloudsImg;
int playerX, playerY;
float enemyX, enemyY, enemySpeed = 50, enemyDirection = 1;
int playerSize = 100, enemySize = 100;

void setup() {
  size(800, 600);
  backgroundImg = loadImage("fondo.jpg");
  playerImg = loadImage("mario.png");
  enemyImg = loadImage("koopa.png");
  floorImg = loadImage("piso.jpg");
  cloudsImg = loadImage("nubes.png");
  playerImg.resize(playerSize, playerSize);
  enemyImg.resize(enemySize, enemySize);
  floorImg.resize(width, height/5);
  playerX = width/2;
  playerY = height - floorImg.height - playerSize;
  enemyX = 50;
  enemyY = height - floorImg.height - enemySize;
}

void draw() {
  image(backgroundImg, 0, 0, width, height);
  mostrarNubes();
  image(playerImg, playerX, playerY);
  enemyX += enemySpeed * enemyDirection;
  if (enemyX <= 0 || enemyX >= width - enemySize) {
    enemyDirection *= -1;
  }
  image(enemyImg, enemyX, enemyY);
  image(floorImg, 0, height - floorImg.height);
}

void keyPressed() {
  if (keyCode == LEFT) playerX -= 10;
  else if (keyCode == RIGHT) playerX += 10;
}

void mostrarNubes() {
  float cloud1X = random(width/2), cloud1Y = random(height/4);
  float cloud2X = random(width/2, width), cloud2Y = random(height/4);
  cloud1X += random(-1, 1);
  cloud1Y += random(-0.5, 0.5);
  cloud2X += random(-1, 1);
  cloud2Y += random(-0.5, 0.5);
  image(cloudsImg, cloud1X, cloud1Y, 50, 50);
  image(cloudsImg, cloud2X, cloud2Y, 50, 50);
}
