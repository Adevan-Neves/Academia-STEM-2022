#include <stdio.h>
#include <math.h>

/*A minha função f será composta por um escopo generico onde x e y estao
com termos de grau ate 2 cada
funcao f sera = ax^2 +bx+cy^2+dy + e */
float f(float x,float y,float a,float b,float c,float d,float e){
    float yresult;
    yresult= a*(pow(x,2))+b*x+c*(pow(y,2))+d*y+e;
    return yresult;
}

int main(void)
{
    int n;
    printf("Trabalho referente ao curso Calculo para Computacao\nministrado pelo professor Manoel Santos Azevedo\nna Escola Superior de Tecnologia da UEA");
    printf("O presente codigo deve como base o livro \n'Calculo Numerico : Uma abordagem a Computação Quântica', do autor Manoel Santos Azevedo ISBN: 978-85-473-4515-0 ");
    printf("Licença Permite edição e publicação do algoritmo, desde que sempre citado o autor !");
    printf("\n\nBem vindo ao metodo de hunge kutta !!!\n");
    printf("\n\t\t----Metodo de Kunge-Kutta de quarta ordem em C---\n");
    printf("-----   y_(n+1) = y_(n) + (h/6)(K1+2(K2+K3)+K4)   -----");
    printf("\n\nExplicacao dos termos K da expressao\n");
    printf(" K1=f(xn,yn)\n K2=f(xn+(1/2)h, yn+(1/2)hK1)\n K3=f(xn+(1/2)h, yn +(1/2)hK2)\n K4=f(xn+h,yn+hK3)\n");
    printf("A funcao f sera descrita pela seguinte expressao generica: \n");
    printf("\tf(x,y)= ax^2+bx+cy^2+dy+e\t");

    printf("\nDigite o valor de n: ");
    scanf("%d",&n);
    if(n==0){
        printf("\nDivisao por zero !");
        return 0;
    }
    else{
        if(n<0){
            printf("\nIntervalo invalido !");
            return 0;
        }
        else{
            float x0,y0,xn,yn,i,a,b,c,d,e;

            printf("Digite o valor de x0: ");
            scanf("%f",&x0);
            printf("Digite o valor de y0: ");
            scanf("%f",&y0);
            printf("Digite o valor de xn: ");
            scanf("%f",&xn);
            printf("Digite o valor de a: ");
            scanf("%f",&a);
            printf("Digite o valor de b: ");
            scanf("%f",&b);
            printf("Digite o valor de c: ");
            scanf("%f",&c);
            printf("Digite o valor de d: ");
            scanf("%f",&d);
            printf("Digite o valor de e: ");
            scanf("%f",&e);


            float h=(xn-x0)/n,K1,K2,K3,K4,x;
            yn=y0;
            x=x0;
            for(i=0;i<n;i++){
                K1=f(x,yn,a,b,c,d,e);
                K2=f(x+h/2,yn+(h/2)*K1,a,b,c,d,e);
                K3=f(x+h/2,yn+(h/2)*K2,a,b,c,d,e);
                K4=f(x+h,yn+h*K3,a,b,c,d,e);
                yn=yn+(h/6)*(K1+2*K2+2*K3+K4);
                x=x+h;
            }
            printf("\nO resultado de f em %.4f é: %f",x,yn);
            printf("\n************** FIM *************\n");

        }
    }

    return 0;
}
