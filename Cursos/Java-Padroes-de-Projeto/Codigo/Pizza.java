package FactoryAbstract.Codigo;

public class Pizza implements Salgados {
    private String[] recheioIngredientes = {"Queijo","Calabresa","Azeitona","Massa de trigo","Cebola"};
    private String tipoDeQueijo = "Mussarela";
    private float preco=27.00F;
    private String formatoOriginal="Circunferência";

    @Override
    public String[] recheio() {
        return this.recheioIngredientes;
    }
    @Override
    public String forma() {
        return this.formatoOriginal;
    }
    @Override
    public void preparar() {
        System.out.println("Modelando a massa em Circunferência...\nAdicionanando o queijo Mussarela...\nAdicionando os demais ingredientes...\nAssando a pizza\nSua piazza está pronta, bom apetite !!!");
    }
    public String getTipoDeQueijo() {
        return tipoDeQueijo;
    }
    public void setTipoDeQueijo(String tipoDeQueijo) {
        this.tipoDeQueijo = tipoDeQueijo;
    }
    public float getPreco() {
        return preco;
    }
    public void setPreco(float preco) {
        this.preco = preco;
    }
    
}
