/*

(Classe Employee ) Crie uma classe chamada Employee que inclua três partes de informações como membros 
de dados — um nome(tipo string ), um sobrenome (tipo string ) e um salário mensal (tipo int ). 
[Nota: Nos capítulos subseqüentes, utilizaremos números que contêm pontos de fração decimal 
(por exemplo, 2,75) — chamados valores de ponto flutuante — para representar quantias em dólar.]
Sua classe deve ter um construtor que inicialize os três membros de dados. Forneça uma função set e 
uma função get para cada membro de dados. Se o salário mensal não for positivo, configure-o como 0 . 
Escreva um programa de teste que demonstre as capacidades da classe Employee . Crie dois objetos 
Employee e exiba o salário anual de cada objeto. Então dê a cada Employee um aumento de 10% e exiba
novamente o salário anual de cada Employee .

*/

#include <string>
using std::string;

#include <iostream>
using std::cout;
using std::endl;

class Employee{

    public:

        Employee(string nome,string sobrenome,float valor){
            setNome(nome);
            setSobrenome(sobrenome);
            if(valor<=0.0F){
                setSalarioMensal(0.0F);
            }else{
                setSalarioMensal(valor);
            }
        }
        
        string getNome()
        {
            return nome;
        }

    
        void setNome(string nome)
        {
            nome = nome;
        }

    
        string getSobrenome()
        {
            return sobrenome;
        }

    
        void setSobrenome(string sobrenome)
        {
            sobrenome = sobrenome;
        }

    
        float getSalarioMensal()
        {
            return salarioMensal;
        }

    
        void setSalarioMensal(float salarioMensal)
        {
            salarioMensal = salarioMensal;
        }

    private:
        string nome;
        string sobrenome;
        float salarioMensal;
};

int main()
{
    Employee e1("Eduardo","Costa",1300.09); 
    Employee e2("Adevan","Neves",600.0);

    cout<<"Salário de "<<e1.getNome()<<" : "<<e1.getSalarioMensal()<<endl;
    cout<<"Salário de "<<e2.getNome()<<" : "<<e2.getSalarioMensal()<<endl;

    //Aumento de 10% nos salários;
    e1.setSalarioMensal(e1.getSalarioMensal()+e1.getSalarioMensal()*(10/100));
    e2.setSalarioMensal(e2.getSalarioMensal()+e2.getSalarioMensal()*(10/100));

    cout<<"Salário de "<<e1.getNome()<<" : "<<e1.getSalarioMensal()<<endl;
    cout<<"Salário de "<<e2.getNome()<<" : "<<e2.getSalarioMensal()<<endl;

    return 0;
}
