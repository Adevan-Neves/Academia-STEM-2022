/*

3.15) (Classe Date ) Crie uma classe chamada Date que inclua três partes de informações como membros de 
dados — um mês (tipo int ), um dia (tipo int ) e um ano (tipo int ). Sua classe deve ter um construtor 
com três parâmetros que utilize os parâmetros para inicializar os três membros de dados. Para o 
propósito desse exercício, assuma que os valores fornecidos para o ano e o dia são corretos, mas 
certifique-se de que o valor de mês esteja no intervalo 1–12; se não estiver, configure o mês como 1. 
Forneça uma função set e uma função get para cada membro de dados. Forneça uma função-membro 
displayDate que exiba o dia, o mês e o ano separados por barras normais ( / ).
Escreva um programa de teste que demonstre as capacidades da classe Date .

*/

#include <iostream>
using std::cout;
using std::endl;

class Date{
    public:
        Date(int d,int m,int a){
            dia=d;
            //Operador ternário Explicação do algoritmo
            // O m é maior que 12 ou é menor que 1 ? se sim, mes recebe 1, senão mês recebe m
            mes = (m>12 or m<1) ? 1 : m;
            ano=a;
        }

        void displayDate(){
            cout<<dia<<"/"<<mes<<"/"<<ano<<endl;
        }

        int getDia(){
            return dia;
        }

        int getMes(){
            return mes;
        }

        int getAno(){
            return ano;
        }

        void setDia(int d){
            dia=d;
        }

        void setMes(int m){
            mes= (m>12 or m<1) ? 1 : m;
        }

        void setAno(int a){
            ano=a;
        }

    private:
        int dia;
        int mes;
        int ano;
};

int main()
{
    Date d1(13,3,2003);
    Date d2(20,89,2020);
    d1.displayDate();
    d2.displayDate();
    //Trocando o dia do objeto date d1
    d1.setDia(12);
    d1.displayDate();
    return 0;
}
