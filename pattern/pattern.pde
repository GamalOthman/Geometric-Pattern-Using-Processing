//In this program I'm using processing to create
//a geometric pattern. For details about dimensions
//of the pattern, please refer to the attached files.
//My mail: eng.gamalothman@gmail.com

//**Parameters of Pattern**//
int a= 50, b= 150;        //pattern dimensions
int m= 20;              //slope angle
int s= 5;               //stroke weight
//**//

float cosM= cos(radians(m));
float tanM= tan(radians(m));
int a1= int(a/cosM);
int b1= int(b/cosM);
int t1= int(b*tanM);
int t2= int((b-a)* tanM);
int t3= 2*(a1+t1)-t2;

int bw= 10;                 //border width
int rx1= bw , ry1= bw;      //top left point of rect
int rx2= 1200-2*bw;         //bottom right point of rect
int ry2= 700-2*bw;    
int x0= rx1-b;              //starting point
int y0= ry1+s/2+t1-a1;    
int x=x0, y=y0;             // start point of line
int i=x, j=y;                //end point of line
int bar= 0;                  // line of pattern

void setup(){
  size(1200,700);            //do not change this
  strokeWeight(s);
  background(#f38181);
  fill(#fce38a);
  noStroke();
  rect(rx1,ry1,rx2,ry2);
}

void draw() {
  stroke(#f38181);
  dline(b, -t1);          //point 1     
  dline(0, -a1);           //point 2
  dline(-(b-a), t2);     //point 3
  dline(0, -a1);          //point 4
  dline(b, -t1);         //point 5
  dline(0,t3);           //point 6
  
  if (x>=rx1+rx2) {
    bar+=1;
    x=x0-a*(bar); 
    y=y0+bar*(t3-(t1-a1));
    if(y>=ry1+ry2+t3) { noLoop();}
    }
}

void dline(float x1,float y1){     //draw line from (x,y) to (i,j) 
  i= int(x+x1);
  j= int(y+y1);
  line(x,y,i,j);
  x=i; y=j;
}