import os
import json
from datetime import date
from random import randint

DATABASE_GERAL="database_geral.json"

def recuperar_dados():
    dados=[]
    if(os.path.isfile(DATABASE_GERAL)):
        with open(DATABASE_GERAL,'r') as fp:
            dados=json.load(fp)
            if(dados==None):
                dados=[]
    return dados

def salvar_dados(dados):
    with open(DATABASE_GERAL,'w') as fp:
            json.dump(dados,fp,indent=4)

def cadastrar_campeonato(nome,data_inicio):
    campeonato={}
    campeonato[f'{nome}']={'inicio':data_inicio,'times':[],'resultados':[]}
    di=recuperar_dados()
    di.append(campeonato)
    salvar_dados(di)

def cadastrar_time(nome_campeonato,nome_time,estrelas=1,pontos=0):
    time={}
    time[f'{nome_time}']={'estrelas':estrelas,'pontos':pontos}
    di=recuperar_dados()
    for campeonato in di:
        if nome_campeonato in campeonato:
            campeonato[nome_campeonato]['times'].append(time)
            break
    salvar_dados(di)


def mostrar_resultado(nome_campeonato):
    di=recuperar_dados()
    for campeonato in di:
        if nome_campeonato in campeonato:
            return campeonato[nome_campeonato]['resultados']

def mostrar_vencedor(nome_campeonato):
    di=recuperar_dados()
    for campeonato in di:
        if nome_campeonato in campeonato:
            if(len(campeonato[nome_campeonato]['times'])==0):
                return None
            
            # Preciso percorrer todos os elementos da parte de times procurando o maior pontuador
            # {"nome do time":{'estrelas':2,'pontos':12}}
            times=campeonato[nome_campeonato]['times']
            n=len(times)
            #Agora tenho uma lista de times
            vencedor=times[0]
            for i in range(1,n):
                if times[i].values()[1]>vencedor.values()[1]:
                    vencedor=times[i]

            return vencedor

def simular_campeonato(nome_campeonato):
    di=recuperar_dados()
    if(not len(di)==0):
        for campeonato in di:
            if nome_campeonato in campeonato:
                #Simular os times todos aqui
                #Peque um time, faz ele jogar contra todos e depois atualiza
                n=len(campeonato[nome_campeonato]['times'])
                #Estou com o tamanho da lista de todos os times
                for i in range(n):
                    time_atual=campeonato[nome_campeonato]['times'][i]
                    for time_adv in campeonato[nome_campeonato]['times']:
                        if(time_atual.keys()!=time_adv.keys()):
                            #simular propriamente a partida
                            gols_time_atual=fazer_gols(time_atual)
                            gols_time_adv=fazer_gols(time_adv)
                            if(gols_time_atual>gols_time_adv):
                                #Time atual ganhou
                                time_atual[list(time_atual.keys())[0]]['pontos']+=3
                                time_adv[list(time_adv.keys())[0]]['pontos']+=0


                            elif(gols_time_atual<gols_time_adv):
                                #Time adversário ganhou
                                time_adv[list(time_adv.keys())[0]]['pontos']+=3
                                time_atual[list(time_atual.keys())[0]]['pontos']+=0
                            else:
                                #Os times empataram
                                time_atual[list(time_atual.keys())[0]]['pontos']+=1
                                time_adv[list(time_adv.keys())[0]]['pontos']+=1

                            #Adiciona o resultado desta partida na lista de resultados do
                            #campeonato
                            #Coloca esse debaixo caso sua tentativa der erro
                            #campeonato[list(campeonato.keys())[0]]['resultados'].append(f'{time_atual[list(time_atual.keys())[0]]} {gols_time_atual} x {time_adv[list(time_adv.keys())[0]]} {gols_time_adv}')
                            campeonato[list(campeonato.keys())[0]]['resultados'].append(f'{list(time_atual.keys())[0]} {gols_time_atual} x {gols_time_adv} {list(time_adv.keys())[0]} ')
        salvar_dados(di)

                            
def listar_time(nome_campeonato):
    di=recuperar_dados()
    for campeonato in di:
        if nome_campeonato in campeonato:
            return campeonato[nome_campeonato]['times']

def listar_campeonato(nome_campeonato):
    di=recuperar_dados()
    al=di[nome_campeonato]
    return al

def fazer_gols(time):
    l=time[list(time.keys())[0]]['estrelas']
    return randint(0,l)


cadastrar_campeonato("Brasileirao",12)

cadastrar_time("Brasileirao","Flamengo")
cadastrar_time("Brasileirao","Salvador")

cadastrar_campeonato("Copa do Brasil",16)

cadastrar_time("Copa do Brasil","Ribeirao")
cadastrar_time("Copa do Brasil","Botafogo")

cadastrar_campeonato("Liga dos Campeoes",19)

cadastrar_time("Liga dos Campeoes","Real Madrid")
cadastrar_time("Liga dos Campeoes","Liverpool")
cadastrar_time("Liga dos Campeoes","Madureira")


simular_campeonato("Liga dos Campeoes")
simular_campeonato("Copa do Brasil")
simular_campeonato("Brasileirao")