public class Elipsis {

    public static double ingresar_datos(double... precio) {
        double total = 0;
        for (int i = 0; i < precio.length; i++) {
            total += precio[i];
        }
        return total;
    }

    public static void main(String[] args) {
        double monto = ingresar_datos(5.98, 7.5, 10.24, 2.0, 1.0, 7.5, 60.5, 78.5, 100.56, 150.98, 32.56);
        System.out.printf("El total es: $%5.2f MXN", monto);
    }
}
