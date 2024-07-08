import processing.sound.*;
SoundFile pantai;

PFont f;
PFont s;
int t = 1;
int y = 25;
int x = 20;
int arah = 10;
int jalan = 10;

float angle = 0;
float angleSpeed = 0.2;

void setup(){
  size(1280,720);
  background(#f4f4f4);
  f = createFont("Showcard Gothic", 80, true);
  s = createFont("Arial", 40, true);
  frameRate(1);
  
  pantai = new SoundFile(this, "AudioDubbingSementara.mp3");
  pantai.play();
}

void bajo1(int x, int y, int xkiri, int xkanan, int mulut){
  strokeWeight(0);
  stroke(111, 172, 49);
  fill(111, 172, 49);
  ellipse(x+10, y+15, 250, 290);
  
  beginShape();
  strokeWeight(3);
  stroke(63, 97, 28);
  fill(63, 97, 28);
  vertex(x+5, y-64);
  vertex(x+40, y-78);
  vertex(x+80, y-60);
  vertex(x+117, y-59);
  bezierVertex(x+100, y-130, x-40, y-180, x-120, y-60);
  bezierVertex(x-50, y-40, x+60, y-140, x+5, y-64);
  endShape();
  
  rect(x-3, y-170, 15, 45);
  //textFont(f, 80);
  //text("BAJO", x-75, y+260);
  
  strokeWeight(1);
  stroke(#ffffff);
  fill(#ffffff);
  ellipse(x-40, y-10, 43, 60);
  ellipse(x+60, y-10, 43, 60);
  
  strokeWeight(2);
  stroke(#000000);
  fill(#000000);
  ellipse(x-xkiri, y-10, 18, 25);
  ellipse(x+xkanan, y-10, 18, 25);
  
  strokeWeight(2);
  stroke(#000000);
  fill(111, 172, 49);
  rect(x-42, y+70, 100, mulut);
}

void bajo2(int x, int y, int xkiri, int xkanan, int mulut){
  strokeWeight(0);
  stroke(111, 172, 49);
  fill(111, 172, 49);
  ellipse(x, y, 150, 170);
  
  beginShape();
  strokeWeight(3);
  stroke(63, 97, 28);
  fill(63, 97, 28);
  vertex(x-1, y-39);
  vertex(x+15, y-54);
  vertex(x+30, y-54);
  vertex(x+65, y-40);
  bezierVertex(x+50, y-85, x-30, y-110, x-70, y-40);
  bezierVertex(x-55, y-50, x+30, y-30, x+5, y-110);
  endShape();
  
  strokeWeight(1);
  stroke(#ffffff);
  fill(#ffffff);
  ellipse(x-30, y-10, 27, 42);
  ellipse(x+30, y-10, 27, 42);
  
  strokeWeight(2);
  stroke(#000000);
  fill(#000000);
  ellipse(x-xkiri, y-10, 10, 18);
  ellipse(x+xkanan, y-10, 10, 18);
  
  strokeWeight(2);
  stroke(#000000);
  fill(111, 172, 49);
  rect(x-27, y+39, 50, mulut);
}

void judul(String teks ,int x, int y, int size, int jwarna){
  fill(jwarna);
  textFont(f, size);
  text(teks ,x, y);
}

void subtitle(String sub, int x, int y, int warna){
  fill(warna);
  textFont(s, 20);
  text(sub ,x, y);
}

void drawMountains() {
  noStroke();
  
  // Gunung depan
  fill(85, 107, 47); // Warna hijau gelap
  beginShape();
  vertex(0, height/2);
  vertex(200, 300);
  vertex(400, height/2);
  vertex(600, 250);
  vertex(800, height/2);
  vertex(1000, 200);
  vertex(1280, height/2);
  vertex(1280, height);
  vertex(0, height);
  endShape(CLOSE);
  
  // Gunung belakang
  fill(107, 142, 35); // Warna hijau lebih terang
  beginShape();
  vertex(100, height/2);
  vertex(300, 250);
  vertex(500, height/2);
  vertex(700, 200);
  vertex(900, height/2);
  vertex(1100, 150);
  vertex(1280, height/2);
  vertex(1280, height);
  vertex(100, height);
  endShape(CLOSE);
}

void drawBeach() {
  noStroke();
  fill(255, 182, 193); // Warna pasir merah muda
  rect(0, height/2, width, height/2);
}

void drawSea() {
  fill(0, 105, 148); // Warna laut biru
  rect(0, height/2, width, height/4);
  drawWaves();
}

void drawWaves() {
  noFill();
  stroke(255); // Warna putih untuk ombak
  strokeWeight(2);

  for (int y = height/2 + 10; y < height/2 + height/4; y += 20) {
    beginShape();
    for (int x = 0; x <= width; x += 5) {
      float waveHeight = 10 * sin(TWO_PI * (x * 0.05 + frameCount * 0.01));
      float waveDetail = 5 * sin(TWO_PI * (x * 0.2 + frameCount * 0.02));
      vertex(x, y + waveHeight + waveDetail);
    }
    endShape();
  }
}

void drawFish(float x, float y, color c) {
  fill(c);
  noStroke();
  
  // Tubuh ikan
  ellipse(x, y, 100, 50);
  
  // Ekor ikan
  beginShape();
  vertex(x - 50, y);
  vertex(x - 70, y - 20);
  vertex(x - 70, y + 20);
  endShape(CLOSE);
  
  // Mata ikan
  fill(255);
  ellipse(x + 30, y - 10, 10, 10);
  
  fill(0);
  ellipse(x + 30, y - 10, 5, 5);
}

void draw(){
  
  //scene 1
  if((t>0) && (t<=2)){
    judul("EXPLORE PANTAI PINK",320, 350, 60, #c9188e);
  }
  
  //scene 2
  if((t>2) && (t<=4)){
    background(#f4f4f4);
    bajo1(630, 350, 40, 60, 2); //liat depan
  }
  
  //scene 2.1
  if((t>4) && (t<=6)){
    bajo1(630, 350, 30, 70, 10);
    subtitle("Hai !", 620, 600, #000000); //lirik kanan
  }
  
  //scene 2.2
  if((t>6) && (t<=8)){
    bajo1(630, 350, 50, 50, 2); //lirik kiri
  }
  
  //scene 2.3
  if((t>8) && (t<=9)){
    bajo1(630, 350, 40, 60, 1);
  }
  
  //scene 3
  if((t>9) && (t<=19)){
    background(#f4f4f4);
    
    //pohon kelapa
    fill(#3d2a02);
    stroke(#ffffff);
    beginShape();
    vertex(-20, 600);
    vertex(100, 100);
    vertex(110, 100);
    vertex(80,800);
    endShape();
    
    fill(#0a8501);
    beginShape();
    vertex(100, 105);
    bezierVertex(180, 80, 180, 80, 270, 190);
    endShape();
    
    
    fill(#0a8501);
    beginShape();
    vertex(100, 105);
    bezierVertex(140, 40, 140, 30, 250, 30);
    endShape();
    
    fill(#0a8501);
    beginShape();
    vertex(102, 108);
    bezierVertex(100, 60, 70, 60, 140, 5);
    endShape();
    
    fill(#0a8501);
    beginShape();
    vertex(100, 105);
    bezierVertex(180, 60, 180, 80, 270, 90);
    endShape();
    
    fill(#0a8501);
    beginShape();
    vertex(100, 105);
    bezierVertex(90, 40, 90, 30, -20, 45);
    endShape();
    
    fill(#0a8501);
    beginShape();
    vertex(100, 105);
    bezierVertex(50, 80, 50, 40, -30, 120);
    endShape();
    
    fill(111, 172, 4);
    ellipse(105, 118, 25, 30);
    ellipse(95, 114, 20, 30);
    
    //pasir
    fill(#ffb6c1);
    stroke(#ffb6c1);
    rect(0, 580, 1280, 200);
    
    //matahari
    fill(#edb009);
    stroke(#edb009);
    ellipse(1100, 100, 90, 90);
 
    bajo1(400, 400, 40, 60, 10);
  }
  
  //scene 3.1
  if((t>11) && (t<=19)){
    subtitle("Halo kawan Bahari...", 700, 260, #000000);
  }
  
  if((t>12) && (t<=19)){
    bajo1(400, 400, 40, 60, 1);
    subtitle("kenalin aku Bajo dari surga tersembunyi ", 700, 285, #000000);
  }
  
  if((t>14) && (t<=19)){
    bajo1(400, 400, 30, 70, 10);
    subtitle("yang ada di Indonesia bagian timur yaitu", 700, 310, #000000);
  }
  
  if((t>16) && (t<=19)){
    bajo1(400, 400, 40, 60, 1);
    judul("-Labuan Bajo-", 750, 370, 30, #6fac31);
  }
  
  if((t>19) && (t<=26)){
    background(#f4f4f4);
    
    //pohon kelapa
    fill(#3d2a02);
    stroke(#ffffff);
    beginShape();
    vertex(-20, 600);
    vertex(100, 100);
    vertex(110, 100);
    vertex(80,800);
    endShape();
    
    fill(#0a8501);
    beginShape();
    vertex(100, 105);
    bezierVertex(180, 80, 180, 80, 270, 190);
    endShape();
    
    fill(#0a8501);
    beginShape();
    vertex(100, 105);
    bezierVertex(140, 40, 140, 30, 250, 30);
    endShape();
    
    fill(#0a8501);
    beginShape();
    vertex(102, 108);
    bezierVertex(100, 60, 70, 60, 140, 5);
    endShape();
    
    fill(#0a8501);
    beginShape();
    vertex(100, 105);
    bezierVertex(180, 60, 180, 80, 270, 90);
    endShape();
    
    fill(#0a8501);
    beginShape();
    vertex(100, 105);
    bezierVertex(90, 40, 90, 30, -20, 45);
    endShape();
    
    fill(#0a8501);
    beginShape();
    vertex(100, 105);
    bezierVertex(50, 80, 50, 40, -30, 120);
    endShape();
    
    fill(111, 172, 4);
    ellipse(105, 118, 25, 30);
    ellipse(95, 114, 20, 30);
    
    //pasir
    fill(#ffb6c1);
    stroke(#ffb6c1);
    rect(0, 580, 1280, 200);
    
    //matahari
    fill(#edb009);
    stroke(#edb009);
    ellipse(1100, 100, 90, 90);
    
    bajo1(400, 400, 40, 60, 1);
    subtitle("Kali ini Bajo mau ajak kalian kenalan", 700, 260, #000000);
  }
  
  if((t>20) && (t<=26)){
    bajo1(400, 400, 40, 60, 10);
    subtitle("dengan salah satu pantai yang cantik dan unik di", 700, 285, #000000);
  }
  
  if((t>21) && (t<=26)){
    bajo1(400, 400, 40, 60, 5);
    judul("Labuan Bajo", 700, 330, 30, #6fac31);
  }
  
  //scene 4 ombak
  if((t>26) && (t<=125)){
    
    //bg pantai
    background(#ffb6c1);
    stroke(#4a9eed);
    fill(#4a9eed);
    beginShape();
    vertex(0,350);
    vertex(0,0);
    vertex(1280,0);
    vertex(1280,350);
    bezierVertex(850, 350, 500, 200, 620, 390);
    bezierVertex(150, 150, 250, 500, 0, 350);
    endShape();
    
    bajo2(x, 600, 30, 30, 10);
    frameRate(5);
    x += jalan;
    
    if(x > width){
    x =- 50;
    }
 
  }
  
  if((t>123) && (t<=125)){
    bajo2(1000, 600, 25, 35, 1);//lirik kanan
  }
  
  if((t>124) && (t<=125)){
    bajo2(1000, 600, 30, 30, 1);//depan
  }
  //scene 5 coral
  if((t>125) && (t<=189)){
    
    //bg pantai
    background(#ed4ae8);
    stroke(#4a9eed);
    fill(#4a9eed);
    beginShape();
    vertex(0,350);
    vertex(0,0);
    vertex(1280,0);
    vertex(1280,350);
    bezierVertex(850, 350, 500, 210, 620, 390);
    bezierVertex(150, 150, 250, 500, 0, 350);
    endShape();
    
    //coral
    fill(#c9188e);
    stroke(#910462);
    
    ellipse(400, 500, 70, 30);
    ellipse(730, 450, 50, 100);
    
    beginShape();
    vertex(500, 400);
    bezierVertex(530, 350, 570, 400, 500, 450);
    bezierVertex(430, 370, 480, 390, 500,400);
    endShape();
    
    beginShape();
    vertex(500,500);
    bezierVertex(550, 400, 530, 440, 600,500);
    vertex(500, 500);
    endShape();
    
    beginShape();
    vertex(610,440);
    bezierVertex(570, 350, 590, 350, 620,430);
    bezierVertex(690, 310, 690, 350, 630,450);
    vertex(630, 480);
    bezierVertex(680, 450, 680, 470, 630, 500);
    bezierVertex(610, 600, 610, 610, 610, 440);
    endShape();
    
    bajo2(1000, 600, 35, 25, 10);//lirik kiri
  }
  
  if((t>185) && (t<=189)){
   bajo2(1000, 600, 30, 30, 1);//depan
  }
  
  //scene bawah laut
  if((t>189) && (t<=211)){
      background(0, 119, 190);  
  
  // Ikan
  drawFish(400, 300, color(255, 100, 100));  // Ikan merah
  drawFish(800, 400, color(100, 255, 100));  // Ikan hijau
  drawFish(200, 600, color(100, 100, 255));  // Ikan biru
  
  //terumbu karang
  fill(#c9188e);
  stroke(#910462);
  beginShape();
    vertex(610,440);
    bezierVertex(570, 350, 590, 350, 620,430);
    bezierVertex(690, 310, 690, 350, 630,450);
    vertex(630, 480);
    bezierVertex(680, 450, 680, 470, 630, 500);
    bezierVertex(610, 600, 610, 610, 610, 440);
  endShape();
  
  beginShape();
    vertex(210,440);
    bezierVertex(170, 350, 190, 350, 220,430);
    bezierVertex(290, 310, 290, 350, 230,450);
    vertex(230, 480);
    bezierVertex(280, 450, 280, 470, 230, 500);
    bezierVertex(210, 600, 210, 610, 210, 440);
  endShape();
  
  beginShape();
    vertex(1010,440);
    bezierVertex(970, 350, 990, 350, 1020,430);
    bezierVertex(1090, 310, 1090, 350, 1030,450);
    vertex(1030, 480);
    bezierVertex(1080, 450, 1080, 470, 1030, 500);
    bezierVertex(1010, 600, 1010, 610, 1010, 440);
  endShape();
  
  // Warna pasir coklat
  noStroke();
  fill(210, 180, 140);  // Warna pasir (R:210, G:180, B:140)
  
  // Menggambar pasir bergelombang
  beginShape();
  for (int x = 0; x <= width; x++) {
    float y = height * 0.75 + 20 * sin(TWO_PI * x / 200.0);  // Gelombang menggunakan sinus
    vertex(x, y);
  }
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  
  // Menambahkan tekstur pada pasir
  for (int x = 0; x < width; x++) {
    for (int y = int(height * 0.75); y < height; y++) {
      float noiseValue = noise(x * 0.1, y * 0.1);  // Menggunakan noise untuk tekstur
      stroke(210 + noiseValue * 30, 180 + noiseValue * 30, 140);  // Variasi warna pasir
      point(x, y);
    }
  }
  bajo2(1000, 600, 30, 30, 10);//depan
  }
  
  if((t>190) && (t<=210)){
  bajo2(1000, 600, 35, 25, 10);
  }
  
  //scene gunung
  if((t>211) && (t<=375)){
   background(#4a9eed);
   drawMountains();
   drawBeach();
   drawSea();
   
   bajo2(1000, 600, 35, 25, 1);
  }
  
  if((t>230) && (t<=370)){
    bajo2(1000, 600, 35, 25, 10);
  }
  
  //scene sunset
  if((t>375) && (t<=500)){ 
    background (#fbb825);
    
    stroke(#ffffff);
    fill(#ffffff);
    ellipse(200, 280, 200,200);
    
    
    stroke(#ffb6c1);
    fill(#ffb6c1);
    rect(0, 450, 1280, 400);
    
    stroke(#4a9eed);
    fill(#4a9eed);
    beginShape();
    vertex(0,520);
    vertex(0,300);
    vertex(1280,300);
    vertex(1280,520);
    bezierVertex(800, 400, 750, 580, 650, 580);
    bezierVertex(770, 480, 480, 450, 0, 520);
    endShape();
    
    //pohon kelapa
    fill(#3d2a02);
    stroke(#ffffff);
    beginShape();
    vertex(-40, 600);
    vertex(100, 100);
    vertex(110, 100);
    vertex(80,1000);
    endShape();
    
    fill(#0a8501);
    beginShape();
    vertex(100, 105);
    bezierVertex(180, 80, 180, 80, 270, 190);
    endShape();
    
    fill(#0a8501);
    beginShape();
    vertex(100, 105);
    bezierVertex(140, 40, 140, 30, 250, 30);
    endShape();
    
    fill(#0a8501);
    beginShape();
    vertex(102, 108);
    bezierVertex(100, 60, 70, 60, 140, 5);
    endShape();
    
    fill(#0a8501);
    beginShape();
    vertex(100, 105);
    bezierVertex(180, 60, 180, 80, 270, 90);
    endShape();
    
    fill(#0a8501);
    beginShape();
    vertex(100, 105);
    bezierVertex(90, 40, 90, 30, -20, 45);
    endShape();
    
    fill(#0a8501);
    beginShape();
    vertex(100, 105);
    bezierVertex(50, 80, 50, 40, -30, 120);
    endShape();
    
    fill(111, 172, 4);
    ellipse(105, 118, 25, 30);
    ellipse(95, 114, 20, 30);
     
    bajo2(1000, 600, 30, 30, 1);//depan
  }

  if((t>390) && (t<=450)){
  bajo2(1000, 600, 35, 25, 10);
  }
  
  if((t>450) && (t<=490)){
  bajo2(1000, 600, 35, 25, 10);
  }
  
  //scene penutup
   if((t>500) && (t<=510)){
    background(#f4f4f4);
    bajo1(630, 350, 30, 70, 10);
  }
  
  if((t>510) && (t<=511)){
    bajo1(630, 350, 50, 50, 2); //lirik kiri
  } 
  if((t>512) && (t<=513)){  
    bajo1(630, 350, 30, 70, 10);
  }
  
  if((t>514) && (t<=523)){
    background(#f4f4f4);
    bajo1(630, 350, 40, 60, 10); 
  }
  
  if((t>524) && (t<=525)){
    background(#f4f4f4);
    bajo1(630, 350, 40, 60, 2); 
  }
  
  t++;
}
