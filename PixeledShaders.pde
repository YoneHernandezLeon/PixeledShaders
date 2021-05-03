//https://www.fonditos3d.com/imagenes-olas-de-colores-jpg-800x600
PShape picture;
PImage image[];
PShader sh;
boolean flag;
float mX, mY;
int count, maxCount;

void setup() {
  size(900, 700, P3D);
  
  count = 0;
  maxCount = 5;
  
  image = new PImage[maxCount];
  image[0] = loadImage("Images/colores.jpg");
  image[1] = loadImage("Images/espacio.jpg");
  image[2] = loadImage("Images/ciudad.jpg");
  image[3] = loadImage("Images/conejos.jpg");
  image[4] = loadImage("Images/arbol.jpg");
  
  beginShape();
  picture = createShape(RECT, 50, 75, 800, 600);
  endShape();
  
  sh = loadShader("fragment.glsl", "vertex.glsl");
  
  flag = false;
}

void draw() {
  background(230);
  
  picture.setTexture(image[count]);
  
  if (flag){
    mX = float(mouseX) / width;
    mY = float(mouseY) / width;
    
    sh.set("u_resomouse", mX, mY);
    shader(sh);
  }
  
  shape(picture);
  
  resetShader();
  fill(0);
  textSize(15);
  text("Hold LEFT CLICK and move the mouse to modify the image.\nPress RIGHT CLICK to change images", 10, 30);
}

void mousePressed(){
  resetShader();
  if (mouseButton == LEFT){
    flag = true;
  } else if (mouseButton == RIGHT){
    count ++;
    if (count == maxCount){
      count = 0;
    }
  }
}

void mouseReleased(){
  resetShader();
  if (mouseButton == LEFT){
    flag = false;
  }
}
