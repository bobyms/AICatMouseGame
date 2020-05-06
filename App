import javax.swing.*;
import java.awt.*;
import java.util.ArrayList;
import java.util.Random;
import java.util.HashMap;

public class App {
    JFrame frame = new JFrame(); //creates frame
    JButton[][] grid;
    Random rand = new Random();
    Cheese close = null;

    private App(int width, int length, int food) throws InterruptedException {

        Cheese[] cheeses = new Cheese[food];
        HashMap<Integer, Mouse> mouseMoves = new HashMap<>();

        //Builds UI
        frame.setLayout(new GridLayout(width,length)); //set layout
        grid=new JButton[width][length]; //allocate the size of grid
        for(int y=0; y<length; y++) {
            for (int x = 0; x < width; x++) {
                grid[x][y] = new JButton(); //creates new button
                grid[x][y].setPreferredSize(new Dimension(40, 40));
                frame.add(grid[x][y]); //adds button to grid
            }
        }
        //Places random cheese
        for(int i=0; i<food; i++){
            int a = rand.nextInt(12);
            int b = rand.nextInt(12);
            grid[a][b].setBackground(Color.yellow);
            Cheese c = new Cheese(a,b);
            cheeses[i]=c;
        }
        //Places random Cat and mouse
        int mx = rand.nextInt(12);
        int cx = rand.nextInt(12);
        int my = rand.nextInt(12);
        int cy = rand.nextInt(12);
        grid[cx][cy].setBackground(Color.blue);
        grid[mx][my].setBackground(Color.green);
        Mouse m = new Mouse(mx,my);
        Cat c = new Cat(cx,cy);

        //Copy cheese spots before they're overwritten
        Cheese[] cheddar = cheeses;

        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(405,430);
        frame.pack(); //sets appropriate size for frame
        frame.setVisible(true); //makes frame visible

        //Euclidean travel of mouse. Stores moves in Hashmap in order
        eatNext(cheeses,m);
        int mm = 0;

        //Find route of mouse and add to hashmap
        //grid[m.Xcor][m.Ycor].setBackground(Color.lightGray);
        mouseMoves.put(mm, m);
        while(true){

            if(close == null)eatNext(cheeses,m);
            m = moveMouse(m, close);
            mm++;
            mouseMoves.put(mm,new Mouse(m.Xcor,m.Ycor));
            System.out.println("X:"+m.Xcor+" Y:"+m.Ycor);
            eatCheese(m,cheeses);
            int lost = 0;
            for (int i=0; i < cheeses.length; i++){
                if (cheeses[i].Ycor == 100) lost++;
            }
            if (lost == cheeses.length)break;
        }
        System.out.println("Mouse Moves "+ mouseMoves.size());
        Search s = new Search(c,mouseMoves, cheddar);
        ArrayList<Cat> cats;

        //Find route of cat to catch mouse
        cats = s.bfs();
        System.out.println("win length: "+cats.size());


        //Update UI to show capture
        for(int i=0; i<=cats.size()-1;i++) {
            //Moves mouse
            m = mouseMoves.get(i);
            c = cats.get(i);
            update(m, c);
        }
    }

    //Finds closest cheese to mouse
    public void eatNext(Cheese[] cheeses, Mouse m){
        double near = 0;
        double temp;
        for (Cheese ch:cheeses) {
            if (ch != null) {
                temp = closest(m.Xcor, m.Ycor, ch.Xcor, ch.Ycor);
                if (near == 0 || near > temp) {
                    near = temp;
                    close = ch;
                }
            }
        }
    }

    // Calculates closest cheese to mouse
    public double closest(int x1, int y1, int x2,int y2) {
        return Math.sqrt((y2 - y1) * (y2 - y1) + (x2 - x1) * (x2 - x1));
    }

    //Moves mouse towards closest cheese
    public Mouse moveMouse(Mouse m, Cheese c){
        Mouse move = m;
        if(m.Xcor < c.Xcor) move.moveRight();
        if(m.Xcor > c.Xcor) move.moveLeft();
        if(m.Ycor < c.Ycor) move.moveDown();
        if(m.Ycor > c.Ycor) move.moveUp();
        return move;
    }

    //Updates UI
    public void update(Mouse m,Cat c) throws InterruptedException {
        grid[c.Xcor][c.Ycor].setBackground(Color.blue);
        grid[m.Xcor][m.Ycor].setBackground(Color.green);
        Thread.sleep(500);
        grid[m.Xcor][m.Ycor].setBackground(Color.lightGray);
        Thread.sleep(200);
        grid[c.Xcor][c.Ycor].setBackground(Color.blue);
        Thread.sleep(500);
        grid[c.Xcor][c.Ycor].setBackground(Color.gray);
    }

    //Sets eaten cheese to null
    public void eatCheese(Mouse m,Cheese[] cs){
        for (Cheese ch : cs) {
            if (ch.Xcor == m.Xcor && ch.Ycor == m.Ycor) {
                ch.Xcor = 100;
                ch.Ycor = 100;
                close = null;
            }
        }
    }

    public static void main(String[] args) throws InterruptedException {
        new App(13, 13, 3);
    }
}
