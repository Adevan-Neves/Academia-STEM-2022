import tkinter as ttk
from tkinter import *
from tkinter import messagebox
from futebol import cadastrar_campeonato, cadastrar_time

    
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

    cad = lambda  : cadastrar_campeonato(e1.get(),[int(dia.get()),int(mes.get()),int(ano.get())])

    botao1=ttk.Button(root, text='Menu Principal',command=root.destroy)
    botao1.place(x=300,y=350,width=180,height=25)

    botao2=ttk.Button(root, text='Cadastrar',command=cad)
    botao2.place(x=300,y=300,width=180,height=25)


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

    cad = lambda : cadastrar_time(e2.get(),e1.get(),int(e4.get()),int(e3.get()))

    botao1=ttk.Button(root, text='Menu Principal',command=root.destroy)
    botao1.place(x=300,y=320,width=180,height=25)

    botao2=ttk.Button(root, text='Cadastrar',command=cad)
    botao2.place(x=300,y=320,width=180,height=25)
    
    
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

