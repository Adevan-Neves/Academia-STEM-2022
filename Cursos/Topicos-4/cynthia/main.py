import pdfplumber
import pandas as pd
import numpy as np
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
import os
import time

tp2percent=6.25
dirPdfAmazonia = "pdfAmazonia"
dirExata = "exata"
dirTrescal = "trescal"

def pegarListaPdfs(nomeDiretorio):
    return [os.path.join(nomeDiretorio, f) for f in os.listdir(nomeDiretorio) if f.endswith('.pdf')]

def processarPdf(nomePdf,nomeEmpresa):
    with pdfplumber.open(nomePdf) as arquivoPdf:
        tabelaResultado = pd.DataFrame()
        if(nomeEmpresa=="pdfAmazonia"):
            first_page = arquivoPdf.pages[0]
            tables = first_page.extract_tables()
            if len(tables) >= 3:
                tabelaResultado = pd.DataFrame(tables[2])
                tabelaResultado.columns = tabelaResultado.iloc[0]
                tabelaResultado = tabelaResultado[1:]
                tabelaResultado = tabelaResultado.map(lambda x: float(str(x).replace(',', '.')))
                tabelaResultado = tabelaResultado.rename(columns={"V.V.C":"VVC", "M.V.C":"MIT", "\"Ue\"":"IM"})
                tabelaResultado = tabelaResultado.drop(columns=["I.H","D.M","D.P",])
        elif(nomeEmpresa=="exata"):
            first_page = arquivoPdf.pages[0]
            tables = first_page.extract_tables()
            if len(tables) >= 2:
               tabelaResultado = pd.DataFrame(tables[1])
               tabelaResultado = tabelaResultado.drop(index=[1, len(tabelaResultado)-1])
               tabelaResultado.columns = tabelaResultado.iloc[0]
               tabelaResultado = tabelaResultado[1:]
               tabelaResultado = tabelaResultado.map(lambda x: float(str(x).replace(',', '.')))
               tabelaResultado = tabelaResultado.rename(columns={"V.V.C.":"VVC","V.I": "MIT","I.M.":"IM"})
               tabelaResultado = tabelaResultado.drop(columns=["Erro","Veff","K"])
        else:
            #Trescal
            second_page = arquivoPdf.pages[1]
            tables = second_page.extract_tables()
            if(len(tables)>=1):
                tabelaResultado = pd.DataFrame(tables[0])
                tabelaResultado = tabelaResultado.drop(index=[0])
                tabelaResultado.columns = tabelaResultado.iloc[0]
                tabelaResultado = tabelaResultado[1:]
                tabelaResultado = tabelaResultado.rename(columns={"VRef - Média de\n4 Leituras":"VVC","VI - Média de 4\nLeituras": "MIT","Incerteza\nExpandida":"IM"})
                tabelaResultado = tabelaResultado.drop(columns=["Profundidade de\nImersão\n(mm):","Unidade de\nMedida","k","Veff","Erro"])
                tabelaResultado = tabelaResultado.map(lambda x: float(str(x).replace(',', '.')))

        tabelaResultado["D.M"] = abs(tabelaResultado["VVC"]-tabelaResultado["MIT"])
        tabelaResultado["ITM"] = tabelaResultado["D.M"] + tabelaResultado["IM"]
        tabelaResultado["IMT%"] = ((tabelaResultado["IM"]+tabelaResultado["D.M"])/tabelaResultado["VVC"])*100
        tabelaResultado["TP/2%"] = [tp2percent] * len(tabelaResultado)
        tabelaResultado["ITM <= TP/2"] = np.where(tabelaResultado["TP/2%"] >= tabelaResultado["IMT%"], "OK", "NG")

        ng_count = (tabelaResultado["ITM <= TP/2"] == "NG").sum()
        if ng_count == 0:
            resultado = "Equipamento aprovado"
        elif ng_count <= 2:
            resultado = "Aprovado com restrição"
        else:
            resultado = "Equipamento reprovado"

        output_pdf_name = nomePdf.replace(".pdf", " Resultado analise.pdf")
        c = canvas.Canvas(output_pdf_name, pagesize=letter)
        c.setFont("Helvetica", 12)
        c.drawString(100, 750, f"Resultado da análise: {resultado}")
        c.drawString(100, 730, f"Arquivo analisado: {nomePdf}")
        c.drawString(100, 700, "Resumo da análise:")
        c.drawString(120, 680, f"Faixas OK: {len(tabelaResultado) - ng_count}")
        c.drawString(120, 660, f"Faixas NG: {ng_count}")

        c.save()

start_time = time.time()

lista_pdfs_pdfAmazonia = pegarListaPdfs(dirPdfAmazonia)
lista_pdfs_exata = pegarListaPdfs(dirExata)
lista_pdfs_trescal = pegarListaPdfs(dirTrescal)

for pdf in lista_pdfs_pdfAmazonia:
    processarPdf(pdf,dirPdfAmazonia)
for pdf in lista_pdfs_exata:
    processarPdf(pdf,dirExata)
for pdf in lista_pdfs_trescal:
    processarPdf(pdf, dirTrescal)

end_time = time.time()

print(f"Tempo de execução: {end_time - start_time:.5f} segundos")
