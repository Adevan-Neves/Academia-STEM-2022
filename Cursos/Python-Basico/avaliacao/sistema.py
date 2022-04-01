import json
def cadastrar_cliente(nome,idade):
    with open('database.json','r') as fp:
        dic=json.load(fp)
        dic["clientes"].append([nome,idade])
    with open('database.json','w') as fp:
        json.dump(dic,fp,indent=2)

def listar_clientes():
    with open('database.json','r') as fp:
        dic=json.load(fp)
        for k,v in dic.items():
            return v