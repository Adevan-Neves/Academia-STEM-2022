from email.mime import message
from tkinter import messagebox
from sistema import *
from tkinter import *



janela = Tk()

tx=Label(janela,text='')

def clicou_inserir():
    textoDoNome=nome.get()
    try:
        idadeInferida=int(idade.get())
        cadastrar_cliente(nome=textoDoNome,idade=idadeInferida)
    except ValueError:
        messagebox.showinfo("Erro de tipo",f"{idade.get()} não pode ser uma idade válida !!!")


def clicou_listar():
    meus_clientes=listar_clientes()
    st=""
    for cliente in meus_clientes:
        st+=f"nome: {cliente[0]} idade:{cliente[1]}\n"
    tx['text']=st
    tx.pack()

janela.title("-- Aplicação Cliente --")

textNome=Label(janela, text="Nome")
textNome.pack()

nome=Entry(janela,font="arial 12 bold",bd =5)
nome.pack()

textIdade=Label(janela, text="Idade")
textIdade.pack()

idade=Entry(janela,font="arial 12 bold",bd =5)
idade.pack()

botao_inserir=Button(janela,text="Insira",bg="green",fg="blue",command=clicou_inserir)
botao_inserir.pack()

botao_listar=Button(janela,text="Listar",bg="blue",fg="black",command=clicou_listar)
botao_listar.pack()

botao_sair=Button(janela,text="Sair",bg="red",fg="black",command=janela.quit)
botao_sair.pack()



janela.mainloop()