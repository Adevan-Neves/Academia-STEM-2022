''' Uma lista ligada possui um ciclo se algum n´o (valor) ´e visitado mais do que uma vez enquanto se
percorre a lista. Dado um ponteiro para o head de uma lista ligada, escreva um programa em
Python para testar se a lista possui um ciclo. Se houver um ciclo, o programa dever´a retornar 1.
Caso contr´ario, dever´a retornar 0. 

A lista L1 = 1 → 2 → 3 → null n˜ao tem ciclos. Portanto, o programa dever´a retornar 0.
A lista L2 = 1 → 2 → 3 → 1 → null tem um ciclo, pois o n´o 3 tem um valor anterior (1) da lista.
Portanto, o programa dever´a retornar 1.

O programa dever´a ter, obrigatoriamente, uma fun¸c˜ao de nome testaCiclo (head) que receber´a
o ponteiro para o primeiro elemento da lista e retornar o valor 1 (h´a ciclo) ou 0 (n˜ao h´a ciclo).
N˜ao ´e permitido o uso de arrays e nem o tipo List de Python.  '''

class Nodo():
	def __init__(self,dado):
		self.dado=dado
		self.prox=None
		
class ListaLigada():
	def __init__(self):
		self.head=None
		self.size=0
		
	def insere(self,novoNo):
		if self.head:
			pont=self.head
			while(pont.prox):
				pont=pont.prox
			pont.prox=novoNo
			
		else:
			self.head=novoNo
			
		self.size+=1	
	def tam(self):
		return self.size
		
	def pesq(self,elem):
		cont=0
		pont=self.head
		for i in range(self.size):
			if(pont.dado==elem):
				cont+=1	
			pont=pont.prox
		return cont

# Definir funcão testaCiclo

def testaCiclo(lv,n):
	comp=lv.head
	for i in range(n):
		resp=lv.pesq(comp.dado)
		if(resp>1):
			return 1
		comp=comp.prox
	return 0

lv=ListaLigada()
n=int(input())
for i in range(n):
	elem=int(input())
	nodo=Nodo(elem)
	
	lv.insere(nodo)
	
a=testaCiclo(lv,n)
print(a)	