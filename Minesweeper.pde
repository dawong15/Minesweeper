import de.bezier.guido.*;
//Declare and initialize NUM_ROWS and NUM_COLS = 20
public final static int NUM_ROWS=20;
public final static int NUM_COLS=20;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs; //ArrayList of just the minesweeper buttons that are mined

void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    
    //your code to declare and initialize buttons goes here
    buttons=new MSButton[NUM_ROWS][NUM_COLS];
    for(int row=0;row<NUM_ROWS;row++)
    {
        for(int col=0;col<NUM_COLS;col++)
        {
            buttons[row][col]=new MSButton(row,col);
        }
    }
    
    
    setBombs();
}
public void setBombs()
{
    //your code
}

public void draw ()
{
    background( 0 );
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    //your code here
    return false;
}
public void displayLosingMessage()
{
    //your code here
}
public void displayWinningMessage()
{
    //your code here
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
        width = 400/NUM_COLS;
        height = 400/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {
        clicked = true;
        //your code here
    }

    public void draw () 
    {    
        if (marked)
            fill(0);
        // else if( clicked && bombs.contains(this) ) 
        //     fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
        //your code here
        return false;
    }
    public int countBombs(int row, int col)
    {
        int numBombs = 0;
        //your code here
        return numBombs;
    }
}
// NEW PROGRESSED CODE THAT STILL HAS ERRORS. INCOMPLETE
import de.bezier.guido.*;
//Declare and initialize NUM_ROWS and NUM_COLS = 20
public final static int NUM_ROWS=20;
public final static int NUM_COLS=20;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs=new ArrayList<MSButton>(); //ArrayList of just the minesweeper buttons that are mined

void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    
    //your code to declare and initialize buttons goes here
    buttons=new MSButton[NUM_ROWS][NUM_COLS];
    for(int row=0;row<NUM_ROWS;row++)
    {
        for(int col=0;col<NUM_COLS;col++)
        {
            buttons[row][col]=new MSButton(row,col);
        }

    }
    
    
    setBombs();
}
public void setBombs()
{
    for(int a=0;a<30;a++){
        {
        int row=(int)(Math.random()*20);
        int col=(int)(Math.random()*20);
        if(!bombs.contains(buttons[row][col]))
        {
            bombs.add(buttons[row][col]);
        }


    }
}
}

public void draw ()
{
    background( 0 );
    if(isWon()){
        //displayWinningMessage();
    }
}
public boolean isWon()
{
    for(int a=0;a<NUM_ROWS;a++)
    {
        for(int b=0;b<NUM_COLS;b++)
        {
            if(!buttons[a][b].isClicked()==true && !bombs.contains(buttons[a][b])){
                return false;
            }
            }
        }
    
     return true;
}
public void displayLosingMessage()
{
    //your code here

}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
        width = 400/NUM_COLS;
        height = 400/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {
        if(mouseButton==LEFT && !marked)
            clicked=true;
        if(mouseButton==RIGHT)
            marked=!marked;
        else if(bombs.contains(this))
            displayLosingMessage;
        else //if(countBombs(r,c)>0)
            label=""+countBombs(r,c);

    }

    public void draw () 
    {    
        if (marked)
            fill(0);
        // else if( clicked && bombs.contains(this) ) 
        //     fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
        if((c<20 && c>=0)&&(r<20 && r>=0)       
            return false;
    }
    public int countBombs(int row, int col)
    {
        int numBombs = 0;
        if(isValid(row+1,col) &&bombs.contains(buttons[row+1][col]))
        {
            numBombs++;
        }
        return numBombs;
    }
}



