/*
Problema: 
    2.16)Escreva um programa que solicita ao usuário inserir dois números, obtém os dois 
    números do usuário e imprime a soma, produto, diferença
    e quociente dos dois números.

*/
#include <iostream>
using std::cin;
using std::cout;
using std::endl;

int main(){
    int primeiroNumero,segundoNumero;
    float quociente;
    int soma,produto,diferenca;
    cout<<"Entre com o primeiro e segundo valor separados por espaço: ";
    cin>>primeiroNumero>>segundoNumero;
    
    //Realiza as operações solicitadas com os valores
    soma=primeiroNumero+segundoNumero;

    diferenca=primeiroNumero-segundoNumero;
    
    produto=primeiroNumero*segundoNumero;

    //Utilizando o cast para doubles pois a divisão de números pode retonar um número não inteiro
    quociente=static_cast<double>(primeiroNumero)/static_cast<double>(segundoNumero); 

    //Mostra os resultados para o usuário utilizando uma única instrução cout
    cout<<"--Resultado Final--\a"<<"\nSoma: "<<soma<<"\nSubtração: "<<diferenca<<"\nProduto: "<<produto<<"\nQuociente: "<<quociente<<endl;
    return 0;
}