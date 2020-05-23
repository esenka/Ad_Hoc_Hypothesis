class PWindow extends PApplet {
  PWindow() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }
  




import codeanticode.eliza.*;

Eliza eliza;
PFont font;
String elizaResponse, humanResponse;
boolean showCursor;
int lastTime;

void settings()
{
    size(1280, 720);
    
    
}

void setup() {
   
    eliza = new Eliza(this);
   
    PFont myFont;
    myFont = createFont("Rockwell", 24);
    textFont(myFont);
    printElizaIntro();
    humanResponse = "";
    showCursor = true;
    lastTime = 0;
}

void draw()
{
    background(102);

    fill(255);
    text(elizaResponse, 10, 50, width - 40, height);

    fill(0);

    int t = millis();
    if (t - lastTime > 500)
    {
        showCursor = !showCursor;
        lastTime = t;
    }
    
    if (showCursor) text(humanResponse + "_", 10, 150, width - 40, height);
    else text(humanResponse, 10, 150, width - 40, height);
}

void keyPressed() 
{
    if ((key == ENTER) || (key == RETURN)) 
    {
        println(humanResponse);
        elizaResponse = eliza.processInput(humanResponse);
        println(">> " + elizaResponse);
        humanResponse = "";
    } 
    else if ((key > 31) && (key != CODED)) 
    {
        // If the key is alphanumeric, add it to the String
        humanResponse = humanResponse + key;
    }
    else if ((key == BACKSPACE) && (0 < humanResponse.length()))
    {
        char c = humanResponse.charAt(humanResponse.length() - 1);
        humanResponse = humanResponse.substring(0, humanResponse.length() - 1);
    }
    
    
  
}

void printElizaIntro()
{
    String hello = "Hello.";
    elizaResponse = hello + " " + eliza.processInput(hello);
    println(">> " + elizaResponse);
    
   
}
 void mousePressed() {
    println("mousePressed in secondary window");
  }
  
  void exit()
  {
    dispose();
    win = null;
  }
}
