void raekkeraekkeraekke(){
  pushMatrix();
    for(int i1 = 0; i1<breddez; i1++){ //sætter en breddez lang række af rækker af rækker (en kasse)
      raekkeraekke(i1); //sætter en flade
      translate(0,0,50); //flytter til næste flades position
    }
  popMatrix();//fjerner ændringer af koordinatsystemets origon fra for loopen
}

void raekkeraekke(int i1){
  pushMatrix();
    for(int i2 = 0; i2<breddey; i2++){//sætter en breddey lang række af rækker (en flade)
      raekke(i2,i1); //sætter en række
      translate(0,50,0); //rykker til næste rækkes position
    }
  popMatrix();//fjerner ændringer af koordinatsystemets origon fra for loopen
}

void raekke(int i2,int i1){
  pushMatrix();
    for(int i3 = 0; i3<breddex; i3++){//sætter en breddex lang række med kasser
      box(45+bounce[(i3+1)*(i2+1)*(i1+1)]*4);//sætter kassen
      translate(50,0,0);//rykker til næste kasses position
    }
  popMatrix();//fjerner ændringer af koordinatsystemets origon fra for loopet
}
