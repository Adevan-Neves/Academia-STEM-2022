package FactoryAbstract.Codigo;

public class BoloDeChocolate implements Doces {
    private boolean tenhoConfeite= true;
    private String[] recheioIngredientes= {"Chocolante 40% cacau","Confeite Colorido","Raspas de limão",};
    private String formatoOriginal = "Cilíndrico";
    private float preco = 34.00F;

    @Override
    public boolean temConfeite() {
        return this.tenhoConfeite;
    }
    @Override
    public String tipoDeChocolate() {
        return this.recheioIngredientes[0];
    }
    @Override
    public void preparar() {
        System.out.println("Fazendo a massa...\nColocando o fermento...\nAdicionando Cacau 40%...\nAssando o bolo...\nColocando o confeite colorido...\nAdicionando raspas de limão...\nFim. Seu bolo de chocolate está pronto, Bomd apetite !!!!");
    }
    @Override
    public String[] recheios() {
        return this.recheioIngredientes;
    }
    public String getFormatoOriginal() {
        return formatoOriginal;
    }
    public float getPreco() {
        return preco;
    }
    
}
