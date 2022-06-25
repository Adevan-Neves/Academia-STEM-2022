/*
(Classe Account ) Crie uma classe chamada Account que um banco poderia utilizar para representar contas
bancárias dos clientes. Sua classe deve incluir um membro de dados de tipo int para representar o saldo 
da conta. [Nota: Nos capítulos subseqüentes, utilizaremos números que contêm pontos de fração 
decimal (por exemplo, 2,75) — chamados valores de ponto flutuante — para representar quantias
em dólar.] 
    Sua classe deve fornecer um construtor que recebe um saldo inicial e o utiliza para 
inicializar o membro de dados. O construtor deve validar o saldo inicial para assegurar que ele 
seja maior que ou igual a 0. Se não, o saldo deve ser configurado como 0 e o construtor deve exibir 
uma mensagem de erro, indicando que o saldo inicial era inválido. 
    A classe deve fornecer três funções-membro. A função-membro credit deve adicionar uma quantia 
ao saldo atual. A função-membro debit deve retirar o dinheiro de Account e assegurar que a
quantia de débito não exceda o saldo de Account . Se exceder, o saldo deve permanecer inalterado e 
a função deve imprimir uma mensagem que indica “Debit amount exceeded account balance.” 
A função-membro getBalance deve retornar o saldo atual. Crie um programa que cria dois objetos Account 
e testa as funções-membro da classe Account .
*/

#include <iostream>
using std::cout;
using std::cin;
using std::endl;

class Account{
    public:
        Account(float valor){
            if(valor<=0.0F){
                cout<<"Valor inicial Inválido ! Saldo recebe zero"<<endl;
            } else {
                saldo=valor;
            }
        }

        void credit(float valor){
            saldo+=valor;
        }

        void debit(float valor){
            if(valor>=saldo){
                cout<<"Debit amount exceeded account balance."<<endl;
            } else {
                saldo-=valor;
            }
        }

        float getSaldo(){
            return saldo;
        }

    private:
        float saldo;
};

int main()
{
    Account c1(-10.0);
    Account c2(23.0);

    cout<<"Saldo da conta 1:"<<c1.getSaldo()<<endl;
    cout<<"Saldo da conta 2:"<<c2.getSaldo()<<endl;

    //Adicionando mais um valor de 100.0 na conta 1
    c1.credit(100.0);
    //Retira 20.0 da conta 2
    c2.debit(20.23);

    cout<<"Saldo da conta 1:"<<c1.getSaldo()<<endl;
    cout<<"Saldo da conta 2:"<<c2.getSaldo()<<endl;

    return 0;
}
