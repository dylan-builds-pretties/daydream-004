import processing.sound.*;

SoundFile[] file;
Amplitude[] amp;
Waveform waveform;
Waveform waveform2;
int samples = 200;
int numsounds = 30;
float songtime = 99.801994;
float mouseClick;

float bassSmoothed;
float drumsTotal;

int centerX = 0;
int centerY = 0;

float keySmoothed1;
float keySmoothed2;
float keySmoothed3;
float keySmoothed4;
float keySmoothed5;
float chantSmoothed;
float uhSmoothed;

Keys k = new Keys();


void setup(){
  size(1600,1000,FX2D);
  
  file = new SoundFile[numsounds];
  amp = new Amplitude[numsounds];
  waveform = new Waveform(this, samples);
  waveform2 = new Waveform(this, samples);
  
  
  for (int i = 0; i < numsounds; i++){
    file[i] = new SoundFile(this, (i) + ".wav");
    amp[i] = new Amplitude(this);
    amp[i].input(file[i]);
  }
  
  for (int i = 0; i < numsounds; i++) {
    file[i].play();
  }
  
  waveform.input(file[15]);
  waveform2.input(file[14]);
  
}


void draw(){
  background(0+amp[0].analyze()*450);
  k.display();
  
  if(amp[8].analyze() > 0.02){
   for(int i = 1; i < 10; i++){
    noFill();
    stroke(255-amp[0].analyze()*450,amp[8].analyze()*5000);
    circle(width/2,height/2, (800 +cos(radians(frameCount))+ i*20) -  amp[8].analyze()*1000);
   }
  }
  
  noFill();
  stroke(255-amp[0].analyze()*450);
  fill(0);
  //circle(width/2,height/2,200);
  
  if(amp[5].analyze() > 0.001){
    noFill();
    strokeWeight(1+uhSmoothed*150);
    stroke(255-amp[0].analyze()*450,uhSmoothed*5000);
    circle(width/2,height/2, 1000-(uhSmoothed*100));
    strokeWeight(1+uhSmoothed*100);
    circle(width/2,height/2, 800+(uhSmoothed*100));
  }
  
  //GuitarRight waveform shape
  waveform.analyze();
  waveform2.analyze();
  
  strokeWeight(2);
  
  push();
  translate(width/2,height/2);
  rotate(PI/2);
  if(amp[15].analyze() > 0.01){
  beginShape();
  noFill();
  for(int i = 0; i < samples; i++){
    // Draw current data of the waveform
    // Each sample in the data array is between -1 and +1 
    vertex(
      map(i, 0, samples, -500, width),
      map(waveform.data[i], -1, 1, -1000, height)
    );
  }
  endShape();
  }

  
  if(amp[14].analyze() > 0.1){
  strokeWeight(4+amp[14].analyze()*20);
  stroke(250,216,92,amp[14].analyze()*500);
  noFill();
  beginShape();
  for(int i = 0; i < samples; i++){
    // Draw current data of the waveform
    // Each sample in the data array is between -1 and +1 
    vertex(
      map(i, 0, samples, -500, width),
      map(waveform2.data[i]/1.5, -1, 1, 0, height)
    );
  }
  endShape();
  
  beginShape();
  noFill();
  for(int i = 0; i < samples; i++){
    // Draw current data of the waveform
    // Each sample in the data array is between -1 and +1 
    vertex(
      map(i, 0, samples, -500, width),
      map(waveform2.data[i]/5, -1, 1, -2000, height)
    );
  }
  endShape();
    
  }
  pop();
  
  
  stroke(255);
  fill(0);
  strokeWeight(1);
  for(int i = 150; i < 450; i = i+100){
    push();
    float pianoMPush  = amp[7].analyze() * 400;
    float pianoBPush  = amp[6].analyze() * 400;
  translate(width/2,height/2);
  rotate(radians(frameCount*0.3));
  circle(centerX-i-amp[11].analyze()*100,centerY,25);
  circle(centerX+i+amp[11].analyze()*100,centerY,25);
  circle(centerX,centerY-i-amp[11].analyze()*100,25);
  circle(centerX,centerY+i+amp[11].analyze()*100,25);
  pop();
  }
  
  for(int i = 100; i < 500; i = i+100){
    push();
  if(i == 100){
    fill(255);
    stroke(0);
  }
  else{
  fill(0);
  stroke(255);
  }
  translate(width/2,height/2);
  rotate(radians(-frameCount*0.3));
  //HH
  circle(centerX-i-amp[11].analyze()*150,centerY,50+amp[1].analyze()*(500));
  circle(centerX+i+amp[11].analyze()*150,centerY,50+amp[1].analyze()*(500));
  //Kick
  circle(centerX-i-amp[11].analyze()*150,centerY-i-amp[11].analyze()*150,50+amp[2].analyze()*(150));
  circle(centerX+i+amp[11].analyze()*150,centerY+i+amp[11].analyze()*150,50+amp[2].analyze()*(150));
  //Clap
  circle(centerX,centerY-i-amp[11].analyze()*150,50+amp[3].analyze()*(100));
  circle(centerX,centerY+i+amp[11].analyze()*150,50+amp[3].analyze()*(100));
  //Snare
  circle(centerX+i+amp[11].analyze()*150,centerY-i-amp[11].analyze()*150,50+amp[4].analyze()*(130));
  circle(centerX-i-amp[11].analyze()*150,centerY+i+amp[11].analyze()*150,50+amp[4].analyze()*(130));
  
  pop();
  }
  
  
  
  
  
  
  //Violin differential shape
  if(amp[10].analyze() > 0.01){
  for(int i = 0; i <  1; i++){
    float xorig = width/2;
    float yorig = height/2;
    float radius = 400; //+ i * 10;
    float angle = millis()/60 * map(i, 0 , 20, 0.05, 0.1);
    float a = xorig + radius * cos(angle*1.6);
    float b = yorig + radius  * sin(angle*2.0);
    noFill();
    strokeWeight(2);
    stroke(255-amp[0].analyze()*450);
    ellipse(a,b, random(20,50), random(150,200));
    ellipse(a,b, random(150,200), random(20,50));
    circle(a,b,random(25,100));
   }
  }
  
  strokeWeight(1);
  bassSmoothed = bassSmoothed * 0.1 + amp[0].analyze() * 0.9;
  chantSmoothed = chantSmoothed * 0.1 + amp[12].analyze() * 0.9;
  uhSmoothed = uhSmoothed * 0.1 + amp[5].analyze() * 0.9;
  
  drumsTotal = amp[1].analyze() + amp[2].analyze() + amp[3].analyze() + amp[4].analyze();
  
  /*if(amp[12].analyze() > 0.1){
    for(int i = 0; i < 10; i++){
      strokeWeight(i);
      stroke(255);
      circle(width/2,height/2, 100+(i*10)*(amp[12].analyze()*50));
    }
  }*/
  
  if(amp[12].analyze() > 0.09){
      stroke(255);
      strokeWeight(8);
      fill(0,chantSmoothed*1000);
      //left
     // triangle(0,0,(width/2),height/2,0,height);
      //right
     // triangle(width,0,(width/2),height/2,width,height);
      //top
      triangle(0,0,width/2,((height/2)-200)+uhSmoothed*11000,width,0);
      //bottom
      triangle(0,height,width/2,((height/2)+200)-uhSmoothed*11000,width,height);
      
    }
  
  
  if(amp[13].analyze() > 0.01){
    for(int i = 0; i < 10; i++){
      fill(240,70);
      strokeWeight(i);
      stroke(255-amp[0].analyze()*450);
      circle(width/2,height/2, 50+(i*10)*(amp[13].analyze()*200));
    }
  }
  
  
  
}

void mousePressed(){
  mouseClick = map(mouseX,0,width,0,songtime); 
  for (int i = 0; i < numsounds; i++){
    file[i].jump(mouseClick);
  }
}
