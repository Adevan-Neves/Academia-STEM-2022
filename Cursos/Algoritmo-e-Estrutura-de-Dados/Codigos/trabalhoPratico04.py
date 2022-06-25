'''Implementação em Python dos algoritmos de buscar binária do livro de Algoritmos, Cormem
  Neste momento, a constante RAIZ serve para quando eu utilizar o método da arvore binária de busca e não
  passar nenhum parâmetro quer dizer que o nó considerado para a operação será sempre o nó raiz'''
RAIZ="raiz"
class NoArvore:
    '''O nó de cada árvore deve conter os atributos: dado, nó à direita e nó á esquerda'''
    def __init__(self,dado):
        self.dado=dado
        self.esq=None
        self.dir=None
        
    # A representação de um nó será ums string com seu valor tomando a unicidade de cada um
    '''def __str__(self):
        return f"( {self.dado} )"
    '''
    def __str__(self):
        return str(self.dado)


class ArvBinBus:
    '''Aqui temos a árvore de busca binária em com os métodos de inserção,remoção, pesquisa e o atributo raiz'''
    def __init__(self,dado):
        self.raiz=NoArvore(dado)
        self.listaNo=[]
        self.tamanho=1

    def validaNo(self,no):
        '''Desejo sempre utilizar este método de validação, para que transformar o nó em default self.raiz toda vez em futuros métodos'''
        if(no==RAIZ):
            return self.raiz
        else:
            return no
    def inOrdem(self,no=RAIZ):
        #Modificando este método para em vez de escrever na tela armazenar todos os nós folhas
        #no folha é aquele que não tem filho
        '''Visite a subarvore esquerda, visite a raiz, visite a subarvore direita'''
        no=self.validaNo(no)
        if(no!=None):
            self.inOrdem(no.esq)
            #print(no)
            if((no.esq is None)and (no.dir is None)):
                self.listaNo.append(no)
            self.inOrdem(no.dir)
    def preOrdem(self,no=RAIZ):
        '''Visite a raiz, visite a subarvore esquerda, visite a subarvore direita'''
        no=self.validaNo(no)
        if(no!=None):
            print(no)
            self.inOrdem(no.esq)           
            self.inOrdem(no.dir)
    
    def posOrdem(self,no=RAIZ):
        '''Visite primeiro a subarvore esquerda, depois a subarvore direita e depois a raiz'''
        no=self.validaNo(no)
        if(no!=None):
            self.inOrdem(no.esq)           
            self.inOrdem(no.dir)
            print(no)

    def pesquisa(self,k,no=RAIZ):
        '''A configuração permite que se o nó atual não tem o seu dado igual a k
        então precise ir procurar na subarvore direita se no.dado é menor que k, e ir 
        procurar na subarvore esquerad se no.dado é maior que k'''
        no=self.validaNo(no)
        if(no==None or k==no.dado):
            return no
        if(k<no.dado):
            return self.pesquisa(k,no.esq)
        else:
            return self.pesquisa(k,no.dir)

    def minimo(self,no=RAIZ):
        '''O minímo de uma árvore de busca binária será sempre o nó mais à esquerda da árvore'''
        no=self.validaNo(no)
        if(no is None):
            return None
        else:
            while(no.esq!=None):
                no=no.esq
            return no
    def maximo(self,no=RAIZ):
        '''O máximo de uma árvore de busca binária será sempreo nó mais á direita da arvore'''
        no=self.validaNo(no)
        if(no is None):
            return None
        else:
            while(no.dir!=None):
                no=no.dir
            return no
    def inserir(self,k,no=RAIZ):
        no=self.validaNo(no)
        parente=None
        '''Realizarei uma busca interna até parar em um nó null, onde o pai deveria apontar para este novo elemento'''
        
        while(no):
            '''Neste momento, o livro utilizou um ponteiro p para localizar o pai do nó atual, porém
            tomei a liberdade de utilizar uma variável parente para saber quem é o nó anterior'''
            parente=no
            if(k<no.dado):
                no=no.esq
            else:
                no=no.dir
            '''As linhas 90 até 93 controlam o caminho percorrido para encontrar o local necessário para inserção'''
        if(parente is None):
            '''Se parente é None, significa que a raiz é inicialmente vazia, será o primeiro nó inserido'''
            self.raiz=NoArvore(k)
        elif(k<parente.dado):
            parente.esq=NoArvore(k)
        else:
            parente.dir=NoArvore(k)
        #Da linha 98 a 101 é onde ocorrerar a inserção do valor propriamente dito, para esquerda ou direita dependendo
        #do dado na chave parente
    
    def remover(self, k, node=RAIZ):     
        if node == RAIZ:
            node = self.raiz       
        if node is None:
            return node       
        if k < node.dado:
            node.esq = self.remover(k, node.esq)        
        elif k > node.dado:
            node.dir = self.remover(k, node.dir)      
        else:
            if node.esq is None:
                return node.dir
            elif node.dir is None:
                return node.esq
            else:               
                subs = self.minimo(node.dir)               
                node.dado = subs.dado               
                node.direita = self.remover(subs.dado, node.dir)
        return node
    #Adicionando funcionalidade para atender ao trabalho 4
    def listaNoFolha(self,vl):
        lop=[]
        self.inOrdem()
        #Agora a listaNo tem todos os nós folhas da arvore
        #Vou medir a distancia de vl a cada nó e então saber quem tem a menor distância
        n=len(self.listaNo)
        listaDist=[]
        for i in range(n):
            listaDist.append(abs(vl-self.listaNo[i].dado))
        #Agora eu tenho as distâncias de cada nó folha
        #Vou procurar o menor termo e ver se ele não está duplicado
        iDoMenor=0
        menor=listaDist[0]
        for i in range(n):
            if(listaDist[i]<menor):
                #Alterei aqui
                menor=listaDist[i]
                iDoMenor=i
        #Agora vou contar quantos elementos tem repetido
        if(listaDist.count(menor)>1):
            #Quer dizer que tem dois lá, então eu preciso saber o indice deles
            for i in range(n):
                if(listaDist[i]==menor):
                    lop.append(self.listaNo[i])
        elif(listaDist.count(menor)==1):
            lop.append(self.listaNo[iDoMenor])
        return lop

#*********************************

# Casos de teste disponiveis no pdf

#*********************************
#11 22 36 59 26 14 10 29 28 17 70 65 80  Deve me retornar 17 | 11 elementos 22(comparado)
#6 13 36 59 26 14 10 16 Deve me retornar 10 e 16 | 6 elementos  13(comparado)

if __name__=="__main__":
    #print("---Projeto 04 Adevan Neves Santos---")
    #listaUsuario=input("Digite num de nós | Valor a procurar e | os nós ")
    #listaUsuario=input()
    '''Quardar os dois primeiros valores em variáveis e o resto em uma lista'''
    #listaUsuario=listaUsuario.split()
    #l=[]
    #print(listaUsuario)
    #n=int(listaUsuario[0])
    #vl=int(listaUsuario[1])
    #listaUsuario.remove(str(n))
    #listaUsuario.remove(str(vl))
    ''' list comprehension python '''
    #listaNos=[int(i) for i in listaUsuario]
    n=int(input())
    vl=int(input())
    listaNos=[]
    for i in range(n):
        listaNos.append(int(input()))

    minhaArvore=ArvBinBus(listaNos[0])
    for i in range(1,n):
        
        minhaArvore.inserir(listaNos[i])

    l=minhaArvore.listaNoFolha(vl)
    #print("olá")
    ji=len(l)
    #print(ji)
    for i in range(ji):
        print(l[i])