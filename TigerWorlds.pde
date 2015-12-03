// Page 0
int anim = 0;
float counter = 0;
float rLA, rLA2, rRA, rRA2, rLL, rLL2, rRL, rRL2, rH, rT = 0;
float tx, ty;
float AD = 1;
float ADL = 1;
float ADL2 = 1;
float ADH = 1;
float ADT = 1;
PImage face;
PImage buzz;
// Page 1
float p;
float pv;
boolean power;
PImage golf;

float ADC = 1;
float bx, by;
float rC;
float bx2, by2;
boolean space;
float twy;
float bx3, by3;
float ttx, tty, tS;
float bS;
// Page 2
// Page 3
float rx, ry, rvx, rvy;
float counter3;
// Page 4
int count4 = 0;

ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Pickup> pickups = new ArrayList<Pickup>();

boolean isGameOver = false;
boolean isGameComplete = false;
int shield = 100;

int tDead = 0;
int tAlive = 0;
int rate = 1;

PImage imgStatic;
// Page 5
float tx5, ty5, t, t2, exUp;
color explosionColor, explosionColor2, explosionColor3, explosionColor4;
// Page 6
float healthB = 120;
float healthT = 120;
int fstage = 0;
PImage back;
int bCounter = 0;
// Page 7
// Page 8

void setup() {
  size(600, 600);
  if (anim == 0) {
    setup0();
  } else if (anim == 1) {
    setup1();
  } else if (anim == 2) {
    //setup2();
    anim++;
    setup();
  } else if (anim == 3) {
    setup3();
  } else if (anim == 4) {
    setup4();
  } else if (anim == 5) {
    setup5();
  } else if (anim == 6) {
    setup6();
  }
}

void draw() {
  if (anim == 0) {
    draw0();
  } else if (anim == 1) {
    draw1();
  } else if (anim == 2) {
    anim++;
  } else if (anim == 3) {
    draw3();
  } else if (anim == 4) {
    draw4();
  } else if (anim == 5) {
    draw5();
  } else if (anim == 6) {
    draw6();
  }
  if (anim > 6) {
    anim = 0;
    setup();
  }
}

void mousePressed() {
  /*anim++;
   setup();
   if (anim > 6) {
   anim = 0;
   setup();
   } */
  if (anim == 6) {
    mouse6();
  }
}

void keyPressed() {
  if (anim == 0) {
    keyp0();
  } else if (anim == 1) {
    keyp1();
  } else if (anim == 4) {
    keyp4();
  }
}

void keyReleased() {
  if (anim == 1) {
    keyr1();
  } else if (anim == 4) {
    keyr4();
  }
}

// Page 0
void setup0() {
  noStroke();
  ty = 580;
  face = loadImage("face.png");
  buzz = loadImage("buzz.png");
}
void draw0() {
  startscreen();
}
void keyp0() {
  anim++;
  setup();
}
void startscreen() {
  background(150);
  fill(#0DB4FF);
  rect(0, 0, 1000, 600);
  fill(#40FF03);
  rect(0, 600, 1000, 400);
  tiger(200, ty, 1, rLA, rLA2, rRA, rRA2, rLL, rLL2, rRL, rRL2, rH, rT);
  buzz(400, ty, 1, rLA, rLA2, rRA, rRA2, rLL, rLL2, rRL, rRL2, rH, rT);
  counter++;

  rLA = rLA + AD;
  rRA = rRA - AD;
  rLA2 = rLA2 + ADL2 * 3;
  rRA2 = rRA2 - ADL2 * 3;
  rLL = rLL + ADL * 2;
  rRL = rRL - ADL * 2;
  rH = rH + ADH * .6;
  rLL2 = rLL2 - ADL * 2;
  rRL2 = rRL2 + ADL * 2;
  rT = rT + ADT * .4;
  ty = ty + ADL;
  if (rLA == 0) {
    AD = 1;
    //counter++;
  } else if (rLA == 70) {

    AD = -1;
    // counter = counter - 1;
  }

  if (rLL == 0) {
    ADL = 1;
  } else if (rLL == 70) {
    ADL = -1;
  } else if ( rLA2 < -80) {
    ADL2 = 1;
  } else if (rLA2 > 50) {
    ADL2 = -1;
  } else if (rH > 20) {
    ADH = -1;
  } else if (rH < -20) {
    ADH = 1;
  } else if (rT > 11) {
    ADT = -1;
  } else if (rT < -11) {
    ADT = 1;
  }
  fill(random(0, 255), random(0, 255), random(0, 255));
  textSize(80);
  text("TIGER WORLDS", 10, 200);
  textSize(30);
  text("hit any button to start", 150, 250);
}


void tiger(float tx, float ty, float S, float rLA, float rLA2, float rRA, float rRA2, float rLL, float rLL2, float rRL, float rRL2, float rH, float rT) {

  pushMatrix();

  translate(tx, ty);
  scale(.75);

  //hip
  fill(36);
  rect(-71, -14, 142, 28);
  //fill(186);
  //rect(-17, -17, 34, 34);

  pushMatrix();

  rotate(0);
  //torso

  rotate(radians(rT));

  fill(232, 36, 50);
  rect(-40, -200, 80, 186);

  pushMatrix();

  translate(0, -200);
  rotate(0);
  translate(0, 200);
  //shoulder

  rect(-70, -200, 140, 30);

  pushMatrix();

  //neck
  fill(165, 104, 57);
  rect(-20, -250, 40, 60);

  pushMatrix();


  translate(-60, -360);
  translate(60, 140);
  rotate(radians(rH));
  translate(-60, -140);


  image(face, 0, 0);
  popMatrix();
  popMatrix();

  pushMatrix();

  //left-arms
  fill(232, 36, 50);
  translate(-70, -190);
  rotate(radians(rLA));
  translate(70, 190);

  rect(-85, -190, 30, 100);
  pushMatrix();

  translate(-70, -100);
  rotate(radians(rLA2));
  translate(70, 100);

  fill(165, 104, 57);
  rect(-85, -100, 30, 100);


  popMatrix();


  popMatrix();

  pushMatrix();
  //right-arms

  translate(70, -190);
  rotate(radians(rRA));
  translate(-70, 190);

  fill(232, 36, 50);
  rect(55, -190, 30, 100);
  pushMatrix();

  translate(70, -100);
  rotate(radians(rRA2));
  translate(-70, 100);

  fill(165, 104, 57);
  rect(55, -100, 30, 100);

  popMatrix();

  popMatrix();
  popMatrix();

  popMatrix();

  pushMatrix();

  //leg-left
  translate(-56, 0);
  rotate(radians(rLL));
  translate(56, 0);

  fill(36);
  rect(-71, 0, 35, 100);

  pushMatrix();

  translate(-56, 90);
  rotate(radians(rLL2));
  translate(56, -90);


  rect(-71, 90, 35, 80);
  popMatrix();

  popMatrix();

  pushMatrix();

  //leg-right

  translate(56, 0);
  rotate(radians(rRL));
  translate(-56, 0);
  rect(36, 0, 35, 100);

  pushMatrix();

  translate(56, 90);
  rotate(radians(rRL2));
  translate(-56, -90);

  rect(36, 90, 35, 80);

  popMatrix();
  popMatrix();
  popMatrix();
}


void buzz(float tx, float ty, float S, float rLA, float rLA2, float rRA, float rRA2, float rLL, float rLL2, float rRL, float rRL2, float rH, float rT) {

  pushMatrix();

  translate(tx, ty);
  scale(.75);

  //hip
  fill(185);
  rect(-71, -14, 142, 28);
  //fill(186);
  //rect(-17, -17, 34, 34);

  pushMatrix();

  rotate(0);
  //torso

  rotate(radians(rT));

  fill(195);
  rect(-40, -200, 80, 186);

  pushMatrix();

  translate(0, -200);
  rotate(0);
  translate(0, 200);
  //shoulder

  rect(-70, -200, 140, 30);

  pushMatrix();

  //neck
  fill(180);
  rect(-20, -250, 40, 60);

  pushMatrix();


  translate(-205, -715);
  translate(200, 500);
  rotate(radians(rH));
  scale(.35);
  translate(-200, -500);
  image(buzz, 0, 0);
  fill(#B8F0EE);
  stroke(180);
  strokeWeight(20);
  ellipse(200, 250, 600, 600);
  noStroke();
  popMatrix();
  popMatrix();

  pushMatrix();

  //left-arms
  fill(190);
  translate(-70, -190);
  rotate(radians(rLA));
  translate(70, 190);

  rect(-85, -190, 30, 100);
  pushMatrix();

  translate(-70, -100);
  rotate(radians(rLA2));
  translate(70, 100);

  fill(#F2CD9F);
  rect(-85, -100, 30, 100);


  popMatrix();


  popMatrix();

  pushMatrix();
  //right-arms

  translate(70, -190);
  rotate(radians(rRA));
  translate(-70, 190);

  fill(190);
  rect(55, -190, 30, 100);
  pushMatrix();

  translate(70, -100);
  rotate(radians(rRA2));
  translate(-70, 100);

  fill(#F2CD9F);
  rect(55, -100, 30, 100);

  popMatrix();

  popMatrix();
  popMatrix();

  popMatrix();

  pushMatrix();

  //leg-left
  translate(-56, 0);
  rotate(radians(rLL));
  translate(56, 0);

  fill(185);
  rect(-71, 0, 35, 100);

  pushMatrix();

  translate(-56, 90);
  rotate(radians(rLL2));
  translate(56, -90);


  rect(-71, 90, 35, 80);
  popMatrix();

  popMatrix();

  pushMatrix();

  //leg-right

  translate(56, 0);
  rotate(radians(rRL));
  translate(-56, 0);
  rect(36, 0, 35, 100);

  pushMatrix();

  translate(56, 90);
  rotate(radians(rRL2));
  translate(-56, -90);

  rect(36, 90, 35, 80);

  popMatrix();
  popMatrix();
  popMatrix();
}
// Page 1
void setup1() {
  pv=10;
  golf = loadImage("golf.jpg");
  golf.loadPixels();

  noStroke();
  ty = 580;
  face = loadImage("face.png");
  rC = 40;
  space = false;
  rLA = -12;
  rLA2 = -10;
  rRA = 27;
  rRA2 = 10;
  rLL = 0;
  rLL2 = 0;
  rRL = 0;
  rRL2 = 0;
  bx = 160;
  by = 570;
  rH = 0;
  bx2 = 0;
  by2 = 500;
  twy = 450;
  rT = 0;
  ttx = 202;
  tty = 344;
  tS = 0;
  bx3 = 0;
  by3 = 450;
  bS = 40;
}
void draw1() {
  for (int y=3; y<golf.height-3; y+=6) {
    for (int x=3; x<golf.width-3; x+=6) {
      int loc = x + golf.width*y;
      noStroke();
      fill(golf.pixels[loc]);
      rect(x, y, 6, 6);
    }
  }
  //tear(202, 344, 1);
  powerbar();
  tiger1(150, twy, .64, rLA, rLA2, rRA, rRA2, rLL, rLL2, rRL, rRL2, rH, rT);
  fill(250);
  ellipse(bx, by, 20, 20);
  if (space == true) {


    if (tty < 1000) {
      if (bx < 6000) {
        twy = 450;



        rLA = rLA - AD * .16;
        rLA2 = rLA2 + AD * 4;
        rRA = rRA + AD * .8;
        rC = rC + AD * .8;


        if (rLA2 > 40) {
          delay(200);
          AD = -1;
        } 
        if (rLA2 < -11) {
          //  rRA = rRA + AD;
          // rLA = rLA + AD; 
          //  rRA2 = rRA2  - AD;
          //  rLA2 = -12;
          AD = -.8;
          rC = rC - ADC * 4;
          if ( rC < -10) { 
            AD = 0;
            ADC = 0;
          }
        }

        if ( rLA2 < -13) {
          bx = bx + 15;
          by-= 13;
          if (rH > -32) {
            rH += -.4;
          } else if (rH <= -32) {
            rH = -32;
          }
        }
      }
      if (bx > 1800 && bx < 6000) {
        part2();
      }

      if (bx > 6000) {
        if (rRL > -10) {
          rRL = rRL + -.2;
          rLL = rLL + -.2;
          rRL2 = rRL2 + 2;
          rLL2 = rLL2 + 2;
          twy = twy + 1;
        } /*else if (rRL == -10) {
         rRL = -10;
         rLL = -10;
         rRL2 = 100;
         rLL2 = 100;
         rH = rH + .5;
         } */

        if (rRL < -10 && rRL > -30) {
          rT = rT + .5;
          if (rT >= 10) {
            rT = 10;
            rH = rH + .5;
            if (rH >= 20) {
              rH = 20;

              tear(ttx, tty, tS);
              tS = tS + .02;

              if ( tS >= 1.5) {
                tS = 1.5;
                tty = tty + 5;
              }
            }
          }
        }
      }
    } else {
      background(0);
      moon3(650, 200, 5); 
      bx3 = bx3 + 6;
      by3 = by3 - 3;
      fill(255);
      if (bS > 0) {

        bS = bS - .5;
      } else {
        bS = 0;
      }
      if (bx3 > 1000) {
        anim++;
        setup();
      }
      ellipse(bx3, by3, bS, bS);
    }
  }
}


void powerbar() {
  stroke(50);
  strokeWeight(3);
  fill(255);
  rect(400, 50, 150, 20);
  fill(255, 0, 0);
  rect(400, 50, p, 20);
  if (power) {
    p+=pv;
    if (p >=150 || p<=0) {
      pv = -1*pv;
    }
  }
}
void tiger1(float tx, float ty, float S, float rLA, float rLA2, float rRA, float rRA2, float rLL, float rLL2, float rRL, float rRL2, float rH, float rT) {
  noStroke();
  pushMatrix();

  translate(tx, ty);
  scale(S);

  //hip
  fill(36);
  rect(-71, -14, 142, 28);
  //fill(186);
  //rect(-17, -17, 34, 34);
  pushMatrix();

  //leg-left
  translate(-56, 0);
  rotate(radians(rLL));
  translate(56, 0);

  fill(36);
  rect(-71, 0, 35, 100);

  pushMatrix();

  translate(-56, 90);
  rotate(radians(rLL2));
  translate(56, -90);


  rect(-71, 90, 35, 80);
  popMatrix();

  popMatrix();

  pushMatrix();

  //leg-right

  translate(56, 0);
  rotate(radians(rRL));
  translate(-56, 0);
  rect(36, 0, 35, 100);

  pushMatrix();

  translate(56, 90);
  rotate(radians(rRL2));
  translate(-56, -90);

  rect(36, 90, 35, 80);

  popMatrix();
  popMatrix();
  pushMatrix();

  //rotate(0);
  //torso

  rotate(radians(rT));

  fill(232, 36, 50);
  rect(-40, -200, 80, 186);

  pushMatrix();

  translate(0, -200);
  rotate(0);
  translate(0, 200);
  //shoulder

  rect(-70, -200, 140, 30);

  pushMatrix();

  //neck
  fill(165, 104, 57);
  rect(-20, -250, 40, 60);

  pushMatrix();


  translate(-60, -360);
  translate(60, 140);
  rotate(radians(rH));
  translate(-60, -140);


  image(face, 0, 0);
  popMatrix();
  popMatrix();

  pushMatrix();

  //left-arms
  fill(232, 36, 50);
  translate(-70, -190);
  rotate(radians(rLA));
  translate(70, 190);

  rect(-85, -190, 30, 100);
  pushMatrix();

  translate(-70, -100);
  rotate(radians(rLA2));
  translate(70, 100);

  fill(165, 104, 57);
  rect(-85, -100, 30, 100);

  club();
  popMatrix();


  popMatrix();

  pushMatrix();
  //right-arms

  translate(70, -190);
  rotate(radians(rRA));
  translate(-70, 190);

  fill(232, 36, 50);
  rect(55, -190, 30, 100);
  pushMatrix();

  translate(70, -100);
  rotate(radians(rRA2));
  translate(-70, 100);

  fill(165, 104, 57);
  rect(55, -100, 30, 100);

  popMatrix();

  popMatrix();
  popMatrix();

  popMatrix();


  popMatrix();
}


void club() {

  pushMatrix();

  translate(-80, -20);
  translate(0, -20);
  rotate(radians(rC));
  translate(0, -20);
  fill(0);
  noStroke();
  rect(0, 0, 16, 70);

  fill(150);
  rect(2, 70, 12, 200);

  ellipse(-10, 262, 50, 37);

  stroke(100);
  strokeWeight(3);
  line(-22, 250, -21, 270);

  strokeWeight(2);
  line(-22, 251, 0, 254);
  line(-22, 256, 0, 257);
  line(-22, 260, 0, 260);
  line(-22, 264, 0, 263);
  line(-22, 269, 0, 267);

  noStroke();
  popMatrix();
}

void part2() {

  background(#81E7FF);

  bx2 = bx2 + 2;
  by2 = by2 - 1;

  ellipse(bx2, by2, 30, 30);

  drawCloud(200, 100, 2);
  drawCloud(350, 200, 1);
  drawCloud(500, 170, 1);
  drawCloud(550, 150, 2);
  drawCloud(400, 80, 1);
  drawCloud(100, 120, 3);
}


void tear(float tx, float ty, float S) {

  pushMatrix();

  translate(tx, ty);
  scale(S);
  fill(#0300FF);
  triangle(0, 0, 3, 10, -3, 10);
  ellipse(0, 14, 8, 12);

  popMatrix();
}


void moon3(float cx, float cy, float s) {
  pushMatrix();
  translate(cx, cy);
  scale(s);
  fill(180);
  stroke(100);
  ellipse(0, 0, 100, 100);
  fill(140);
  ellipse(5, 30, 20, 20);
  ellipse(-20, -25, 5, 5);
  ellipse(25, -27, 5, 5);
  ellipse(-20, 10, 30, 30);
  ellipse(20, -5, 25, 25);
  noStroke();
  arc(20, 20, 20, 20, 1.25*PI, 2.25*PI);
  fill(175);
  arc(20, 21, 15, 15, 1.25*PI, 2.25*PI);
  fill(140);
  arc(-5, -20, 20, 20, .8*PI, 2*PI);
  fill(175);
  arc(-6, -19, 15, 15, .8*PI, 2*PI);
  popMatrix();
}

void keyp1() {
  if (keyCode == 32) {
    power=true;
  }
}

void keyr1() {
  if (keyCode == 32) {
    power=false;   
    //p=500;

    if (key == ' ') {
      space = true;
    } else {
      space = false;
    }
  }
}

void drawCloud(float tx, float ty, float scaleF) {
  pushMatrix();

  noStroke();

  translate(tx, ty);
  scale(scaleF);

  fill(255);

  ellipse(0, 0, 100, 65);
  ellipse(-20, -13, 40, 55);
  ellipse(20, -13, 40, 55);
  ellipse(-20, 13, 40, 55);
  ellipse(20, 13, 40, 55);
  ellipse(30, 0, 60, 40);
  ellipse(-30, 0, 60, 40);

  popMatrix();
}
// Page 2
// Page 3

void setup3() {
  rx=300;
  ry=450;
  rvx=rvy=0;
  counter3 = 0;
}

void draw3() {
  background(150);
  fill(#0DB4FF);
  rect(0, 0, 600, 360);
  fill(#40FF03);
  rect(0, 360, 600, 240);
  spaceship(rx, ry);
  rx+=rvx;
  ry+=rvy;
  counter3++;
  if (counter3 > 240) {
    anim++;
    setup();
  }
}
void spaceship(float x, float y) {
  pushMatrix();
  translate(x, y);
  if (counter3 > 100 && counter3 < 160) {
    translate(random(-10, 10), random(-10, 10));
  }
  if (counter3 > 160) {
    rvy -= counter3/3;
  }
  //fire
  if (counter3 > 100) {
    float firex[] = new float[7];
    float firey[] = new float[7];
    float fire2[] = new float[7];
    for (int i=0; i<7; i++) {
      firex[i] = random(-35+10*i, -25+10*i);
      if (i%2 == 0) {
        firey[i] = random(30, 50);
        fire2[i] = random(20, firey[i]-10);
      } else {
        firey[i] = random(10, 20);
        fire2[i] = random(0, firey[i]-10);
      }
    }
    noStroke();
    beginShape();
    vertex(-35, 0);
    for (int i=0; i<7; i++) {
      fill(200, 50, 0);
      vertex(firex[i], firey[i]);
    }
    vertex(35, 0);
    endShape();
    beginShape();
    vertex(-30, 0);
    for (int i=0; i<7; i++) {
      fill(200, 150, 0);
      vertex(firex[i], fire2[i]);
    }
    vertex(30, 0);
    endShape();
  }
  stroke(0);
  //wings
  fill(250, 100, 0);
  arc(-35, 0, 80, 120, 3*PI/4, TWO_PI);
  line(-35, 0, -35-40*sqrt(2)/2, 60*sqrt(2)/2);
  arc(35, 0, 80, 120, PI, 9*PI/4);
  line(35, 0, 35+40*sqrt(2)/2, 60*sqrt(2)/2);
  //body
  fill(250, 250, 200);
  rect(-70, -90, 140, 40); //part of blasters
  arc(0, 0, 110, 280, PI, TWO_PI);
  line(-55, 0, 55, 0);
  //window
  pushMatrix();
  translate(0, -62);
  scale(.25);
  translate(-60, -70);
  image(face, 0, 0);
  popMatrix();
  fill(220, 210, 220, 100);
  ellipse(0, -60, 50, 50);
  //blasters 
  noFill();
  stroke(0, 50, 0);
  strokeWeight(4);
  ellipse(-85, -75, 15, 50);
  ellipse(85, -75, 15, 50);
  //clubs 
  stroke(100);
  fill(120);
  line(-55, -30, -75, -120);
  line(-55, -30, -55, -120);
  line(55, -30, 80, -120);
  line(70, -30, 55, -120);
  line(65, -30, 70, -120);
  stroke(0);
  strokeWeight(1);

  pushMatrix();
  translate(-83, -120);
  rotate(-PI/8);
  ellipse(0, 0, 20, 10);
  popMatrix();

  ellipse(-48, -122, 16, 11);

  pushMatrix();
  translate(51, -120);
  rotate(-PI/8.5);
  ellipse(0, 0, 17, 6);
  popMatrix();

  pushMatrix();
  translate(85, -120);
  rotate(PI/8);
  ellipse(0, 0, 15, 10);
  popMatrix();

  pushMatrix();
  translate(70, -120);
  rotate(-PI/8);
  ellipse(0, 0, 10, 10);
  popMatrix();

  stroke(0);
  strokeWeight(1);
  fill(100, 150, 100);
  rect(-80, -110, 30, 90);
  rect(50, -110, 30, 90);
  popMatrix();
}

// Page 4
void setup4() {
  rx = 300;
  ry = 500;
  rvx = rvy = 0;
  isGameOver = false;
  shield = 100;
  asteroids.clear();
  pickups.clear();
  bullets.clear();

  for (int i = 0; i < 120; i++) {
    stars.add(new Star((int)random(0, width), (int)random(0, height)));
  }
}

void draw4() {
  tAlive++;
  Rocket roc = new Rocket((int)rx, (int)ry, 0.6);

  if (!isGameOver) {
    if (tAlive < 5000) { // ~~~~~~~~~~~~~~~~~~PLACEHOLDER
      tDead = 0;
      background(12, 34, 56);

      for (Star s : stars) {
        s.drawStar();
        s.y = s.y + rate;
      }

      //health bar
      fill(0);
      textSize(14);
      rect(13, 278, 13, 304);
      fill(100, 255, 0);
      text("Shield Strength: " + shield, 5, height - 5);
      noStroke();

      if (shield <= 20) {
        fill(255, 100, 0);
      } else if (shield < 50 && shield > 20) {
        fill(240, 240, 0);
      } else {
        fill(100, 255, 0);
      }
      rect(15, 280 - (shield - 100) * 3, 10, shield * 3);
      if (shield > 100) {
        int sh = shield - 100;
        fill(160);
        rect(15, 280 - sh * 3, 10, sh * 3);
      }
      stroke(1);
      fill(255);

      for (int q = 0; q < bullets.size(); q++) {
        Bullet b = bullets.get(q);

        b.drawBullet();
        b.y = b.y - 10;
        if (b.y < 0) {
          bullets.remove(b);
        }
      }

      for (int q = 0; q < pickups.size(); q++) {
        Pickup p = pickups.get(q);

        p.drawPickup();
        p.y = p.y + rate;
        if (p.y < 0) {
          pickups.remove(p);
        }
      }

      roc.drawRocket();
      rx += rvx;
      ry += rvy;

      if (random(0, 100) < 40) {
        stars.add(new Star((int)random(0, width), 0));
      }
      if (random(0, 100) < 10 + tAlive / 1000) {
        asteroids.add(new Asteroid((int)random(60, width - 60), 0, random(1, 3), random(0, 2 * PI), (int)random(3)));
      }
      if (asteroids != null) {
        for (int i = 0; i < asteroids.size(); i++) {
          Asteroid a = asteroids.get(i);

          a.drawAst();

          if (a.y < height + 25) {
            a.y += 5 / a.size;
          } else {
            asteroids.remove(a);
          }

          if (a.doesCollide(roc)) {
            if (shield > 0) {
              shield -= a.size;
              roc.shieldOp = 80;
              asteroids.remove(a);
            } else {
              isGameOver = true;
            }
          }

          for (Bullet b : bullets) {
            if (abs(b.x - a.x) < b.rad + 5 && abs(b.y - a.y) < b.rad + 5) {
              asteroids.remove(a);
              if (b.id == 0) {
                bullets.remove(b);
              }

              //drop pickup health or antihealth
              if (random(100) <= 10) {
                pickups.add(new Pickup(a.x, a.y, (int)random(1, 3)));
              }
              break;
            }
          }
        }
        for (int w = 0; w < pickups.size(); w++) {
          Pickup p = pickups.get(w);

          if (p.doesCollide(roc)) {
            if (p.id == 1) {
              if (shield < 100) {
                shield += 30;
              }

              pickups.remove(p);
            } 

            if (p.id == 2) {
              if (shield > 30) {
                shield -= 30;
              } else {
                isGameOver = true;
              }

              pickups.remove(p);
            }
          }
        }
      }
    } else {
      isGameComplete = true;
    }
  } else { //IF YOU LOSE THE GAME
    if (tDead < 20) {
      staticScreen();
    }
    if (tDead < 30 && tDead > 20) {
      background(255);
    }
    if (tDead < 40 && tDead > 30) {
      staticScreen();
    }
    if (tDead > 40) {
      fill(255);
      background(255);
      
    }

    fill(0);
    textSize(18);
    for (int i = 0; i < 20; i++) {
      if (tDead - i > 0) {
        text("Error.", 10, 18 * i);
        if (tDead > 20) {
          text("GAME OVER.", 10, 18 * (21));
        }
      }
    }
    tDead++;
    if (tDead > 60) {
      anim--;
      setup();
    }
  }

  //IF YOU WIN THE GAME
  if (isGameComplete) {
    asteroids.clear();
    background(random(255), random(255), random(255));
    roc.drawRocket();
    fill(0);
    textSize(20);
    text("YOU WIN", random(100, 300), random(100, 300));
    count4++;
    if (count4 > 20) {
      anim++;
      setup();
    }
  }
}

void keyp4() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      rvx=-5;
    }
    if (keyCode == RIGHT) {
      rvx=5;
    }
    if (keyCode == UP) {
      rvy=-2;
    }
    if (keyCode == DOWN) {
      rvy=5;
    }
  }
  if (keyCode == 32) {
    if (shield <= 100) {
      bullets.add(new Bullet((int)rx + 45, 10, 0));
      bullets.add(new Bullet((int)rx - 45, 10, 0));
    } else {
      bullets.add(new Bullet((int)rx + 45, 10, 1));
      bullets.add(new Bullet((int)rx - 45, 10, 1));
    }
  }
}
void keyr4() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      if (rvx==-5) {
        rvx=0;
      }
    }
    if (keyCode == RIGHT) {
      if (rvx==5) {
        rvx=0;
      }
    }
    if (keyCode == UP) {
      if (rvy==-2) {
        rvy=2;
      }
    }
    if (keyCode == DOWN) {
      if (rvy==5) {
        rvy=2;
      }
    }
  }
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~STATIC~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
void staticScreen() {
  imgStatic = createImage(width, height, RGB);
  for (int y = 0; y < imgStatic.height; y++) {
    for (int x = 0; x < imgStatic.width; x++) {
      int loc = x + imgStatic.width * y;

      imgStatic.pixels[loc] = color(random(0, 255));
    }
  }
  image(imgStatic, 0, 0);
}

// Page 5
void setup5() {
  background(12, 34, 56);
  explosionColor = color(210, 0, 0);
  explosionColor2 = color(240, 125, 0);
  explosionColor3 = color(240, 240, 35);
  explosionColor4 = color(230, 70, 5);
  t=0;
  t2=0;
  tx5=0;
  ty5=0;
  exUp=0;
}
void draw5() {
  background(12, 34, 56);
  moon(450, 150, 1+(tx5*tx5/50000));
  if (t2 <= 1250) {
    spaceship5(150+5*sin(tx5), 450+5*sin(ty5));
  } else if (t2 >= 1275 && t2 <= 1300) {
    spaceship5(150, 450);
  } else if (t2 >= 1325 && t2 <= 1350) {
    spaceship5(150, 450);
  } else if (t2 >= 1375 && t2 <= 1400) {
    spaceship5(150, 450);
  }
  if (t <= 950) {
    t+=2;
  }
  if (tx5 <= t && ty5 <= t) {
    tx5+=2;
    ty5+=2;
  }
  if (t == 950) {
    t2 = 951;
  }
  if (t2 > 950 && t2 <= 1250) {
    t2+=2;
    explosion(150, 450);
    explosion(150, 450);
  } else if (t2 > 1250) {
    t2+=2;
  }
  if (t2 > 1400) {
    anim++;
    setup();
  }
}

void moon(float cx, float cy, float s) {
  pushMatrix();
  translate(cx, cy);
  scale(s);
  fill(180);
  stroke(100);
  ellipse(0, 0, 100, 100);
  fill(140);
  ellipse(5, 30, 20, 20);
  ellipse(-20, -25, 5, 5);
  ellipse(25, -27, 5, 5);
  ellipse(-20, 10, 30, 30);
  ellipse(20, -5, 25, 25);
  noStroke();
  arc(20, 20, 20, 20, 1.25*PI, 2.25*PI);
  fill(175);
  arc(20, 21, 15, 15, 1.25*PI, 2.25*PI);
  fill(140);
  arc(-5, -20, 20, 20, .8*PI, 2*PI);
  fill(175);
  arc(-6, -19, 15, 15, .8*PI, 2*PI);
  popMatrix();
}

void drawExplosion(float x, float y, float xMin, float xMax, float yMin, float yMax) {
  fill(210, 0, 0);
  ellipse(x+random(xMin, xMax), y+random(yMin, yMax), random(0, 100), random(0, 50));
  fill(240, 125, 0);
  ellipse(x+random(xMin, xMax), y+random(yMin, yMax), random(0, 50), random(0, 100));
  fill(240, 240, 35);
  ellipse(x+random(xMin, xMax), y+random(yMin, yMax), random(0, 100), random(0, 50));
  fill(230, 70, 5);
  ellipse(x+random(xMin, xMax), y+random(yMin, yMax), random(0, 50), random(0, 100));
}

void explosion(float x, float y) {
  pushMatrix();
  noStroke();
  translate(x, y);
  scale(exUp);
  translate(-x, -y);
  drawExplosion(150, 450, -50, 50, -50, 50);
  drawExplosion(150, 450, -100, 100, -100, 100);
  drawExplosion(150, 450, -50, 50, -100, 100);
  drawExplosion(150, 450, -100, 100, -50, 50);
  drawExplosion(150, 450, -50, 100, -50, 100);
  drawExplosion(150, 450, -100, 50, -100, 50);
  popMatrix();
  if (exUp <= 2) {
    exUp += 0.1;
  }
}
void spaceship5(float x, float y) {
  pushMatrix();
  translate(x, y);
  rotate(PI/4.0);
  //fire
  float firex[] = new float[7];
  float firey[] = new float[7];
  float fire2[] = new float[7];
  for (int i=0; i<7; i++) {
    firex[i] = random(-35+10*i, -25+10*i);
    if (i%2 == 0) {
      firey[i] = random(30, 50);
      fire2[i] = random(20, firey[i]-10);
    } else {
      firey[i] = random(10, 20);
      fire2[i] = random(0, firey[i]-10);
    }
  }
  noStroke();
  beginShape();
  vertex(-35, 0);
  for (int i=0; i<7; i++) {
    fill(200, 50, 0);
    vertex(firex[i], firey[i]);
  }
  vertex(35, 0);
  endShape();
  beginShape();
  vertex(-30, 0);
  for (int i=0; i<7; i++) {
    fill(200, 150, 0);
    vertex(firex[i], fire2[i]);
  }
  vertex(30, 0);
  endShape();
  stroke(0);
  //wings
  fill(250, 100, 0);
  arc(-35, 0, 80, 120, 3*PI/4, TWO_PI);
  line(-35, 0, -35-40*sqrt(2)/2, 60*sqrt(2)/2);
  arc(35, 0, 80, 120, PI, 9*PI/4);
  line(35, 0, 35+40*sqrt(2)/2, 60*sqrt(2)/2);
  //body
  fill(250, 250, 200);
  rect(-70, -90, 140, 40); //part of blasters
  arc(0, 0, 110, 280, PI, TWO_PI);
  line(-55, 0, 55, 0);
  //window
  pushMatrix();
  translate(0, -62);
  scale(.25);
  translate(-60, -70);
  image(face, 0, 0);
  popMatrix();
  fill(220, 210, 220, 100);
  ellipse(0, -60, 50, 50);
  //blasters 
  noFill();
  stroke(0, 50, 0);
  strokeWeight(4);
  ellipse(-85, -75, 15, 50);
  ellipse(85, -75, 15, 50);
  //clubs 
  stroke(100);
  fill(120);
  line(-55, -30, -75, -120);
  line(-55, -30, -55, -120);
  line(55, -30, 80, -120);
  line(70, -30, 55, -120);
  line(65, -30, 70, -120);
  stroke(0);
  strokeWeight(1);

  pushMatrix();
  translate(-83, -120);
  rotate(-PI/8);
  ellipse(0, 0, 20, 10);
  popMatrix();

  ellipse(-48, -122, 16, 11);

  pushMatrix();
  translate(51, -120);
  rotate(-PI/8.5);
  ellipse(0, 0, 17, 6);
  popMatrix();

  pushMatrix();
  translate(85, -120);
  rotate(PI/8);
  ellipse(0, 0, 15, 10);
  popMatrix();

  pushMatrix();
  translate(70, -120);
  rotate(-PI/8);
  ellipse(0, 0, 10, 10);
  popMatrix();

  stroke(0);
  strokeWeight(1);
  fill(100, 150, 100);
  rect(-80, -110, 30, 90);
  rect(50, -110, 30, 90);
  popMatrix();
}

// Page 6
void setup6() {
  buzz = loadImage("buzz.png");
  back = loadImage("back.png");
}
void draw6() {
  battle();
}
void mouse6() {
  if (anim == 6) {
    if (bCounter>= 60 || bCounter==0 ) {
      if (310< mouseX && 440>mouseX && 480<mouseY && 535> mouseY) {
        fstage=1;
        bCounter = 0;
      }
      if (310< mouseX && 440>mouseX && 540<mouseY && 595> mouseY) {
        fstage=2;
        bCounter = 0;
      }
      if ( 445 < mouseX && 575>mouseX && 480<mouseY &&535 >mouseY) {
        fstage=3;
        bCounter = 0;
      }
      if (  445 < mouseX && 575>mouseX && 540<mouseY &&595 >mouseY) {
        fstage=4;
        bCounter = 0;
      }
    }
    if (healthT<=0) {
      healthT=120;
      healthB=120;
      fstage=0;
      bCounter=0;
    }
    if (healthB<=0) {
      anim=7;
    }
  }
}
void battle() {
  if (healthB<=0) {
    fill(255);
    rect(0, 0, width, height);
    textSize(70);
    fill(0);
    text("YOU WIN", width/4, height/2);
    textSize(30);
    text("click to continue", width/4+30, height/2+100);
  } else {
    if (healthT <= 0) {
      fill(255);
      rect(0, 0, width, height);
      textSize(50);
      fill(0);
      text("GAME OVER", width/4, height/2);
      textSize(30);
      text("click to retry", width/4+50, height/2+100);
    } else {
      stroke(0);
      strokeWeight(1);
      background(12, 34, 56);

      //Moon ground
      fill(128);
      ellipse(300, 520, 1200, 750);

      //Tiger Worlds circle
      fill(170);
      ellipse(150, 420, 300, 100);

      //Buzz circle
      fill(170);
      ellipse(450, 270, 200, 70);

      //buzzstatus
      fill(255);
      rect(0, 50, 300, 80);
      fill(0);
      textSize(30);
      text("Buzz Aldrin", 10, 85);
      textSize(20);
      text("Lv 85", 200, 85);
      noStroke();
      fill(100);
      rect(100, 95, 150, 20);
      fill(0, 255, 0);
      rect(128, 97, healthB, 16);
      fill(#F7D62D);
      textSize(20);
      text("HP", 100, 115);

      //tigerstatus
      fill(255);
      rect(300, 350, 300, 80);
      fill(0);
      textSize(30);
      text("Tiger Woods", 310, 385);
      textSize(20);
      text("Lv 39", 500, 385);
      noStroke();
      fill(100);
      rect(400, 395, 150, 20);
      fill(0, 255, 0);
      rect(428, 397, healthT, 16);
      fill(#F7D62D);
      textSize(20);
      text("HP", 400, 415);
      fill(0);
      textSize(10);
      text(healthT +"/ 120", 500, 425);
      fill(232, 227, 227);
      rect(0, 470, width, 130);
      //Interaction Bar
      if (fstage == 0) {
        //Left text box
        fill(255, 221, 23);
        rect(10, 480, 280, 110, PI);
        fill(95, 93, 80);
        rect(15, 485, 270, 100, PI);
        fill(255);
        rect(20, 490, 260, 90, PI);
        fill(0);
        textSize(30);
        text("What will", 25, 530);
        text("Mr.Woods do?", 25, 560);
        //Right buttons
        //caddysmack
        if (310< mouseX && 440>mouseX && 480<mouseY && 535> mouseY) {
          fill(255, 0, 0);
        } else {
          fill(150, 60, 26);
        }
        rect(310, 480, 130, 55, PI);
        fill(0);
        textSize(18);
        text("Caddy-Smack", 315, 510);

        //mulligan
        if ( 310< mouseX && 440>mouseX && 540<mouseY && 595> mouseY) {
          fill(0, 255, 0);
        } else {
          fill(63, 142, 56);
        }
        rect(310, 540, 130, 55, PI);
        fill(0);
        textSize(18);
        text("Mulligan", 335, 570);

        //wedge
        if ( 445 < mouseX && 575>mouseX && 480<mouseY &&535 >mouseY) {
          fill(243, 243, 32);
        } else {
          fill(232, 164, 26);
        }
        rect(445, 480, 130, 55, PI);
        fill(0);
        textSize(18);
        text("GIVE UP", 475, 510);

        //chop
        if ( 445 < mouseX && 575>mouseX && 540<mouseY &&595 >mouseY) {
          fill(0, 0, 255);
        } else {
          fill(62, 100, 193);
        }
        rect(445, 540, 130, 55, PI);
        fill(0);
        textSize(18);
        text("chop", 475, 570);
      }
      if (fstage == 1) {
        bCounter++;
        if (bCounter <120) {
          fill(255, 221, 23);
          rect(10, 480, 550, 110, PI);
          fill(95, 93, 80);
          rect(15, 485, 540, 100, PI);
          fill(255);
          rect(20, 490, 530, 90, PI);
          fill(0);
          textSize(40);
          text("Tiger used Caddy-Smack!", 30, 550);
          healthB-=.25;
        } else {
          fstage = 0;
        }
      }
      if (fstage == 2) {
        bCounter++;
        if (bCounter <120) {
          fill(255, 221, 23);
          rect(10, 480, 550, 110, PI);
          fill(95, 93, 80);
          rect(15, 485, 540, 100, PI);
          fill(255);
          rect(20, 490, 530, 90, PI);
          fill(0);
          textSize(40);
          text("Tiger used Mulligan!", 30, 550);
          if (healthT<120) {
            healthT+=.25;
          }
        } else {
          fstage = 0;
        }
      }
      if (fstage == 3) {
        bCounter++;
        if (bCounter <120) {
          fill(255, 221, 23);
          rect(10, 480, 550, 110, PI);
          fill(95, 93, 80);
          rect(15, 485, 540, 100, PI);
          fill(255);
          rect(20, 490, 530, 90, PI);
          fill(0);
          textSize(40);
          text("Tiger used GIVE UP!", 30, 550);
          healthT-=1;
        } else {
          fstage = 0;
        }
      }
      if (fstage == 4) {
        bCounter++;
        if (bCounter <120) {
          fill(255, 221, 23);
          rect(10, 480, 550, 110, PI);
          fill(95, 93, 80);
          rect(15, 485, 540, 100, PI);
          fill(255);
          rect(20, 490, 530, 90, PI);
          fill(0);
          textSize(40);
          text("Tiger used chop!", 30, 550);
          healthB-=1;
        } else {
          fstage = 0;
        }
      }
      //buzz
      buzz6(450, 200, .5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

      //tiger
      tiger6(137, 373, .5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
    }
  }
}

void buzz6(float tx, float ty, float S, float rLA, float rLA2, float rRA, float rRA2, float rLL, float rLL2, float rRL, float rRL2, float rH, float rT) {

  pushMatrix();

  translate(tx, ty);
  scale(S);

  //hip
  fill(185);
  rect(-71, -14, 142, 28);
  //fill(186);
  //rect(-17, -17, 34, 34);

  pushMatrix();

  rotate(0);
  //torso

  rotate(radians(rT));

  fill(195);
  rect(-40, -200, 80, 186);

  pushMatrix();

  translate(0, -200);
  rotate(0);
  translate(0, 200);
  //shoulder

  rect(-70, -200, 140, 30);

  pushMatrix();

  //neck
  fill(180);
  rect(-20, -250, 40, 60);

  pushMatrix();


  translate(-205, -715);
  translate(200, 500);
  rotate(radians(rH));
  scale(.35);
  translate(-200, -500);
  fill(100);
  stroke(180);
  strokeWeight(20);
  ellipse(200, 250, 600, 600);
  image(buzz, 0, 0);
  noStroke();
  popMatrix();
  popMatrix();

  pushMatrix();

  //left-arms
  fill(190);
  translate(-70, -190);
  rotate(radians(rLA));
  translate(70, 190);

  rect(-85, -190, 30, 100);
  pushMatrix();

  translate(-70, -100);
  rotate(radians(rLA2));
  translate(70, 100);

  fill(#F2CD9F);
  rect(-85, -100, 30, 100);


  popMatrix();


  popMatrix();

  pushMatrix();
  //right-arms

  translate(70, -190);
  rotate(radians(rRA));
  translate(-70, 190);

  fill(190);
  rect(55, -190, 30, 100);
  pushMatrix();

  translate(70, -100);
  rotate(radians(rRA2));
  translate(-70, 100);

  fill(#F2CD9F);
  rect(55, -100, 30, 100);

  popMatrix();

  popMatrix();
  popMatrix();

  popMatrix();

  pushMatrix();

  //leg-left
  translate(-56, 0);
  rotate(radians(rLL));
  translate(56, 0);

  fill(185);
  rect(-71, 0, 35, 100);

  pushMatrix();

  translate(-56, 90);
  rotate(radians(rLL2));
  translate(56, -90);


  rect(-71, 90, 35, 80);
  popMatrix();

  popMatrix();

  pushMatrix();

  //leg-right

  translate(56, 0);
  rotate(radians(rRL));
  translate(-56, 0);
  rect(36, 0, 35, 100);

  pushMatrix();

  translate(56, 90);
  rotate(radians(rRL2));
  translate(-56, -90);

  rect(36, 90, 35, 80);

  popMatrix();
  popMatrix();
  popMatrix();
}


void tiger6(float tx, float ty, float S, float rLA, float rLA2, float rRA, float rRA2, float rLL, float rLL2, float rRL, float rRL2, float rH, float rT) {

  pushMatrix();

  translate(tx, ty);
  scale(S);

  //hip
  fill(36);
  rect(-71, -14, 142, 28);
  //fill(186);
  //rect(-17, -17, 34, 34);

  pushMatrix();

  rotate(0);
  //torso

  rotate(radians(rT));

  fill(232, 36, 50);
  rect(-40, -200, 80, 186);

  pushMatrix();

  translate(0, -200);
  rotate(0);
  translate(0, 200);
  //shoulder

  rect(-70, -200, 140, 30);

  pushMatrix();

  //neck
  fill(165, 104, 57);
  rect(-20, -250, 40, 60);

  pushMatrix();


  translate(-110, -433);
  translate(60, 140);
  rotate(radians(rH));
  scale(.65);
  translate(-60, -140);


  image(back, 0, 0);
  popMatrix();
  popMatrix();

  pushMatrix();

  //left-arms
  fill(232, 36, 50);
  translate(-70, -190);
  rotate(radians(rLA));
  translate(70, 190);

  rect(-85, -190, 30, 100);
  pushMatrix();

  translate(-70, -100);
  rotate(radians(rLA2));
  translate(70, 100);

  fill(165, 104, 57);
  rect(-85, -100, 30, 100);


  popMatrix();


  popMatrix();

  pushMatrix();
  //right-arms

  translate(70, -190);
  rotate(radians(rRA));
  translate(-70, 190);

  fill(232, 36, 50);
  rect(55, -190, 30, 100);
  pushMatrix();

  translate(70, -100);
  rotate(radians(rRA2));
  translate(-70, 100);

  fill(165, 104, 57);
  rect(55, -100, 30, 100);

  popMatrix();

  popMatrix();
  popMatrix();
  popMatrix();
  pushMatrix();

  //leg-left
  translate(-56, 0);
  rotate(radians(rLL));
  translate(56, 0);

  fill(36);
  rect(-71, 0, 35, 100);

  pushMatrix();

  translate(-56, 90);
  rotate(radians(rLL2));
  translate(56, -90);


  rect(-71, 90, 35, 80);
  popMatrix();

  popMatrix();

  pushMatrix();

  //leg-right

  translate(56, 0);
  rotate(radians(rRL));
  translate(-56, 0);
  rect(36, 0, 35, 100);

  pushMatrix();

  translate(56, 90);
  rotate(radians(rRL2));
  translate(-56, -90);

  rect(36, 90, 35, 80);

  popMatrix();
  popMatrix();
  popMatrix();
}
// Page 7
// Page 8