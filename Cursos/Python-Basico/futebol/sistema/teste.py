from models import *

c1=Campeonato("Brasileirão",date(2022,3,25))
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
adm.cadastrar_times("Brasileirão",t1)
adm.cadastrar_times("Brasileirão",t2)
adm.cadastrar_times("Brasileirão",t3)
adm.cadastrar_times("Brasileirão",t4)
with open('database.pck','rb') as fp:
    l=pickle.load(fp)
    print(l)



adm.cadastra_campeonato(c2)


adm.cadastra_campeonato(c3)



print(adm.mostrar_resultados("Brasileirão"))