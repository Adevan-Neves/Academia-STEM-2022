from models import *

c1=Campeonato("Brasileirao",date(2022,3,25))
c1.nome='Brasileirao'
c1.data_inicio=date(2022,3,25)
c2=Campeonato("Copa do Brasil",date.today())#Esse não vai conseguir cadastrar time nenhum
c3=Campeonato("Liga dos Campeões",date(2022,4,15))

t1=Time("Flamengo",12,4)
t2=Time("Corinthias",11,3)
t3=Time("Cruzeiro",12,2)
t4=Time("Atlético",12,2)
t5=Time("Salvador FC",12,3)
t6=Time("Ponte Preta",12,1)
t7=Time("Armação",12)
t8=Time("Fluminense",12,5)

adm=Adm()
adm.cadastra_campeonato(c1)
adm.cadastrar_times("Brasileirao",t1)
adm.cadastrar_times("Brasileirao",t2)
adm.cadastrar_times("Brasileirao",t3)
adm.cadastrar_times("Brasileirao",t4)
print(adm.mostrar_times("Brasileirao"))
adm.get_campeonato("Brasileirao").simular_partida()