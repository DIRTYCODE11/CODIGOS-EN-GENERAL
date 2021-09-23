public class PolyPoint {
    private int numVertices;
    private Punto[] puntos;

    public PolyPoint() {
        this.numVertices = 1;
        this.puntos = new Punto[] {new Punto(0,0)};
    }

    public void setPuntos(Punto[] puntos) {
        this.numVertices = puntos.length;
        this.puntos = puntos;
    }

    public Punto[] getPuntos() {
        return puntos;
    }
}
