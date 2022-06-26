package FactoryAbstract.Codigo;

public class NoiteRestaurante implements RestauranteAbstrato{
    @Override
    public Doces createDoce() {
        BoloDeChocolate bolo = new BoloDeChocolate();
        return bolo;
    }
    @Override
    public Salgados createSalgado() {
        Pizza pizza = new Pizza();
        return pizza;
    }
    
}
