from futebol import *

cadastrar_campeonato("Liga dos campeoes",[15,20,20])

cadastrar_time("Liga dos campeoes","Juventus",4,3)
cadastrar_time("Liga dos campeoes","Fortaleza",18,2)


cadastrar_campeonato("Libertadores",[15,20,20])


cadastrar_time("Libertadores","Corinthias",9,1)
cadastrar_time("Libertadores","Salvador",1,3)
cadastrar_time("Libertadores","Manaus",4)
cadastrar_time("Libertadores","Vasco",23,5)


simular_campeonato("Liga dos campeoes")
simular_campeonato("Libertadores")

print(mostrar_resultado("Liga dos campeoes"))
print(mostrar_resultado("Libertadores"))

print(mostrar_vencedor("Liga dos campeoes"))
print(mostrar_vencedor("Libertadores"))

print(listar_time("Liga dos campeoes"))
print(listar_time("Libertadores"))

print(listar_campeonato("Liga dos campeoes"))
print(listar_campeonato("Libertadores"))