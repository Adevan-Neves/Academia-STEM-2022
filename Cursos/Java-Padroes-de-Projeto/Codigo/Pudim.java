package FactoryAbstract.Codigo;

public class Pudim implements Doces{
    private boolean tenhoConfeite = false;
    private String[] recheioIngredientes = {"Leite condensado","Ameixa","Áçucar Derretido","Trigo"};
    private String formatoOriginal="Disco Vazado no Interior";
    private String tipoDeCalda = "Áçucar Derretido";
    private String chocolate="Não tem";

    @Override
    public boolean temConfeite() {
        return this.tenhoConfeite;
    }
    @Override
    public String[] recheios() {
        return this.recheioIngredientes;
    }
    @Override
    public String tipoDeChocolate() {
        return this.chocolate;
    }
    @Override
    public void preparar() {
        System.out.println("Derrete áçucar..\nPrepara a massa do pudim..\nAssa o pudim...\nColoca a calda...\nColoca a ameixa...\nFim\nSeu pudim está pronto\n");
    }
    public String getFormatoOriginal() {
        return formatoOriginal;
    }
    public String getTipoDeCalda() {
        return tipoDeCalda;
    }
    
}
