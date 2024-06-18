package;

import flixel.text.FlxText;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.math.FlxMath;
class PlayState extends FlxState
{
	var plr:FlxSprite;
	var enm:FlxSprite;
	var ball:FlxSprite;
	override public function create()
	{
		super.create();
		// add(new FlxText("Hello World", 32).screenCenter());

		plr = new FlxSprite().makeGraphic(5,40, 0xFFFFFFFF);
		add(plr);
		plr.x = 15;

		enm = new FlxSprite().makeGraphic(5,40,0xFFFFFFFF);
		add(enm);
		enm.x = FlxG.width - 15;
        
		ball = new FlxSprite().loadGraphic("assets/images/shit.png");
		add(ball);
		ball.screenCenter();
        ball.scale.set(0.1,0.1);
	    ball.updateHitbox();
	    for(i in [plr, enm]){
			i.y = FlxG.height / 2 - i.height / 2;
		    i.updateHitbox();
		}
		score = new FlxText(100,50,1000,"Score:", 20);
		add(score);

		
	}
    var dir:Bool = false;
	var ang:Int = 0;

	var switched:Bool = true;

	var goingup:Bool = false;

	var tPLR:Bool = false;
	var tENM:Bool = false;
	var speeder:Float = 0;
	var score:FlxText;
	var scr:Int;
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if(dir == false) ball.x -= 300 * elapsed + speeder; 
		if(dir == true) ball.x += 300 * elapsed + speeder;

		if(ball.overlaps(plr)){  bruh(); dir = true; switched = false; scr += 1; }
		if(ball.overlaps(enm)){  bruh(); dir = false; switched = false; } 

        enm.y = FlxMath.lerp(enm.y, ball.y - enm.height + 20, 5 * elapsed);
        ball.y += 0.3 + speeder * ang ;
        // if(plr.overlaps(ball) && tPLR == false){ tPLR = true; bruh(); } 
        // if(enm.overlaps(ball) && tENM == false){ tENM = true; bruh(); }


        if(FlxG.keys.justPressed.E) { ball.screenCenter(); ang = 0; }
        if(FlxG.keys.justPressed.J) { ang += 5; }
        if(FlxG.keys.justPressed.L) { ang -= 5; }

		if(ang >= 0) goingup = false;
		if(ang <= 0) goingup = true;
        
		if(ball.y <= 10){ ang = FlxG.random.int(3,10); trace("cu");}
		if(ball.y >= 450){ ang = FlxG.random.int(-3,-10);   trace("cu2");}
		// trace(ball.y);	
		// trace(FlxG.mouse.y);

        plr.y = FlxG.mouse.y;
	     
		if(ball.x >= FlxG.width + 100) reset();
		if(ball.x <= -100) reset();
        
		score.text = "Score: " + scr;
	}
    function reset(){
		ang = 0;
		speeder = 0;
		ball.screenCenter();
		dir = false;
	}
	public function bruh(){
	    // if(switched == false)
		ang = FlxG.random.int(5,-5);
		speeder += 0.1;
	    // switched = true;
		// trace(plr.overlaps(ball));
	}

}
