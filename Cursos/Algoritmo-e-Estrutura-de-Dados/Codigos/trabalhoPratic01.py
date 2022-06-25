'''Palíndromo é uma sequência de letras que pode ser lida igualmente de 
frente para trás ou de trás para frente. Por exemplo, a palavra 
radar é um palíndromo. Dada uma sequência de letras, a tarefa 
é escrever um programa em Python que utilize a estrutura de dados 
Pilha para determinar se a sequência representa ou não um 
palíndromo. O programa deve ser escrito em Python com estrutura 
de dados do tipo pilhas e não é permitido usar bibliotecas 
prontas para esse tipo de estrutura de dados.'''

class Pilha():
    ''' Representa a estrutura de dados do tipo pilha'''
    def __init__(self):
        self.pl=[]
    def push(self,e):
        '''empilha um elemento'''
        self.pl.append(e)

    def mostrar(self):
        return self.pl
    def __len__(self):
        return len(self.pl)

    def is_empty(self):
        return len(self.pl)==0

    def _pop(self):
        '''retira do topo um elemento'''
        try:
            return self.pl.pop()
        except IndexError:
            return 'Lista vazia ou Índice inexistente'
    def _top(self):
        '''mostra o topo atual da pilha'''
        try:
            return self.pl[-1]

        except IndexError:
            return 'Lista vazia ou Índice inexistente' 

seqLetra=input()
pilha=Pilha()
pilha2=Pilha()
for i in range(len(seqLetra)):
    '''Trata o caso em que a frase contenha espaços em branco'''
    if seqLetra[i]==" ":
        continue
    else:
        pilha.push(seqLetra[i])
        pilha2.push(seqLetra[i])

# Agora iremos desempilhar a pilha para formar a pilha reversa rever palindromo
n=pilha.__len__()
pilhaReversa=Pilha()

for i in range(n):
    pilhaReversa.push(pilha2._pop())
palin=True
for i in range(n):
    if (pilha._pop()!=pilhaReversa._pop()):
        palin=False
        break


if palin:
    print("sim")
else:
    print("nao")