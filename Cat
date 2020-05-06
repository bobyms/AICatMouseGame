public class Cat {
    protected int      Xcor;
    protected int      Ycor;

    public Cat(int x, int y){
        Xcor = x;
        Ycor = y;
    }
    public Cat moveURight() {
        //System.out.println("OG:"+Xcor+","+Ycor);
        Cat c = new Cat(Xcor += 1, Ycor +=2);
        if(isInBounds(c)) {
            //System.out.println("Cat new:" + c.Xcor+"," + c.Ycor);
            return c;
        }
        return null;
    }
    public Cat moveDRight() {
        //System.out.println("OG2:"+Xcor+","+Ycor);
        Cat c = new Cat(Xcor+= 1, Ycor-= 2);
        if(isInBounds(c)) {
            //System.out.println("Cat new:" + c.Xcor+"," + c.Ycor);
            return c;
        }
        return null;
    }
    public Cat moveULeft() {
        //System.out.println("OG:"+Xcor+","+Ycor);
        Cat c = new Cat(Xcor-= 1, Ycor+=2);
        if(isInBounds(c)) {
            //System.out.println("Cat new1:" + c.Xcor+"," + c.Ycor);
            return c;
        }
        return null;
    }
    public Cat moveDLeft() {
        //System.out.println("OG:"+Xcor+","+Ycor);
        Cat c = new Cat(Xcor-= 1, Ycor-= 2);
        if(isInBounds(c)) {
            //System.out.println("Cat new1:" + c.Xcor+"," + c.Ycor);
            return c;
        }
        return null;
    }
    public Cat moveLDown() {
        //System.out.println("OG:"+Xcor+","+Ycor);
        Cat c = new Cat(Xcor-= 2, Ycor-= 1);
        if(isInBounds(c)) {
            //System.out.println("Cat new:" + c.Xcor+"," + c.Ycor);
            return c;
        }
        return null;
    }

    public Cat moveRDown() {
        //System.out.println("OG:"+Xcor+","+Ycor);
        Cat c = new Cat(Xcor+= 2, Ycor-= 1);
        if(isInBounds(c)) {
            //System.out.println("Cat new:" + c.Xcor+"," + c.Ycor);
            return c;
        }
        return null;
    }
    public Cat moveLUp() {
        //System.out.println("OG:"+Xcor+","+Ycor);
        Cat c = new Cat(Xcor-= 2, Ycor+= 1);
        if(isInBounds(c)) {
            //System.out.println("Cat new:" + c.Xcor+"," + c.Ycor);
            return c;
        }
        return null;
     }
    public Cat moveRUp() {
        //System.out.println("OG:"+Xcor+","+Ycor);
        Cat c = new Cat(Xcor+= 2, Ycor+= 1);
        if(isInBounds(c)) {
           // System.out.println("Cat new:" + c.Xcor+"," + c.Ycor);
            return c;
        }
        return null;
    }

    public boolean isInBounds(Cat c){
        if(0 <= c.Xcor && c.Xcor < 12 && 0 <= c.Ycor && c.Ycor < 12) return true;
        return false;
    }
}
