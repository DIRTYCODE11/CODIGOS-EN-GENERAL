
import java.awt.Color;
import javax.swing.JPanel;
import javax.swing.JOptionPane;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.GeneralPath;
import java.awt.RenderingHints;
import javax.swing.JFrame;

public class Graficar extends JPanel {

    public PolyPoint makeNGon(double radio, int numLados, PolyPoint poligono) {
        double anguloPrin, anguloAcumulado;
        Punto[] vertices = new Punto[numLados];
        if (numLados >= 3) {
            anguloPrin = (2 * Math.PI) / numLados;
            for (int x = 0; x < numLados; x++) {
                anguloAcumulado = x * anguloPrin;
                double coordX = radio * Math.cos(anguloAcumulado);
                double coordY = radio * Math.sin(anguloAcumulado);
                vertices[x] = new Punto(coordX, coordY);
            }
            poligono.setPuntos(vertices);
        } else {
            JOptionPane.showMessageDialog(null, "La cantidad de lados debe de ser un "
                    + "numero primo y mayor o igual a 3", "Error", JOptionPane.ERROR_MESSAGE);
        }
        return poligono;
    }

    public GeneralPath primeRosette(double radio, int numLados) {
        GeneralPath path1 = new GeneralPath();
        int indice = 0;
        PolyPoint poligono = makeNGon(radio, numLados, new PolyPoint());

        path1.moveTo(poligono.getPuntos()[0].getX(), poligono.getPuntos()[0].getY());
        for (int incr = 1; incr <= (numLados - 1) / 2; incr++) {
            for (int x = 0; x < numLados; x++) {
                indice = indice + incr;
                if (indice >= numLados) {
                    indice = indice - numLados;
                }
                path1.lineTo(poligono.getPuntos()[indice].getX(), poligono.getPuntos()[indice].getY());
            }
        }

        return path1;
    }

    public void paint(Graphics g) {
        Graphics2D g2d;
        g2d = (Graphics2D) g;
        g2d.setColor(Color.WHITE);
        //Aplicar el antialias para una mejor calidad de imagen
        RenderingHints rh = new RenderingHints(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        rh.put(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        g2d.setRenderingHints(rh);

        g2d.translate(250, 250);
        g2d.draw(primeRosette(200, 23));
    }

    public static void main(String[] args) {
        JFrame frame = new JFrame("Roseta prima");
        frame.add(new Graficar());
        frame.setSize(500, 500);
        frame.setBackground(Color.BLACK);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
        frame.setResizable(false);;
    }
}
