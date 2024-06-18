package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
// import flixel.addons.display.FlxBackdrop;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class HaxeMenu extends FlxState
{
	var sprite1:FlxSprite;
	var sprite2:FlxSprite;
	var sprite3:FlxSprite;
	var sprite4:FlxSprite;
	var sprite5:FlxSprite;

	var haxes:FlxText;

	override public function create()
	{
		super.create();
		sprite1 = new FlxSprite();
		sprite1.loadGraphic("assets/images/haxestartup/1.png");
		sprite1.alpha = 1;

		sprite2 = new FlxSprite();
		sprite2.loadGraphic("assets/images/haxestartup/2.png");
		sprite2.alpha = 1;

		sprite3 = new FlxSprite();
		sprite3.loadGraphic("assets/images/haxestartup/3.png");
		sprite3.alpha = 1;

		sprite4 = new FlxSprite();
		sprite4.loadGraphic("assets/images/haxestartup/4.png");
		sprite4.alpha = 1;

		sprite5 = new FlxSprite();
		sprite5.loadGraphic("assets/images/haxestartup/5.png");
		sprite5.alpha = 1;

		sprite1.screenCenter(XY);
		sprite2.screenCenter(XY);
		sprite3.screenCenter(XY);
		sprite4.screenCenter(XY);
		sprite5.screenCenter(XY);

		sprite1.scale.set(0, 0);
		sprite2.scale.set(0, 0);
		sprite3.scale.set(0, 0);
		sprite4.scale.set(0, 0);
		sprite5.scale.set(0, 0);

		haxes = new FlxText();
		haxes.text = "HaxeFlixel";
		haxes.color = FlxColor.GRAY;
		haxes.size = 32;
		haxes.screenCenter(X);
		haxes.y = sprite1.y + 250;
		haxes.alpha = 0;

		add(sprite2);
		add(sprite3);
		add(sprite4);
		add(sprite5);
		add(sprite1);
		add(haxes);

		var haxesound:FlxSound;
		haxesound = FlxG.sound.load("assets/sounds/haxeboop.ogg");
		haxesound.play();
		new FlxTimer().start(0.28, function(tmr:FlxTimer)
		{
			FlxTween.tween(sprite1, {"scale.x": 1, "scale.y": 1}, 0.3, {ease: FlxEase.backOut});
			FlxTween.tween(haxes, {alpha: 1}, 0.3, {ease: FlxEase.backOut});
		});
		new FlxTimer().start(0.43, function(tmr:FlxTimer)
		{
			FlxTween.tween(sprite2, {"scale.x": 1, "scale.y": 1}, 0.1, {ease: FlxEase.backOut});
		});
		new FlxTimer().start(0.58, function(tmr:FlxTimer)
		{
			FlxTween.tween(sprite3, {"scale.x": 1, "scale.y": 1}, 0.1, {ease: FlxEase.backOut});
		});
		new FlxTimer().start(0.74, function(tmr:FlxTimer)
		{
			FlxTween.tween(sprite4, {"scale.x": 1, "scale.y": 1}, 0.1, {ease: FlxEase.backOut});
		});
		new FlxTimer().start(0.88, function(tmr:FlxTimer)
		{
			FlxTween.tween(sprite5, {"scale.x": 1, "scale.y": 1}, 0.1, {ease: FlxEase.backOut});
		});
		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			FlxTween.tween(sprite1, {alpha: 0}, 2, {ease: FlxEase.cubeInOut});
			FlxTween.tween(sprite2, {alpha: 0}, 2, {ease: FlxEase.cubeInOut});
			FlxTween.tween(sprite3, {alpha: 0}, 2, {ease: FlxEase.cubeInOut});
			FlxTween.tween(sprite4, {alpha: 0}, 2, {ease: FlxEase.cubeInOut});
			FlxTween.tween(sprite5, {alpha: 0}, 2, {ease: FlxEase.cubeInOut});
			FlxTween.tween(haxes, {alpha: 0}, 2.5, {ease: FlxEase.cubeInOut});
		});
		new FlxTimer().start(3, function(tmr:FlxTimer)
		{
			FlxG.switchState(new PlayState());
		});
	}

	override function update(_elapsed:Float) {}
}
