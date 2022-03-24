def cria_produto(dicionario_estoque):
    for i in range(2):
        nome=input(f"Qual o nome do {i+1} produto: ")
        codigo=input("Qual o codigo: ")
        preco=float(input("Qual o preço: "))
        quantidade=int(input("Qual a quantidade: "))
        dicionario_estoque[f"{codigo}"]=[nome,preco,quantidade]

def mostra_produto(dicionario_estoque):
    print("\n----------------  Relatório de estoque completo ----------\n")
    for produto,lista_info in dicionario_estoque.items():
        print("----------------------------")
        print("Código : ",produto)
        print("Nome : ",lista_info[0])
        print("Preco : ",lista_info[1])
        print("Quantidade : ",lista_info[2])
        print("----------------------------")


def recupera_produto(codigo,dicionario_estoque):
    print("--------------Recupera Produto--------------")
    return dicionario_estoque[codigo]
    print("----------------------------")

dic={}
cria_produto(dic)
mostra_produto(dic)
codigo=input("Insira um código válido no dicionário para pesquisar os atributos do produto: ")
print(recupera_produto(codigo,dic))
