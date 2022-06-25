/*

4.35) O fatorial de um inteiro não negativo n é escrito como n! (pronuncia-se ‘n fatorial’) e é definido 
como segue:
    n! = n · (n – 1) · (n – 2) · ... · 1 (para valores de n maiores que 1) e n! = 1 (para n = 0 ou n = 1).
    Por exemplo, 5! = 5 · 4 · 3 · 2 · 1, que é 120. Utilize instruções while em cada um dos seguintes:

    a) Escreva um programa que lê um inteiro não negativo e calcula e imprime seu fatorial.

    b) Escreva um programa que estima o valor da constante matemática e utilizando a fórmula:
         e = 1 + 1/1! + 1/2! + 1/3! + ....
         Solicite ao usuário a exatidão desejada de e (isto é, o número de termos na adição)
    
    c) Escreva um programa que calcula o valor de e x utilizando a fórmula

     e^x = 1 + x/1! + x²/2! + x³/3! + ...
     Solicite ao usuário a exatidão desejada de e (isto é, o número de termos da adição).


*/
#include <iostream>
#include <iomanip> // manipuladores de fluxo parametrizados
#include <cmath>

using namespace std;

int fatorialIterarivo(int n){
    int f=1;
    int c=n;
    while(c>1){
        f=f*c;
        c--;
    }
}

double estimandoConstanteEuler(int qtdTermosAdicao){
    double e= 1.0; // O primeiro termo da adição sempre é 1
    if(qtdTermosAdicao>1){
        for(int i=1;i<=qtdTermosAdicao;i++){
            e+=(1.0/fatorialIterarivo(i));
        }
    }
    return e;
}

double estimandoValorEx(int qtdTermosAdicao,double x){
    double eX=1.0;
    if(qtdTermosAdicao>1){
        for(int i=1;i<=qtdTermosAdicao;i++){
            eX+=(pow(x,i)/fatorialIterarivo(i));
        }
    }
}

int main()
{
    int n;
    int fatorialN;
    double e;
    double eX;
    double x;
    cout<<"Entre com o número n e descubra n! : ";
    cin>>n;

    fatorialN=fatorialIterarivo(n);

    cout<<n<<"! = "<<fatorialN<<endl;

    cout<<"Estimando constante e:(digite o número de termos na soma) ";
    cin>>n;

    e=estimandoConstanteEuler(n);
    cout<<setprecision(4)<<fixed<<"com "<<n<<" termos de adição, e = "<<e<<endl;

    cout<<"Estimando a imagem de f(x)=e^x (digite o números de termos na soma e o valor de x) ";
    cin>>n>>x;

    eX=estimandoValorEx(n,x);
    cout<<setprecision(4)<<fixed<<"f("<<x<<")= "<<eX<<" com "<<n<<" termos na soma."<<endl;

    return 0;
}
