
class Keys {
  float stroke = 255;
  
  Keys(){
   //constructor - define Keys variables/data here 
  }
  
  
  void display(){
   keySmoothed1 = keySmoothed1 * 0.8 + amp[17].analyze() * 0.2;
   keySmoothed2 = keySmoothed2 * 0.8 + amp[18].analyze() * 0.2;
   keySmoothed3 = keySmoothed3 * 0.8 + amp[21].analyze() * 0.2;
   keySmoothed4 = keySmoothed4 * 0.8 + amp[20].analyze() * 0.2;
   keySmoothed5 = keySmoothed5 * 0.8 + amp[19].analyze() * 0.2;
   
   stroke = 255 - amp[0].analyze()*450;
   noFill();
   stroke(255);
   
   if(amp[17].analyze() > 0.01 || amp[18].analyze() > 0.01){
     noFill();
     stroke(stroke,keySmoothed1*5000+keySmoothed2*5000);
     circle((width/2)+200,(height/2)-200,200-(keySmoothed2*500+keySmoothed1*500));
     stroke(255,215,0,keySmoothed1*5000+keySmoothed2*5000);
     circle((width/2)+200,(height/2)-200,180-(keySmoothed2*1000+keySmoothed1*1000));
   }
   
   if(amp[21].analyze() > 0.01){
     noFill();
     stroke(stroke,keySmoothed3*5000);
     circle((width/2)-200,(height/2)-200,200-keySmoothed3*500);
     stroke(255,215,0,keySmoothed3*5000);
     circle((width/2)-200,(height/2)-200,180-keySmoothed3*1000); 
   }
   
   if(amp[20].analyze() > 0.01){
     noFill();
     stroke(stroke,keySmoothed4*5000);
     circle((width/2)-200,(height/2)+200,200-keySmoothed4*500);
     stroke(255,215,0,keySmoothed4*5000);
     circle((width/2)-200,(height/2)+200,180-keySmoothed4*1000); 
   }
   
   if(amp[19].analyze() > 0.01){
     noFill();
     stroke(stroke,keySmoothed5*5000);
     circle((width/2)+200,(height/2)+200,200-keySmoothed5*500);
     stroke(255,215,0,keySmoothed5*5000);
     circle((width/2)+200,(height/2)+200,180-keySmoothed5*1000);
   }
   
   
   
   if(amp[25].analyze() > 0.01){
     noFill();
     //fill(0,50,255,amp[25].analyze()*5000);
     fill(212,172,78,amp[25].analyze()*5000);
     circle((width/2)-200,(height/2)-200,100); 
   }
   if(amp[29].analyze() > 0.01){
     noFill();
     stroke(stroke,amp[29].analyze()*5000);
     fill(250,216,92,amp[29].analyze()*5000);
     circle((width/2)+200,(height/2)-200,100); 
   }
   if(amp[24].analyze() > 0.01){
     noFill();
     fill(250,216,92,amp[24].analyze()*5000);
     circle((width/2)+200,(height/2)-200,100); 
   }
   if(amp[27].analyze() > 0.01){
     noFill();
     fill(250,216,92,amp[27].analyze()*5000);
     circle((width/2)-200,(height/2)+200,100); 
   }
   if(amp[28].analyze() > 0.01){
     fill(212,172,78,amp[28].analyze()*5000);
     circle((width/2)-200,(height/2)-200,100); 
   }
   if(amp[26].analyze() > 0.01){
     fill(212,172,78,amp[26].analyze()*5000);
     circle((width/2)+200,(height/2)+200,100); 
   }
   if(amp[22].analyze() > 0.01){
     fill(250,216,92,amp[22].analyze()*5000);
     circle((width/2)+200,(height/2)+200,100); 
   }
   if(amp[23].analyze() > 0.01){
     fill(212,172,78,amp[23].analyze()*5000);
     circle((width/2)-200,(height/2)+200,100); 
   }
   

  
 }

}
