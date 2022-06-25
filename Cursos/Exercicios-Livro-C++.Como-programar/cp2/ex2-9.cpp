/*
Problema (exercício 2.9) : 
    Escreva uma única instrução C++ ou linha que realize cada uma das 
    seguintes tarefas:
    a) Imprima a mensagem “Entre com dois números” .
    b) Atribua o produto de variáveis b e c para a variável a .
    c) Declare que um programa realiza um cálculo de folha de pagamento 
    (isto é, utilize texto que ajuda a documentar um programa).
    d) Insira três valores de inteiro a partir do teclado nas variáveis
    de inteiro a , b e c .

*/
#include <iostream>
using std::cin;
using std::cout;
using std::endl;

int main(){
    int a,b,c;
    cout<<"Insira os valores a,b,c separados por espaço: ";
    cin>>a>>b>>c;
    cout<<"Valor antigo da variável a: "<<a<<endl;
    a=b*c;
    cout<<"Valor atual da variável a:"<<a<<endl;
    cout<<"Entre dois números"<<endl;
    return 0;
}
