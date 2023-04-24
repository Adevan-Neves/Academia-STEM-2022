#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <ctype.h>

#define msg_falta_info "Falta informação em matriz.txt"
#define msg_menos_linhas "O arquivo contém menos linhas do que descrito para as matrizes"
#define msg_linha_vazia "A linha lida atualmente se encontra vazia"

int main(int argc, char const *argv[])
{
    FILE *arquivo;
    char separador[80];
    int qtd_argumentos_fscanf;
    /*tamanho das matrizes m1 e m2 */
    int m1_m = 0, m1_n = 0, m2_m = 0, m2_n = 0;
    arquivo = fopen("matriz.txt", "r");
    if (!arquivo)
        arquivo = fopen("../matriz.txt", "r");
    else
        exit(1); /*não foi possível abrir o arquivo*/

    /*leitura dos dados no arquivo*/
    qtd_argumentos_fscanf = fscanf(arquivo, "%d,%d,%d,%d\n", &m1_m, &m1_n,
                                   &m2_m, &m2_n);
    /*quantidade de numeros em matriz.txt está errada*/
    if (qtd_argumentos_fscanf != 4)
        exit(1);

    int matriz1[m1_m][m1_n];
    int matriz2[m2_m][m2_n];
    int matriz_produto[m1_m][m2_n];

    recupera_matriz(arquivo, m1_m, m1_n, matriz1);
    fgets(separador,80,arquivo);/*pega o caractere ou linha adiciona para separar os registros*/
    recupera_matriz(arquivo, m2_m, m2_n, matriz2);

    /*fechar o arquivo*/
    fclose(arquivo);
    return 0;
}

void multiplique_matriz(){
    
}

void mostrar_matriz(int m,int n, int matriz[m][n]){
    printf("\n==== Matriz ====\n");
    for(int i=0;i<m;i++){
        for(int j=0;j<n;j++){
            printf("[%d][%d]: %d ",i,j,matriz[i][j]);
        }
        printf("\n");
    }
}

void recupera_matriz(FILE *arq, int m, int n, int matriz[m][n])
{
    int cont = 0;
    char linha[80];
    int num;
    while (cont < m)
    {
        if (feof(arq))
        {
            printf(msg_falta_info);
            exit(1);
        }
        else
        {
            strcpy(linha, "");
            fgets(linha, 80, arq);
            if (strlen(linha) == 0)
            {
                printf(msg_falta_info);
                exit(1);
            }
            else
            {
                if (isspace(linha[0]))
                {
                    printf(msg_linha_vazia);
                    exit(1);
                }
                else
                {
                    char *token = strtok(linha, ",\n");
                    if(token==NULL){
                        printf(msg_falta_info);
                        exit(1);
                    }else{
                        num = atoi(token);
                        matriz[cont][0] = num; /*primeiro elemento de cada linha*/
                        for (int i = 1; i < n; i++)
                        {
                            token = strtok(NULL, ",\n");
                            if(token==NULL){
                                printf(msg_falta_info);
                            }else{
                                matriz[cont][i] = atoi(token);
                            }   
                        }
                    }
                    
                }
            }
        }
        cont++;
    }
}