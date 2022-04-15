from random import randint
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

class Adm:
    def __init__(self,path_database):
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
            print("Não há arquivo database.pck !")
        
        return dados
    
    def salva_dados(self,dados):
        # Um arquivo .pck
        try:
            with open(f'{self.path_database}','wb') as fp:
                pickle.dump(dados,fp)
        except:
            print("Não há arquivo database.pck !")

    def lista_partidas(self,nome_campeonato):
        return self.recupera_dados()[f"{nome_campeonato}"].get_partidas()


class Campeonato:
    def __init__(self,nome,data_inicio):
        self.nome=nome
        self.data_inicio=data_inicio
        self.times=[]
        self.agenda=None

    def get_partidas(self):
        return self.agenda.partidas

    def simular_partida():
        pass



class Time:
    def __init__(self,nome,n_jogadores,estrelas=1):
        self.nome=nome
        self.n_jogadores=n_jogadores
        self.estrelas=estrelas

    def jogar(self):
        return randint(0,self.estrelas)
    
    def adicionar_jogador(self):
        self.n_jogadores+=1