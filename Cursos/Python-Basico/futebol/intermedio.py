import os
import json
from random import randint
import tkinter as ttk
from tkinter import *
from tkinter import messagebox

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

def cadastrar_time(nome_campeonato,nome_time,n_jogadores=11,estrelas=1,pontos=0):
    time={}
    time[f'{nome_time}']={'estrelas':estrelas,'pontos':pontos,'n_jogadores':n_jogadores}
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
            
            times=campeonato[nome_campeonato]['times']
            n=len(times)
            
            vencedor=times[0]
            for i in range(1,n):
                if times[i][list(times[i].keys())[0]]['pontos']>vencedor[list(vencedor.keys())[0]]['pontos']:
                    vencedor=times[i]

            return vencedor

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
                            if(gols_time_atual>gols_time_adv):
                                
                                time_atual[list(time_atual.keys())[0]]['pontos']+=3
                                time_adv[list(time_adv.keys())[0]]['pontos']+=0


                            elif(gols_time_atual<gols_time_adv):
                                
                                time_adv[list(time_adv.keys())[0]]['pontos']+=3
                                time_atual[list(time_atual.keys())[0]]['pontos']+=0
                            else:
                                
                                time_atual[list(time_atual.keys())[0]]['pontos']+=1
                                time_adv[list(time_adv.keys())[0]]['pontos']+=1

                            
                            campeonato[list(campeonato.keys())[0]]['resultados'].append(f'{list(time_atual.keys())[0]} {gols_time_atual} x {gols_time_adv} {list(time_adv.keys())[0]} {randint(1,30)}/{randint(1,3)}/2022')
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





    
def cadastrarCampeonato():
    root=Tk()
    root.geometry('800x400')
    legenda1= Label(root,text='Cadastrar Campeonato', font=('Bebas Neue',14),padx=25,pady=10)
    legenda1.place(x=270,y=50)
    root.title('Organizador de Campeonatos')

    legenda2=Label(root,text='Insira o nome do campeonato:',font=('Bebas Neue',14),padx=25,pady=10)
    legenda2.place(x=75,y=100)
    e1=Entry(root,width=50)
    e1.place(x=50,y=150)
    
    
    legenda3=Label(root,text='Em qual dia o campeonato terá início?',font=('Bebas Neue',14),padx=25,pady=10)
    legenda3.place(x=20,y=200)
    dia=Entry(root,width=50)
    dia.place(x=50,y=250)
    
    legenda4=Label(root,text='Em qual mês?',font=('Bebas Neue',14),padx=25,pady=10)
    legenda4.place(x=500,y=100)
    mes=Entry(root,width=50)
    mes.place(x=450,y=150)
    
    legenda5=Label(root,text='Em qual ano?',font=('Bebas Neue',14),padx=25,pady=10)
    legenda5.place(x=500,y=200)
    ano=Entry(root,width=50)
    ano.place(x=450,y=250)

    

    botao1=ttk.Button(root, text='Menu Principal',command=root.destroy)
    botao1.place(x=300,y=300,width=180,height=25)

    botao2=ttk.Button(root, text='Cadastrar',command=cadastrar_campeonato(e1.get(),[int(dia.get()),int(mes.get()),int(ano.get())]))
    botao2.place(x=300,y=340,width=180,height=25)


    root.mainloop()

def cadastrarTime():
    root=Tk()
    root.geometry('800x400')
    legenda1= Label(root,text='Cadastrar Time', font=('Bebas Neue',14),padx=25,pady=10)
    legenda1.place(x=300,y=50)
    root.title('Organizador de Campeonatos')

    legenda2=Label(root,text='Insira o nome do time:',font=('Bebas Neue',14),padx=25,pady=10)
    legenda2.place(x=75,y=100)
    e1=Entry(root,width=50)
    e1.place(x=50,y=150)
    
    legenda3=Label(root,text='Em qual campeonato o time irá jogar?',font=('Bebas Neue',14),padx=25,pady=10)
    legenda3.place(x=20,y=200)
    e2=Entry(root,width=50)
    e2.place(x=50,y=250)
    
    legenda4=Label(root,text='Qual é o nível de força(estrelas) do time?',font=('Bebas Neue',14),padx=25,pady=10)
    legenda6=Label(root,text='Insira um número de 1 a 5',font=("Courier", 8, "italic"),padx=10,pady=5)
    legenda4.place(x=400,y=100)
    legenda6.place(x=500,y=170)
    e3=Entry(root,width=50)
    e3.place(x=450,y=150)
    
    legenda5=Label(root,text='Quantos jogadores têm no time?',font=('Bebas Neue',14),padx=25,pady=10)
    legenda5.place(x=425,y=200)
    e4=Entry(root,width=50)
    e4.place(x=450,y=250)

    botao1=ttk.Button(root, text='Menu Principal',command=root.destroy)
    botao1.place(x=300,y=320,width=180,height=25)

    if(e4.getint()<=11):
        messagebox.messagebox.showinfo("Erro de configuração","O número de jogadores deve ser maior que 11")
    
    
    root.mainloop()

def mostrarResultados():
    return

def mostrarTimes():
    return

def mostrarCampeonatos():
    return

def simularCampeonato():
    return
    
def menuPrincipal():
    root=Tk()
    root.geometry('800x400')
    legenda= Label(root,text='Organizador de Campeonatos', font=('Bebas Neue',14),padx=25,pady=10)
    legenda.place(x=240,y=50)
    root.title('Organizador de Campeonatos')

    imagem=PhotoImage(file="iconeSistema.png")
    figura1=Label(root,image=imagem)
    figura1.place(x=265,y=90)

    
    
    botao1=ttk.Button(root, text='Cadastrar Campeonato',command=cadastrarCampeonato)
    botao2=ttk.Button(root, text='Cadastrar Time',command=cadastrarTime)
    botao3=ttk.Button(root, text='Simular Campeonato',command=simularCampeonato)
    botao4=ttk.Button(root, text='Mostrar Resultados dos Jogos',command=mostrarResultados)
    botao5=ttk.Button(root, text='Mostrar Times',command=mostrarTimes)
    botao6=ttk.Button(root, text='Mostrar Campeonatos',command=mostrarCampeonatos)
    botao1.place(x=50,y=150,width=180,height=25)
    botao2.place(x=550,y=150,width=180,height=25)
    botao3.place(x=50,y=200,width=180,height=25)
    botao4.place(x=550,y=200,width=180,height=25)
    botao5.place(x=50,y=250,width=180,height=25)
    botao6.place(x=550,y=250,width=180,height=25)

    botaoFechar=ttk.Button(root, text='Fechar Sistema',command=root.destroy)
    botaoFechar.place(x=300,y=320,width=180,height=25)
    
    root.mainloop()
menuPrincipal()