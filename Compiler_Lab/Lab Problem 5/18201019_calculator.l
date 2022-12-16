%option noyywrap
%{
  #include <stdio.h>
  #include <math.h>
  int option = 0;
  int i=0;
  int temp=1;
  float a, b;
  float pi = 3.1416;
  void compute();
%}
  
dig [0-9]+|([0-9]*)"."([0-9]+)
addition "+"
subtraction "-"
multiplication "*"
division "/"
power "^"
mod "%"
factorial "!"
gcd "gcd"
sine "sin"
cosine "cos"
squareRoot "sqrt"


%%
  
{dig} {compute();} 
{addition} {option=1;}
{subtraction} {option=2;}
{multiplication} {option=3;}
{division} {option=4;}
{power} {option=5;}
{mod} {option=6;}
{factorial} {option=7;}
{gcd} {option=8;}
{sine} {option=9;}
{cosine} {option=10;}
{squareRoot} {option=11;}


[\n] {
printf("\nThe Answer is:%f\n\n",a);
}
  
%%

void compute()
{
 if(option==0)
  
 a=atof(yytext); 
  
 else
 {
 b=atof(yytext);
  
 switch(option)
 {
   case 1:
   a=a+b;
   break;
  
   case 2:
   a=a-b;
   break;
   
   case 3:
   a=a*b;
   break;
   
   case 4:
   a=a/b;
   break;

   case 5:
   for(i=a;b>1;b--){
    a *= i;
   }break;

   case 6:
   i = a/b;
   a = a - (int)i * b;
   break;

   case 7:
   a = 1;
   for(i=1;i<=b;i++){
    temp *= i;
   }
   a=temp;
   temp=1;
   break;

   case 8:
   a = (a>0) ? a: -a;
   b = (b>0) ? b: -b;
   while(a!=b)
   {
    if(a>b){
      a -= b;
    }else{
      b -= a;
    }
   }

   case 9:
     b = b * (M_PI / 180.0); 
     a=sin(b);
     break; 

   case 10:
     b = b * (M_PI / 180.0); 
     a=cos(b);

     break;
   
   case 11: 
      a=sqrt(b);
       break;
   
  

  }
 option=0;
 }
}
  
int main(void)
{
 yylex();
 return 0;
}

