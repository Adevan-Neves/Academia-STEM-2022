#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

int main(int argc, char const *argv[])
{
    FILE* arquivo;
    int qtd_argumentos_fscanf;
    /*tamanho das matrizes m1 e m2 */
    int m1_m=0,m1_n=0,m2_m=0,m2_n=0;
    arquivo=fopen("matriz.txt","r");
    if(!arquivo) arquivo=fopen("../matriz.txt","r");
    else exit(1); /*não foi possível abrir o arquivo*/

    /*leitura dos dados no arquivo*/
    qtd_argumentos_fscanf=fscanf(arquivo,"%d,%d,%d,%d\n",&m1_m,&m1_n,
                                                       &m2_m,&m2_n);
    /*quantidade de numeros em matriz.txt está errada*/
    if(qtd_argumentos_fscanf!=4) exit(1);

    /*while(!feof(arquivo)){
        fgets(linha,70,arquivo);
        printf("%s",linha);
    }*/

    int matriz1[m1_m][m1_n];
    int matriz2[m2_m][m2_n];
    int matriz_produto[m1_m][m2_n];

    recupera_matriz(matriz1,arquivo,m1_m,m1_n);
    recupera_matriz(matriz2,arquivo,m2_m,m2_n);

    /*fechar o arquivo*/
    fclose(arquivo);
    return 0;
}


void recupera_matriz(int* matriz,FILE* arq,int m,int n){

}