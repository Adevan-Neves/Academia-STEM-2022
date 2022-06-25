class NoRaiz:
    '''Uma arvore avl pode ser definida como um nó raiz e seus filhos, formada internamente
    por seus nós e filhos de maneira recursiva, de modo que precisamos somente saber onde se localiza
    a raiz de cada árvore'''
    def __init__(self, dado):
        self.dado = dado
        self.muda_filhos(None, None)



    def muda_filhos(self, esquerda, direita):
        self.direita = direita
        self.esquerda = esquerda


    def balanco(self):
        profundidadeEsquerda = 0
        if self.esquerda:
            profundidadeEsquerda = self.esquerda.profundidade()
        profundidadeDireita = 0
        if self.direita:
            profundidadeDireita = self.direita.profundidade()
        return profundidadeEsquerda - profundidadeDireita





    def profundidade(self):
        profundidadeEsquerda = 0
        if self.esquerda:
            profundidadeEsquerda = self.esquerda.profundidade()
        profundidadeDireita = 0
        if self.direita:
            profundidadeDireita = self.direita.profundidade()
        return 1 + max(profundidadeEsquerda, profundidadeDireita)

    def rotacaoEsquerda(self):
        self.dado, self.direita.dado = self.direita.dado, self.dado
        antigaEsquerda = self.esquerda
        self.muda_filhos(self.direita, self.direita.direita)
        self.esquerda.muda_filhos(antigaEsquerda, self.esquerda.esquerda)

    def rotacaoDireita(self):
        self.dado, self.esquerda.dado = self.esquerda.dado, self.dado
        antigaDireita = self.direita
        self.muda_filhos(self.esquerda.esquerda, self.esquerda)
        self.direita.muda_filhos(self.direita.direita, antigaDireita)

    def rotacaoEsquerdaDireita(self):
        self.esquerda.rotacaoEsquerda()
        self.rotacaoDireita()

    def rotacaoDireitaEsquerda(self):
        self.direita.rotacaoDireita()
        self.rotacaoEsquerda()



    def executaBalanco(self):
        bal = self.balanco()
        if bal > 1:
            if self.esquerda.balanco() > 0:
                self.rotacaoDireita()
            else:
                self.rotacaoEsquerdaDireita()
        elif bal < -1:
            if self.direita.balanco() < 0:
                self.rotacaoEsquerda()
            else:
                self.rotacaoDireitaEsquerda()



    def insere(self, dado):
        #Mexi no menor igual aqui
        if dado < self.dado:
            if not self.esquerda:
                self.esquerda = NoRaiz(dado)
            else:
                self.esquerda.insere(dado)
        else:
            if not self.direita:
                self.direita = NoRaiz(dado)
            else:
                self.direita.insere(dado)
        self.executaBalanco()

    def inOrdem(self,no):
        if(no is not None):
            self.inOrdem(no.esquerda)
            print(no.dado)
            self.inOrdem(no.direita)

    
    def minimo(self,no):
        #O minímo de uma árvore de busca binária será sempre o nó mais à esquerda da árvore
        
        if(no is None):
            return None
        else:
            while(no.esquerda!=None):
                no=no.esquerda
            return no
    

    
    def remover(self, k, node):       
        if node is None:    
            return node       
        if k < node.dado:
            node.esquerda = self.remover(k, node.esquerda)        
        elif k > node.dado:
            node.direita = self.remover(k, node.direita)      
        else:
            if node.esquerda is None:
                return node.direita
            elif node.direita is None:
                return node.esquerda
            else:               
                subs = self.minimo(node.direita)               
                node.dado = subs.dado               
                node.direita = self.remover(subs.dado, node.direita)
        return node 
    

l=int(input("Digite o número N de elementos no nó: "))
