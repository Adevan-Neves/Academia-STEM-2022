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

    '''Adição de uma funcionalidade para o problema do trabalho 4
       Não deu CERTO !!!!!!!!!!!!!
    def retornaNo(self,vl):
        l=[]
        no=self.raiz
        parente=None
        Realizarei uma busca interna até parar em um nó null, onde o pai deveria apontar para este novo elemento
        
        while(no):
            Neste momento, o livro utilizou um ponteiro p para localizar o pai do nó atual, porém
            tomei a liberdade de utilizar uma variável parente para saber quem é o nó anterior
            parente=no
            if(vl<no.dado):
                no=no.esq
            else:
                no=no.dir
            As linhas 90 até 93 controlam o caminho percorrido para encontrar o local necessário para inserção
                Neste momento eu tenho o nó anterior ao nó folha que
        if(parente is None):
            l.append(no)
            return l
        else:
            Irei tratar o caso em que este nó folha não tem irmão para comparar,
               entao eu retorno ele, o caso em que ele tem um irmão que é uma subárvore à esquerda ou
               a direita e pego o máximo nó folha dela, comparao a distãncia em termos absolutos
            if(parente.dir is None):
                l.append(parente.esq)
                return l
            elif(parente.esq is None):
                l.append(parente.dir)
            else:
                Significa que ele possui os dois lados não nulos
                if(parente.esq==no):
                    td=self.maximo(parente.dir)
                    dist1=abs(parente.dir-vl)
                    dist2=abs(parente.esq-vl)
                    if(dist1>dist2):
                        l.append(parente.esq)
                        return l
                    elif(dist1<dist2):
                        l.append(parente.dir)
                        return l
                    else:
                        l.append(parente.dir)
                        l.append(parente.esq)
                        return l
    Adição de uma funcionalidade para o problema do trabalho 4
       Não deu CERTO !!!!!!!!!!!!!


    def listaNo(self,k,no=RAIZ):
        Eu pesquiso n vl até esbarrar em um nó folha
           quando isto acontecer, eu terei que ver se ele tem irmão não nulo
        l=[]
        no=self.validaNo(no)
        pai=None
        while(no!=None and no.dado!=k):
            pai=no
            if(k<no.dado):
                no=no.esq
            else:
                no=no.dir
        if(pai is None):
            l.append(no)
            return l
        else:
            Irei tratar o caso em que este nó folha não tem irmão para comparar,
               entao eu retorno ele, o caso em que ele tem um irmão que é uma subárvore à esquerda ou
               a direita e pego o máximo nó folha dela, comparao a distãncia em termos absolutos
            if(pai.dir is None):
                l.append(pai.esq)
                return l
            elif(pai.esq is None):
                l.append(pai.dir)
            else:
                Significa que ele possui os dois lados não nulos
                if(pai.esq==no):
                    td=self.maximo(pai.dir)
                    dist1=abs(pai.dir-vl)
                    dist2=abs(pai.esq-vl)
                    if(dist1>dist2):
                        l.append(pai.esq)
                        return l
                    elif(dist1<dist2):
                        l.append(pai.dir)
                        return l
                    else:
                        l.append(pai.dir)
                        l.append(pai.esq)
                        return l'''
    def listaNo(self,vl):
        l=[]
        noAtual=self.raiz
        pai=None
        while(noAtual.dir!=None and noAtual.esq!=None):
            '''O objetivo deste loop é chegar em um nó folha'''
            pai=noAtual
            if(vl>noAtual.dado):
                noAtual=noAtual.dir
            elif(vl<noAtual.dado):
                noAtual=noAtual.esq
            '''else:
                Este é o caso que a gente encontrou o elemento vl, logo o mais próximo é ele mesmo
                l.append(noAtual)
                return l'''
        '''Agora nós sabemos que o noAtual é um folha, e o parente
        que é o pai deles pode ter um filho não nulo diferente do noAtual'''
        if((pai.dir is None) or (pai.esq is None)):
            l.append(noAtual)
            
        else:
            '''Então este pai está com dois filhos, agora precisamos agir diferente'''
            if(pai.dir==noAtual):
                #Mexer aqui rapidão, coloquei o pai como parametro na função de máximo
                noIrmao=self.maximo(pai)

            else:
                #Mexer aqui rapidão, coloquei o pai como parametro na função de mínimo
                noIrmao=self.minimo(pai)
            dist1=abs(vl-noIrmao.dado)
            dist2=abs(vl-noAtual.dado)
            if(dist1>dist2):
                l.append(noAtual)
            
            elif(dist1<dist2):
                l.append(noIrmao)
            
            else:
                if(noAtual.dado>noIrmao.dado):
                    l.append(noIrmao)
                    l.append(noAtual)
                
                else:
                    l.append(noAtual)
                    l.append(noIrmao)
        return l
                
#*********************************

# Casos de teste disponiveis no pdf

#*********************************
#11 22 36 59 26 14 10 29 28 17 70 65 80  Deve me retornar 17 | 11 elementos 22(comparado)
#6 13 36 59 26 14 10 16 Deve me retornar 10 e 16 | 6 elementos  13(comparado)

if __name__=="__main__":
    print("---Projeto 04 Adevan Neves Santos---")
    listaUsuario=input("Digite num de nós | Valor a procurar e | os nós ")
    '''Quardar os dois primeiros valores em variáveis e o resto em uma lista'''
    listaUsuario=listaUsuario.split()
    l=[]
    print(listaUsuario)
    n=int(listaUsuario[0])
    vl=int(listaUsuario[1])
    listaUsuario.remove(str(n))
    listaUsuario.remove(str(vl))
    ''' list comprehension python '''
    listaNos=[int(i) for i in listaUsuario]
    minhaArvore=ArvBinBus(listaNos[0])
    for i in range(1,n):
        
        minhaArvore.inserir(listaNos[i])

    l=minhaArvore.listaNo(vl)
    print("olá")
    ji=len(l)
    print(ji)
    for i in range(ji):
        print(l[i])

    