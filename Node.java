import java.util.ArrayList;

public class Node {
    Cat data;
    Node parent;
    ArrayList<Cat> children;
    public double fofN = 0;

    public Node(Cat x, Node p, double f) {
        data = x;
        parent = p;
        children = validMoves(x);
        fofN = f;
    }

    //Adds all moves on gameboard to array
    public ArrayList<Cat> validMoves(Cat parent) {
        ArrayList<Cat> goodMoves = new ArrayList<>();
        Cat temp = new Cat(parent.Xcor, parent.Ycor);
        temp = temp.moveDLeft();
        if (temp != null) {
            goodMoves.add(temp);
        }
        temp = new Cat(parent.Xcor, parent.Ycor);
        temp = temp.moveDRight();
        if (temp != null) goodMoves.add(temp);

        temp = new Cat(parent.Xcor, parent.Ycor);
        temp = temp.moveLDown();
        if (temp != null) goodMoves.add(temp);

        temp = new Cat(parent.Xcor, parent.Ycor);
        temp = temp.moveLUp();
        if (temp != null) goodMoves.add(temp);

        temp = new Cat(parent.Xcor, parent.Ycor);
        temp = temp.moveRDown();
        if (temp != null) goodMoves.add(temp);

        temp = new Cat(parent.Xcor, parent.Ycor);
        temp = temp.moveRUp();
        if (temp != null) goodMoves.add(temp);

        temp = new Cat(parent.Xcor, parent.Ycor);
        temp = temp.moveULeft();
        if (temp != null) goodMoves.add(temp);

        temp = new Cat(parent.Xcor, parent.Ycor);
        temp = temp.moveURight();
        if (temp != null) goodMoves.add(temp);

        return goodMoves;
    }

    //Finds depth of node
    public int depthOfNode() {
        int depth = 0;
        Node c = this;
        while (c.parent != null) {//if the parent is null top of the node
            depth++;
            c = c.parent;
        }
        return depth;
    }
}
