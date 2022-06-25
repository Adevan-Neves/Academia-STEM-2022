/*
Problema:
    Escreva um programa que lê o raio de um círculo como um inteiro e imprime o diâmetro,
    a circunferência e a área do círculo. Utilize o valor constante 3,14159 para π.
    Faça todos os cálculos em instruções de saída. 
    [Nota: Neste capítulo, discutimos apenas as constantes e variáveis de inteiro.
    No Capítulo 4, discutimos números de ponto flutuante, isto é, valores que 
    podem ter pontos de fração decimal.]
*/

#include <iostream>
#include <math.h>
using std::cin;
using std::cout;
using std::endl;

const float PI=3.14159;

int main(int argc, char const *argv[])
{
    float raio_circulo,diametro,circuferencia,area;
    cout<<"Entre com o valor do raio de um círculo: ";
    cin>>raio_circulo;

    //Diâmetro é duas vezes o raio
    diametro=2*raio_circulo;

    //Área é cosntante Pi vezes o raio ao quadrado
    area=PI*(pow(raio_circulo,2)); // a função pow eleva um número x a potência y pow(x,y)

    //Circunferência é duas vezes pi vezes raio
    circuferencia=2*PI*raio_circulo;

    cout<<"Resultado Final"<<"\nRaio do círculo: "<<raio_circulo<<"\nDiâmetro: "<<diametro;
    cout<<"\nCircuferência: "<<circuferencia<<"\nÁrea: "<<area<<endl;

    return 0;
}
