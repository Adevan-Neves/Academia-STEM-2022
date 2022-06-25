/*

(Classe Invoice ) Crie uma classe chamada Invoice que uma loja de suprimentos de informática possa 
utilizar para representar uma fatura de um item vendido na loja. Uma Invoice (fatura) deve incluir 
quatro partes das informações como membros de dados — um número identificador (tipo string ), uma 
descrição (tipo string ), a quantidade comprada de um item (tipo int ) e o preço por item (tipo int ). 
[Nota: Nos capítulos subseqüentes, utilizaremos números que contêm pontos de fração decimal 
(por exemplo, 2,75) — chamados valores de ponto flutuante — para representar quantias em dólar.] 
Sua classe deve ter um construtor que inicializa os quatro membros de dados. Forneça uma função set e 
uma função get para cada membro de dados. Além disso, forneça uma função-membro chamada getInvoiceAmount 
que calcula a quantia da fatura (isto é, multiplica a quantidade pelo preço por item) e depois retorna 
a quantidade como um valor int . Se a quantidade não for positiva, ela deve ser configurada como 0 . 
Se o preço por item não for positivo, ele deve ser configurado como 0 . 
Escreva um programa de teste que demonstre as capacidades da classe Invoice .

*/

#include <string>
using std::string;

#include <iostream>
using std::cout;
using std::endl;

class Invoice{
    public:
        Invoice(int ni,string desc,int qtd,float valor){
            numeroIdentificador=ni;
            descricao=desc;
            if(qtd<0){
                quantidadeComprada=0;
            } else{
                quantidadeComprada=qtd;
            }
            if(valor<0.0F){
                preco=0.0F;
            }else{
                preco=valor;
            }
        }

        float getInvoiceAmount(){
            return quantidadeComprada*preco;
        }

        
        int getNumeroIdentificador()
        {
            return numeroIdentificador;
        }

    
        void setNumeroIdentificador(int numeroIdentificador)
        {
            numeroIdentificador = numeroIdentificador;
        }

    
        string getDescricao()
        {
            return descricao;
        }

    
        void setDescricao(string descricao)
        {
            descricao = descricao;
        }

    
        int getQuantidadeComprada()
        {
            return quantidadeComprada;
        }

    
        void setQuantidadeComprada(int quantidadeComprada)
        {
            quantidadeComprada = quantidadeComprada;
        }

    
        float getPreco()
        {
            return preco;
        }

    
        void setPreco(float preco)
        {
            preco = preco;
        }

    private:
        int numeroIdentificador;
        string descricao;
        int quantidadeComprada;
        float preco;
};

int main()
{
    Invoice batataPalha(16,"Batalha Palha Primor 500 g",3,19.99);
    cout<<"Valor a ser pago: "<<batataPalha.getInvoiceAmount()
        <<"\nNúmero indentificador: "<<batataPalha.getNumeroIdentificador()
        <<"\nDescrição: "<<batataPalha.getDescricao()<<endl;
    
    batataPalha.setPreco(230.00);
    cout<<"Preço da batata Palha aumentou: "<<batataPalha.getPreco()<<endl;
    cout<<"Novo valor a ser pago: "<<batataPalha.getInvoiceAmount()<<endl;

    return 0;
}
