package FactoryAbstract.Codigo;

public class DiaRestaurante implements RestauranteAbstrato{
    @Override
    public Doces createDoce() {
        Pudim pudim = new Pudim();
        return pudim;
    }
    @Override
    public Salgados createSalgado() {
        Salgados quibe = new Quibe();
        return quibe;
    } 
}

