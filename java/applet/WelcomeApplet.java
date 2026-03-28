
import java.applet.Applet;
import java.awt.Graphics;

/*
 <applet code="WelcomeApplet.class" width="400" height="200"></applet>
 */
public class WelcomeApplet extends Applet {

    @Override
    public void paint(Graphics g) {
        g.drawString("Welcome to Java Applet Programming", 50, 100);
    }
}
