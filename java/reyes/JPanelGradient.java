import java.awt.Color;
import java.awt.GradientPaint;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.LinearGradientPaint;
import java.awt.Rectangle;
import javax.swing.JPanel;
import java.awt.geom.GeneralPath;
import java.awt.AlphaComposite;
import java.awt.Image;
import java.awt.image.BufferedImage;
import javax.swing.ImageIcon;
import java.awt.geom.*;
/************************************************
 *Este Lienzo consiste en un paisaje simple de los reyes magos buscando la 
 *estrella de belen
 *de entre un pre amanecer, con las fases de la luna.
 *Use:
 *ANTIALIASING
 *DEGRADADO
 *ALPHACOMPOSITE
 *GENERAL PATH para las estrellas
 *BASICSTROKE para la punta de la pluma
 *************************************************/
import java.util.Random;
import java.awt.*;
import java.awt.image.*;
public class JPanelGradient extends JPanel {

    private Color color1 = new Color(0x666f7f);
    private Color color2 = new Color(0x262d3d);
    private float x1 = 0;
    private float y1 = 0;
    private float x2 = getWidth();
    private float y2 = getHeight();
    private GeneralPath gp1, gp2;
    
    
     protected void paintComponent(Graphics g) {
        Graphics2D g2 = (Graphics2D) g.create();
        Rectangle clip = g2.getClipBounds();
        float x = getWidth();
        float y = getHeight();
        
        
        
        g2.setPaint(new GradientPaint(5.5f, 0.6f, color2.darker(), 0.0f, getHeight(), new Color(0, 100, 254)));
        g2.fillRect(clip.x, clip.y, clip.width, clip.height);
        //g2.setColor(new Color(174,148,60))
        
        g2.setRenderingHint(
                RenderingHints.KEY_ANTIALIASING,
                RenderingHints.VALUE_ANTIALIAS_ON);
        gp1 = new GeneralPath();
        gp1.moveTo(30, 100);
        gp1.lineTo(50, 160);
        gp1.lineTo(0, 120);
        gp1.lineTo(60, 120);
        gp1.lineTo(10, 160);
        gp1.closePath();
        g2.setColor(Color.ORANGE);
        g2.fill(gp1);
        gp2 = new GeneralPath();
        gp2.moveTo(230, 300);
        gp2.lineTo(250, 360);
        gp2.lineTo(200, 320);
        gp2.lineTo(260, 320);
        gp2.lineTo(210, 360);
        gp2.closePath();
        g2.setColor(Color.ORANGE);
        g2.fill(gp2);
 
        gp2 = new GeneralPath();
        gp2.moveTo(430, 500);
        gp2.lineTo(450, 560);
        gp2.lineTo(400, 520);
        gp2.lineTo(460, 520);
        gp2.lineTo(410, 560);
        gp2.closePath();
        g2.setColor(Color.ORANGE);
        g2.fill(gp2);

        gp2 = new GeneralPath();
        gp2.moveTo(630, 300);
        gp2.lineTo(650, 360);
        gp2.lineTo(600, 320);
        gp2.lineTo(660, 320);
        gp2.lineTo(610, 360);
        gp2.closePath();
        g2.setColor(Color.ORANGE);
        g2.fill(gp2);

        float alpha;
        g2.setColor(Color.GRAY);
        Ellipse2D e1 = new Ellipse2D.Double(90.0, 260.0, 80.0, 80.0);
        Ellipse2D e2 = new Ellipse2D.Double(100.0, 250.0, 80.0, 80.0);
        Area a1 = new Area(e1);
        Area a2 = new Area(e2);
        a1.subtract(a2);
        g2.fill(a1);
        //AlphaComposite ac = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.3f);
        //g2.setComposite(ac);

        Ellipse2D e3 = new Ellipse2D.Double(230.0, 160.0, 80.0, 80.0);
        Ellipse2D e4 = new Ellipse2D.Double(250.0, 150.0, 80.0, 80.0);
        Area a3 = new Area(e3);
        Area a4 = new Area(e4);
        a3.subtract(a4);
        g2.fill(a3);
        
       // g2.setColor(Color.GRAY);
        //g2.fillOval(250, 150, 100, 100);
        //AlphaComposite ac2 = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.6f);
        //g2.setComposite(ac2);

        Ellipse2D e5 = new Ellipse2D.Double(420.0, 70.0, 80.0, 80.0);
        Ellipse2D e6 = new Ellipse2D.Double(450.0, 70.0, 80.0, 80.0);
        Area a5 = new Area(e5);
        Area a6 = new Area(e6);
        a5.subtract(a6);
        g2.fill(a5);
        AlphaComposite ac3 = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.8f);
        g2.setComposite(ac3);

        //Maxima luna
        Ellipse2D e7 = new Ellipse2D.Double(650.0, 30.0, 80.0, 80.0);
        Area a7 = new Area(e7);
        g2.fill(a7);
        
        //AlphaComposite ac4 = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 1f);
        //g2.setComposite(ac4);

        //Empieza a descender
        Ellipse2D e8 = new Ellipse2D.Double(820.0, 70.0, 80.0, 80.0);
        Ellipse2D e9 = new Ellipse2D.Double(850.0, 80.0, 80.0, 80.0);
        Area a8 = new Area(e8);
        Area a9 = new Area(e9);
        a9.subtract(a8);
        g2.fill(a9);
        
        //AlphaComposite ac5 = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.8f);
        //g2.setComposite(ac5);
        Ellipse2D e10 = new Ellipse2D.Double(1030.0, 150.0, 80.0, 80.0);
        Ellipse2D e11 = new Ellipse2D.Double(1050.0, 155.0, 80.0, 80.0);
        Area a10 = new Area(e10);
        Area a11 = new Area(e11);
        a11.subtract(a10);
        g2.fill(a11);
        
        
        //AlphaComposite ac6 = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.6f);
        //g2.setComposite(ac6);
        Ellipse2D e12 = new Ellipse2D.Double(1240.0, 250.0, 80.0, 80.0);
        Ellipse2D e13 = new Ellipse2D.Double(1250.0, 260.0, 80.0, 80.0);
        Area a12 = new Area(e12);
        Area a13 = new Area(e13);
        a13.subtract(a12);
        g2.fill(a13);
        Image i2 = new ImageIcon(this.getClass().getResource("belen.png")).getImage();
        //System.out.println(a);
        BufferedImage buffImg2 = new BufferedImage(5, 5, BufferedImage.TYPE_INT_ARGB);
        Graphics2D gbi2 = buffImg2.createGraphics();
        g2.drawImage(i2, 1200, 30, null);
        
        AlphaComposite ac7 = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.3f);
        g2.setComposite(ac7);
        Landscape(g);

        Image a = new ImageIcon(this.getClass().getResource("reyes1.png")).getImage();
        BufferedImage buffImg = new BufferedImage(10, 10, BufferedImage.TYPE_INT_ARGB);
        Graphics2D gbi = buffImg.createGraphics();
        g2.drawImage(a, 50, 145, null);
        
        
    }

    public void Landscape(Graphics g) {
        Graphics2D g2d = (Graphics2D) g;
        int x1 = 0, x2 = 400, x3 = 300;
        int y1 = 700, y2 = 700, y3 = 450;
        int arrayX[] = {x1, x2, x3};
        int arrayY[] = {y1, y2, y3};
        g2d.setRenderingHint(
                RenderingHints.KEY_ANTIALIASING,
                RenderingHints.VALUE_ANTIALIAS_ON);
                
        GradientPaint horizontalGradient = new GradientPaint(0, 0, new Color(g2d.getColor().getRed(), g2d.getColor().getGreen(),
                g2d.getColor().getBlue()), getWidth(), 0, new Color(132, 130, 132));
        /*gp2.moveTo(0,700);
        gp2.quadTo(300,100,600,700);
        gp2.closePath();
        g2d.fill(gp2);*/
        g2d.setPaint(horizontalGradient);
        g2d.fillPolygon(arrayX, arrayY, 3);
        int arrayXX[] = {100, 800, 500};
        int arrayYY[] = {700, 700, 550};
        g2d.fillPolygon(arrayXX, arrayYY, 3);
        int arrayXXX[] = {400, 1400, 1000};
        int arrayYYY[] = {700, 700, 350};
        g2d.fillPolygon(arrayXXX, arrayYYY, 3);
        //Arena
        g2d.setColor(new Color(174,148,60));
        g2d.fillRect(0,650,250,250);
        g2d.fillOval(0, 700, 150, 150);
        g2d.fillOval(0,650,400,100);
        g2d.setColor(new Color(167,141,92));
        g2d.fillOval(100,650,700,150);
        g2d.setColor(new Color(174,148,50));
        //g2d.fillRect(0, 650, 1500, 150);
        g2d.fillOval(300,700,700,100);
        
        g2d.setColor(new Color(167,141,92));
        //g2d.fillRect(0, 650, 1500, 150);
        g2d.fillOval(650,650,800,150);
        g2d.setColor(new Color(174,148,50));
        g2d.fillOval(850,650,800,150);
        Random r = new Random();
        for (int i = 0; i < 750; i++) {
            int x = Math.abs(r.nextInt()) % 1500;
            int y = Math.abs(r.nextInt()) % 600;
            if ((x >= 50 && x <= 150) || (x >= 250 && x <= 350) || (x >= 450 && x <= 550)
                    || (x >= 850 && x <= 950) || (x >= 1050 && x <= 1150) || (x >= 1250 && x <= 1350)
                    || (x >= 650 && x <= 750) || (y >= 550 && y <= 800) || (y >= 350) || (y >= 350 && y <= 700)) {
            } else {
                g2d.setStroke(new BasicStroke(2));
                g2d.setColor(Color.YELLOW);
                g2d.drawLine(x, y, x, y);
            }
        }
    }

    
    public static void main(String[] afr) {
        WindowUtilities.openInJFrame(new JPanelGradient(), 1500, 800, "");

    }
}
