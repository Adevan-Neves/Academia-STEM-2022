package FactoryAbstract.Codigo;

import java.util.Scanner;

public class App {
    public static void main(String[] args) {
        String tempo;
        String pedido;
        Salgados s1;
        Doces d1;
        Scanner scan = new Scanner(System.in);
        RestauranteAbstrato fab;
        System.out.println("\n---Bem vindo ao projeto de Restaurante de Adevan Neves santos---\nEstá de tarde ou de noite ?: ");
        tempo=scan.next();
        
        if(tempo.equals("tarde")){
            fab = new DiaRestaurante();
        }
        else{
            fab = new NoiteRestaurante();
        }
        System.out.println(" Você deseja um Salgado ou Doce ? ");
        pedido = scan.next();
        if(pedido.equals("salgado")){
            s1=fab.createSalgado();
            s1.preparar();
        }
        else{
            d1=fab.createDoce();
            d1.preparar();
        }


    }
    
}
