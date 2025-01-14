import os
import json
from random import randint
from time import time


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

def cadastrar_time(nome_campeonato,nome_time,n_jogadores=11,estrelas=1,pontos=0,gols_marcados=0):
    time={}
    time[f'{nome_time}']={'estrelas':estrelas,'pontos':pontos,'n_jogadores':n_jogadores,'gols_marcados':gols_marcados}
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
            return (campeonato[nome_campeonato]['resultados'])

def mostrar_resultado_time(nome_campeonato,nome_time):
    lista_resultado=mostrar_resultado(nome_campeonato)
    resultados_time=[]
    for resultado in lista_resultado:
        if(nome_time in resultado):
            resultados_time.append(resultado)
    
    return resultados_time

def mostrar_vencedor(nome_campeonato):
    di=recuperar_dados()
    for campeonato in di:
        if nome_campeonato in campeonato:
            if(len(campeonato[nome_campeonato]['times'])==0):
                return None
            
            times=campeonato[nome_campeonato]['times']
            n=len(times)
            
            vencedor=times[0]
            for i in range(1,n):
                if (times[i][list(times[i].keys())[0]]['pontos']>vencedor[list(vencedor.keys())[0]]['pontos'] or times[i][list(times[i].keys())[0]]['gols_marcados']>vencedor[list(vencedor.keys())[0]]['gols_marcados']):
                    vencedor=times[i]

            return str(list(vencedor.keys())[0])

def simular_campeonato(nome_campeonato):
    di=recuperar_dados()
    if(not len(di)==0):
        for campeonato in di:
            if nome_campeonato in campeonato:
                
                n=len(campeonato[nome_campeonato]['times'])
                
                for i in range(n):
                    time_atual=campeonato[nome_campeonato]['times'][i]
                    for time_adv in campeonato[nome_campeonato]['times']:
                        if(time_atual.keys()!=time_adv.keys()):
                            
                            gols_time_atual=fazer_gols(time_atual)
                            gols_time_adv=fazer_gols(time_adv)

                            #Adicionando os gols ao saldo de gols de cada time
                            time_atual[list(time_atual.keys())[0]]['gols_marcados']+=gols_time_atual
                            time_adv[list(time_adv.keys())[0]]['gols_marcados']+=gols_time_adv

                            if(gols_time_atual>gols_time_adv):
                                
                                time_atual[list(time_atual.keys())[0]]['pontos']+=3
                                time_adv[list(time_adv.keys())[0]]['pontos']+=0


                            elif(gols_time_atual<gols_time_adv):
                                
                                time_adv[list(time_adv.keys())[0]]['pontos']+=3
                                time_atual[list(time_atual.keys())[0]]['pontos']+=0
                            else:
                                
                                time_atual[list(time_atual.keys())[0]]['pontos']+=1
                                time_adv[list(time_adv.keys())[0]]['pontos']+=1

                            
                            campeonato[list(campeonato.keys())[0]]['resultados'].append(f'{list(time_atual.keys())[0]} {gols_time_atual} x {gols_time_adv} {list(time_adv.keys())[0]}')
                salvar_dados(di)

                            
def listar_time(nome_campeonato):
    di=recuperar_dados()
    for campeonato in di:
        if nome_campeonato in campeonato:
            return campeonato[nome_campeonato]['times']

def listar_campeonato(nome_campeonato):
    di=recuperar_dados()
    for campeonato in di:
        if nome_campeonato in campeonato:
            return campeonato

def fazer_gols(time):
    l=time[list(time.keys())[0]]['estrelas']
    return randint(0,l)

def recupera_times_tabela(nome_campeonato):
    simular_campeonato(nome_campeonato)    

    times=listar_time(nome_campeonato)
    tabela=[]
    for time in times:
        for k,v in time.items():
            tp=(k,v["pontos"])
            tabela.append(tp)
    return sorted(tabela,key=lambda item : item[1],reverse=True)

def mostrar_todos_campeonatos():
    di=recuperar_dados()
    l=[]
    for campeonato in di:
        nome_campeonato=list(campeonato.keys())[0]
        l.append(nome_campeonato)
    return l


