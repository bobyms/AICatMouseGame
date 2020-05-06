import java.util.*;

public class Search {
    private Cat start;
    private HashMap<Integer, Mouse> mouseMoves;
    private Boolean won = true;
    private int searched = 0;
    private Cheese[] cheeses;

    Search(Cat c, HashMap<Integer, Mouse> mm, Cheese[] ch){
        start = c;
        mouseMoves = mm;
        cheeses = ch;

    }

    public ArrayList<Cat> bfs(){
        ArrayList<Cat> win = new ArrayList<>();

        //Queue of nodes to visit
        Queue<Node> queue = new LinkedList<>();
        Node first = new Node(start,null, 0);
        Node current = first;

        queue.add(first);
        System.out.println("Initialized with start"+start.Xcor+start.Ycor);
        //While there is still children to explore
        while(!queue.isEmpty()){
            searched++;
            current = queue.remove();
            //Checks if mouse won
            //System.out.println("Currently at: "+current.data.Xcor+current.data.Ycor);
            //System.out.println("Depth at: "+current.depthOfNode());
            if(current.depthOfNode()>= mouseMoves.size()){System.out.println("RIP"); won = false; break;}
            //Checks if Cat won
            if (mouseMoves.get(current.depthOfNode()).Xcor == current.data.Xcor && mouseMoves.get(current.depthOfNode()).Ycor == current.data.Ycor) break;
            else{
                if(current.children.size() == 0) {System.out.println("No kids"); break;}
                else {
                    for(Cat c: current.children) {
                        queue.add(new Node(c,current,0));
                        //System.out.println("Child "+c.Xcor+","+c.Ycor);
                    }
                }
            }
        }
       if(won){
           while(current.parent != null){
               win.add(0,current.data);
               current = current.parent;
           }
       }
       else System.out.println("Loser");
       for (Cat please: win){
           System.out.println(please.Xcor+",,,"+please.Ycor);
       }
       System.out.println("This many nodes: "+ searched);
        return win;
    }

    public ArrayList<Cat> dfs(){
        ArrayList<Cat> win = new ArrayList<>();

        //Queue of nodes to visit
        Stack<Node> stack = new Stack<>();
        Node first = new Node(start,null,0);
        Node current = first;

        stack.add(first);
        System.out.println("Initialized with start "+start.Xcor+start.Ycor);
        //While there is still children to explore
        while(!stack.isEmpty()) {
            searched++;
            current = stack.pop();
            //Checks if mouse won
            //System.out.println("Currently at: " + current.data.Xcor + current.data.Ycor);
            //System.out.println("Depth at: " + current.depthOfNode());
            if (current.depthOfNode() < mouseMoves.size()) {
                //Checks if Cat won
                if (mouseMoves.get(current.depthOfNode()).Xcor == current.data.Xcor && mouseMoves.get(current.depthOfNode()).Ycor == current.data.Ycor)
                    break;
                else {
                    for (Cat c : current.children) {
                        stack.add(new Node(c, current,0));
                        //System.out.println("Child " + c.Xcor + "," + c.Ycor);
                    }
                }
            }
        }
        if(won){
            while(current.parent != null){
                win.add(0,current.data);
                current = current.parent;
            }
        }
        else System.out.println("Loser");
        for (Cat please: win){
            System.out.println(please.Xcor+",,,"+please.Ycor);
        }
        System.out.println("This many nodes: "+ searched);
        return win;
    }

    public ArrayList<Cat> Astar(){
        ArrayList<Cat> win = new ArrayList<>();

        //Queue of nodes to visit
        //override compare method
        PriorityQueue<Node> queue = new PriorityQueue<>(20,
                (x, y) -> {
                    if (x.fofN > y.fofN) {
                        return 1;
                    } else if (x.fofN < y.fofN) {
                        return -1;
                    } else {
                        return 0;
                    }
                }
        );

        //f = g + h. g = depth, h will = how many spots mans is from goal

        Node first = new Node(start,null,0);
        Node current = first;

        queue.add(first);
        System.out.println("Initialized with start"+start.Xcor+start.Ycor);
        //While there is still children to explore
        while(!queue.isEmpty()){
            searched++;
            current = queue.remove();
            //Checks if mouse won
            //System.out.println("Currently at: "+current.data.Xcor+current.data.Ycor);
            //System.out.println("Depth at: "+current.depthOfNode());
            if(current.depthOfNode()>= mouseMoves.size()){System.out.println("RIP"); won = false; break;}
            //Checks if Cat won
            if (mouseMoves.get(current.depthOfNode()).Xcor == current.data.Xcor && mouseMoves.get(current.depthOfNode()).Ycor == current.data.Ycor) break;
            else{
                if(current.children.size() == 0) {System.out.println("No kids"); break;}
                else {
                    for(Cat c: current.children) {
                        double f = hofN(c,mouseMoves.get(current.depthOfNode()+1)) + current.depthOfNode() + 1;
                        queue.add(new Node(c,current,f));
                        //System.out.println("Child "+c.Xcor+","+c.Ycor);
                    }
                }
            }
        }
        if(won){
            while(current.parent != null){
                win.add(0,current.data);
                current = current.parent;
            }
        }
        else System.out.println("Loser");
        for (Cat please: win){
            System.out.println(please.Xcor+",,,"+please.Ycor);
        }
        System.out.println("This many nodes: "+ searched);
        return win;
    }

    public ArrayList<Cat> H(){
        ArrayList<Cat> win = new ArrayList<>();

        //Queue of nodes to visit
        //override compare method
        PriorityQueue<Node> queue = new PriorityQueue<>(20,
                (x, y) -> {
                    if (x.fofN > y.fofN) {
                        return 1;
                    } else if (x.fofN < y.fofN) {
                        return -1;
                    } else {
                        return 0;
                    }
                }
        );

        //f = g + h. g = depth, h will = how many spots mans is from goal

        Node first = new Node(start,null,0);
        Node current = first;

        queue.add(first);
        System.out.println("Initialized with start"+start.Xcor+start.Ycor);
        //While there is still children to explore
        while(!queue.isEmpty()){
            searched++;
            current = queue.remove();
            //Checks if mouse won
            //System.out.println("Currently at: "+current.data.Xcor+current.data.Ycor);
            //System.out.println("Depth at: "+current.depthOfNode());
            if(current.depthOfNode()>= mouseMoves.size()){System.out.println("RIP"); won = false; break;}
            //Checks if Cat won
            if (mouseMoves.get(current.depthOfNode()).Xcor == current.data.Xcor && mouseMoves.get(current.depthOfNode()).Ycor == current.data.Ycor) break;
            else{
                if(current.children.size() == 0) {System.out.println("No kids"); break;}
                else {
                    for(Cat c: current.children) {
                        double f = hofN2(c,cheeses) + current.depthOfNode() + 1;
                        queue.add(new Node(c,current,f));
                        //System.out.println("Child "+c.Xcor+","+c.Ycor);
                    }
                }
            }
        }
        if(won){
            while(current.parent != null){
                win.add(0,current.data);
                current = current.parent;
            }
        }
        else System.out.println("Loser");
        for (Cat please: win){
            System.out.println(please.Xcor+",,,"+please.Ycor);
        }
        System.out.println("This many nodes: "+ searched);
        return win;
    }
    public ArrayList<Cat> average(){
        ArrayList<Cat> win = new ArrayList<>();

        //Queue of nodes to visit
        //override compare method
        PriorityQueue<Node> queue = new PriorityQueue<>(20,
                (x, y) -> {
                    if (x.fofN > y.fofN) {
                        return 1;
                    } else if (x.fofN < y.fofN) {
                        return -1;
                    } else {
                        return 0;
                    }
                }
        );

        //f = g + h. g = depth, h will = how many spots mans is from goal

        Node first = new Node(start,null,0);
        Node current = first;

        queue.add(first);
        System.out.println("Initialized with start"+start.Xcor+start.Ycor);
        //While there is still children to explore
        while(!queue.isEmpty()){
            searched++;
            current = queue.remove();
            //Checks if mouse won
            //System.out.println("Currently at: "+current.data.Xcor+current.data.Ycor);
            //System.out.println("Depth at: "+current.depthOfNode());
            if(current.depthOfNode()>= mouseMoves.size()){System.out.println("RIP"); won = false; break;}
            //Checks if Cat won
            if (mouseMoves.get(current.depthOfNode()).Xcor == current.data.Xcor && mouseMoves.get(current.depthOfNode()).Ycor == current.data.Ycor) break;
            else{
                if(current.children.size() == 0) {System.out.println("No kids"); break;}
                else {
                    for(Cat c: current.children) {
                        double a = hofN(c,mouseMoves.get(current.depthOfNode()+1)) + current.depthOfNode() + 1;
                        double b = hofN2(c,cheeses) + current.depthOfNode() + 1;
                        double f = a+b;
                        f = f/2;
                        queue.add(new Node(c,current,f));
                        //System.out.println("Child "+c.Xcor+","+c.Ycor);
                    }
                }
            }
        }
        if(won){
            while(current.parent != null){
                win.add(0,current.data);
                current = current.parent;
            }
        }
        else System.out.println("Loser");
        for (Cat please: win){
            System.out.println(please.Xcor+",,,"+please.Ycor);
        }
        System.out.println("This many nodes: "+ searched);
        return win;
    }

    private double hofN(Cat c, Mouse m){
        double h;
        h = Math.sqrt((m.Ycor - c.Ycor) * (m.Ycor - c.Ycor) + (m.Xcor - c.Xcor) * (m.Xcor - c.Xcor));
        return h;
    }

    private double hofN2(Cat c, Cheese[] ch){
        double h;
        double temp;
        h = Math.sqrt((ch[0].Ycor - c.Ycor) * (ch[0].Ycor - c.Ycor) + (ch[0].Xcor - c.Xcor) * (ch[0].Xcor - c.Xcor));
        for(int i = 1; i<ch.length; i++){
            temp = Math.sqrt((ch[i].Ycor - c.Ycor) * (ch[i].Ycor - c.Ycor) + (ch[i].Xcor - c.Xcor) * (ch[i].Xcor - c.Xcor));
            if(h>temp)h = temp;
        }
        return h;
    }
}
