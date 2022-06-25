/*

Escreva um programa que insere um inteiro de cinco dígitos, separa o inteiro em seus dígitos individuais e imprime os dígitos separados
entre si por três espaços cada. [Dica: Utilize operadores de divisão de inteiros e módulo.] Por exemplo, se o usuário digitar 42339, o
programa deve imprimir:

              4 2 3 3 9

*/

#include <iostream>
using std::cin;
using std::cout;
using std::endl;

int main(){

    int number;

    std::cout <<"Insira um numero: ";
    std::cin>> number;

    std::cout<< number/10000 << "   " << (number/1000)%10 <<"   "<<
    (number/100)%10 << "   " << (number/10)%10 << "   "<< number%10 << std::endl;

    return 0;
}