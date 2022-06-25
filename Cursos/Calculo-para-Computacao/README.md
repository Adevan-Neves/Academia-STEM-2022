# Cálculo para Computação

## O que é o algoritmo de Runge-Kutta ?
###   É um método utilizado para a resolução numérica de equações diferenciais ordinárias (EDO) por meio de iterações, o mais conhecido é o de quarta ordem. Importante que este é somente um membro da família de algoritmos  runge-kutta.
## Teoria
###   Na disciplina de graduação denominada Cálculo Numérico, será discutido que nem sempre problemas podem ser resolvidos de maneira analítica. Nestes casos, será utilizado uma metodologia numérica para aproximar soluções por meio de uma máquina de calcular. Portanto, o método de Runge-Kutta estabelece a solução de uma EDO de modo mais ágil utilizando tabelas e gráficos como suporte.
## O algoritmo
###   De acordo com Manoel Azevedo, os métodos de ordem p são expressos pela seguinte equação :
$$y_{n+1} \ = \ y_{n}+h*f(x_{n},y_{n}) \ para \ todo \ k = 0,1,2...$$
### Sendo f uma função dependente de x e y com tamanho de passo h
### De quarta ordem:
$$  y_{n+1}  = y_{n} + (h/6)*(k_{1}+2*(k_{2}+k_{3}  )   +k_{4})  $$
$$ k_{1} = f(x_{n}, y_{n}) $$
$$ k_{2} = f(x_{n}  + (1/2)h  , y_{n} +(1/2)hk_{1}   ) $$
$$ k_{3} = f(x_{n}  + (1/2)h  , y_{n} +(1/2)hk_{2}   ) $$
$$ k_{4} = f(x_{n}  + h  , y_{n} +(1/2)hk_{1}   ) $$

## Implementação em linguagem C
###   A primeira etapa foi abstrair esta função f para uma função polinomial de x e y, depois tratar os casos de divisão por zero e intervalo inválido.
###   Em seguida, construir o laço for de incremento da imagem de xn com base no problema de valor inicial.

# Referências
###  Livro : Cálculo numérico com uma abordagem à Computação Quântica, Manoel Santos Azevedo. 1a edição ISBN: 978-85-473-4515-0