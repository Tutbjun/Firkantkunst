float vx,vy,vz; //danner vinkel variabler

float[] bounce = new float[65536]; //danner en bounce variabel for hver trekant (her står også maksimal understøttede trekanter)
int x = 59; // antal gange programmet er kørt

int breddex = 4; //antal firkanter i x
int breddey = 4; //antal firkanter i y
int breddez = 4; //antal firkanter i z

float rotationvektorlaengde = 50; //ændrer rotationshastighed

int _mouseX,_mouseY; //bruges til rotationsberegning


void setup(){
  size(690,690,P3D);//definerer 3dspace
  
}

void draw(){
  x++;
  for(int i = 0; i < 65536; i++)
    bounce[i] += sin(x*1.25);//x bruges til at defineres bounce værdien for alle 65536 evt. kasser
  
  if(x>15){//gendefinerer bounce mynsteres hvert 15/60 af et sekund, så det ser mindre ensartet ud 
    x = 0;
  for(int i = 0; i < 65536; i++)
    bounce[i] = random(0,1);
  }
   
  
  background(0);
  
  translate(345,345,0);//sætter origo i koordinatsystemet til midten af skærmen
  rotateX(vx);
  rotateY(vy);
  rotateZ(vz);//roterer koordinatsystem, med hvad end hvinklen er i øjeblikket
  fill(235,235,0);//sætter farven for kasserne
  translate((-breddex+1)*50/2,(-breddey+1)*50/2,(-breddez+1)*50/2);//går til hjørnepositionen af hele figuren, for at starte med at tegne
  raekkeraekkeraekke();// tegner kassen
  
  if(vx>2*PI)
    vx -= 2*PI;
  if(vy>2*PI)
    vy -= 2*PI;
  if(vz>2*PI)
    vz -= 2*PI;
  if(vx<-2*PI)
    vx += 2*PI;
  if(vy<-2*PI)
    vy += 2*PI;
  if(vz<-2*PI)
    vz += 2*PI;
  //hindrer for store tal i vinkel variablerne

  if(mousePressed){
    vy += atan((mouseX-_mouseX)/rotationvektorlaengde);//udregner hvor meget den skal rotere i en given akse ift. musens delta psotion
    vx -= atan((mouseY-_mouseY)/rotationvektorlaengde);
  }
  _mouseX = mouseX;//bruges til at udregne delta position i stedet for bare position
  _mouseY = mouseY;
}
