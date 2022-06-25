/*

Problema:
    2.18) Escreva um programa que pede para o usuário inserir dois inteiros,
    obtém os números do usuário, e então imprime o maior número seguido pelas 
    palavras “é o maior” . Se os números forem iguais, imprime a mensagem 
    “Estes números são iguais” .

*/

#include <iostream>
using std::cin;
using std::cout;
using std::endl;

int main(){
    int valor1,valor2;
    cout<<"Entre com dois valores separados por espaço: ";
    cin>>valor1>>valor2;
    if(valor1==valor2){
        cout<<"Estes números são iguais!"<<endl;
    } else {
        if(valor1>valor2){
            cout<<valor1<<" é o maior"<<endl;
        } else {
            cout<<valor2<<" é o maior"<<endl;
        }
    }
    return 0;
}