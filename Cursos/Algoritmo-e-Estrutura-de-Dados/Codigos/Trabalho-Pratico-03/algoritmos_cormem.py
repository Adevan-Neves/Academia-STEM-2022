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
    def __str__(self):
        return f"( {self.dado} )"


class ArvBinBus:
    '''Aqui temos a árvore de busca binária em com os métodos de inserção,remoção, pesquisa e o atributo raiz'''
    def __init__(self,dado):
        self.raiz=NoArvore(dado)
        self.tamanho=1

    def validaNo(self,no):
        '''Desejo sempre utilizar este método de validação, para que transformar o nó em default self.raiz toda vez em futuros métodos'''
        if(no==RAIZ):
            return self.raiz
        else:
            return no
    def inOrdem(self,no=RAIZ):
        '''Visite a subarvore esquerda, visite a raiz, visite a subarvore direita'''
        no=self.validaNo(no)
        if(no!=None):
            self.inOrdem(no.esq)
            print(no)
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

