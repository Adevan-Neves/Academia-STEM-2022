from os import times
from random import randint
from datetime import date, timedelta
import pickle

'''class Adm:
    pass
        
class Time:
    pass

class Campeonato:
    pass

class Partida:
    pass

class Agenda:
    pass'''
PATH_DATABASE='database.pck'

class Adm:
    def __init__(self,path_database=PATH_DATABASE):
        self.path_database=path_database
    
    def cadastra_campeonato(self,campeonato):      
        novo=self.recupera_dados()
        novo[f'{campeonato.nome}']=campeonato
        self.salva_dados(novo)
    
    def recupera_dados(self):
        # Um arquivo .pck
        dados={}
        try:
            with open(f'{self.path_database}','rb') as fp:
                dados=pickle.load(fp)
        except:
            print("")
        
        return dados
    
    def salva_dados(self,dados):
        # Um arquivo .pck
        try:
            with open(f'{self.path_database}','wb') as fp:
                pickle.dump(dados,fp)
        except:
            print("")

    def lista_partidas(self,nome_campeonato):
        self.recupera_dados()[f'{nome_campeonato}'].simular_partida()
        return self.recupera_dados()[f'{nome_campeonato}'].get_partidas()
    
    def mostrar_times(self,nome_campeonato):
        return self.recupera_dados()[f'{nome_campeonato}'].get_times()

    def mostrar_resultados(self,nome_campeonato):
        self.recupera_dados()[f'{nome_campeonato}'].simular_partida()
        return self.recupera_dados()[f'{nome_campeonato}'].get_resultados()
    
    def mostrar_vencedor(self,nome_campeonato):
        self.recupera_dados()[f'{nome_campeonato}'].simular_partida()
        return self.recupera_dados()[f'{nome_campeonato}'].vencedor

    def cadastrar_times(self,nome_campeonato,time):
        
        # Representa a regra de negócio que um time não pode se inscrever
        # em um campeonato que já começou
        novo=self.recupera_dados()[f'{nome_campeonato}'].add_time(time)
        self.salva_dados(novo)
    
    def get_campeonato(self,nome_campeonato):
        return self.recupera_dados()[f'{nome_campeonato}']


class Campeonato:
    def __init__(self,nome,data_inicio):
        self.nome=nome
        self.data_inicio=data_inicio
        self.times=[]
        self.partidas=[]
        self.vencedor=None

    def get_partidas(self):
        return self.partidas

    
    def simular_partida(self):
        #Todos os meus times estão em self.times (tipo lista)
        #Cada time deve jogar com todos os times e eu devo acrescentar no número de pontos para cada time
        data=self.data_inicio
        n=len(self.times)
        for i in range(n):
            time_casa=self.times[i]
            for time_visitante in self.times:
                if(time_casa.nome!=time_visitante.nome):
                    partida=Partida()
                    partida.abrir_confronto(time_casa,time_visitante,data)
                    data=data + timedelta(days = 1)
                    self.partidas.append(partida)
        #Tá Faltando definir o ganhador
        n=len(self.times)
        ganhador=self.times[0]
        for i in range(1,n):
            if(self.times[i].pontos>ganhador.pontos):
                ganhador=self.times[i]
        self.vencedor=ganhador


    def get_times(self):
        return self.times

    def get_resultados(self):
        l=[]
        for partida in self.partidas:
            l.append(partida.resultado)
        return l

    def add_time(self,time):
        self.times.append(time)


class Time:
    def __init__(self,nome,n_jogadores,estrelas=1):
        self.nome=nome
        self.n_jogadores=n_jogadores
        self.estrelas=estrelas
        self.pontos=0

    def jogar(self):
        return randint(0,self.estrelas)
        
    def atualiza_pontos(self,ponto):
        self.pontos+=ponto

class Partida:
    def __init__(self):
        self.resultado=''
    def abrir_confronto(self,time1,time2,data):
        golstime1=time1.jogar()
        golstime2=time2.jogar()
        if(golstime1>golstime2):
            #Time 1 ganhou
            time1.atualiza_pontos(3)
            time2.atualiza_pontos(0)
        elif(golstime1<golstime2):
            #Time 2 ganhou
            time2.atualiza_pontos(3)
            time1.atualiza_pontos(0)
        else:
            #Os times empataram
            time1.atualiza_pontos(1)
            time2.atualiza_pontos(1)
        self.resultado=f"{time1.nome}{golstime1} X {golstime2}{time2.nome} ||{data}||"