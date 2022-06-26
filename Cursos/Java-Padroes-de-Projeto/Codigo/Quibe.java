package FactoryAbstract.Codigo;

public class Quibe implements Salgados{
    private String[]  recheioIngredientes = {"Carne","Cheiro Verde","Cominho","Massa de trigo","Oleo de cozinha"};
    private String formatoOriginal = "Losango Arrendondado";
    private float preco = 8.00F;

    @Override
    public String[] recheio(){
        return this.recheioIngredientes;
    }
    @Override
    public String forma(){
        return this.formatoOriginal;
    }
    @Override
    public void preparar(){
        System.out.println("Colocando recheio na massa...\nModelando a massa na mão...\nColocando Óleo na fritadeira...\nFritando o quibe...\nServindo o quibe....\nFim.\nSeu quibe está pronto, bom apetite !!!!");
    }
    public String tipoDeMassa(){
        return this.recheioIngredientes[3];
    }
    public float getPreco() {
        return preco;
    }
    public void setPreco(float preco) {
        this.preco = preco;
    }
    
}
