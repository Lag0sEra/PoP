package;

import openfl.filters.ShaderFilter;
import TVEffect.TVShader;
import flixel.addons.transition.TransitionData;
#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import flixel.input.keyboard.FlxKey;

using StringTools;

class PreFreeplayState extends MusicBeatState
{
	public var curSelected:Int = 1;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	public static var StoryDone:Bool = false;
	public static var StoryDone2:Bool = false;

	var optionShit:Array<String> = ['Progressive', 'Story', 'FFV'];

	override function create()
	{
		StoryDone = (Highscore.getWeekScore("story", 2) > 0);
		StoryDone2 = (Highscore.getScore("Magnum Opus", 2) > 0);
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Choosing Freeplay", null);
		#end

		camGame = new FlxCamera();

		FlxG.cameras.reset(camGame);
		FlxCamera.defaultCameras = [camGame];

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut = new TransitionData(NONE, FlxColor.TRANSPARENT, 3);

		persistentUpdate = persistentDraw = true;

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('pre-freeplay/bg'));
		bg.setGraphicSize(Std.int(bg.width * 1.05));
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 1;

		for (i in 0...optionShit.length)
		{
			var menuItem:FlxSprite = new FlxSprite();
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.frames = Paths.getSparrowAtlas('pre-freeplay/placeholder-freeplay-buttons');
			menuItem.animation.addByPrefix('idle', optionShit[i], 1);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			switch (optionShit[i])
			{
				case 'Story':
					menuItem.x = 444;
					menuItem.y = 55;
				case 'FFV':
					menuItem.x = 810;
					menuItem.y = 120;
				case 'Progressive':
					menuItem.x = 85;
					menuItem.y = 108;
			}
			menuItems.add(menuItem);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;
			menuItem.updateHitbox();
		}

		changeItem();

		var silly = new TVShader();
		FlxG.camera.setFilters([new ShaderFilter(silly)]);

		super.create();
	}

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (!selectedSomethin)
		{
			if (StoryDone2){
				if (controls.UI_LEFT_P)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'));
					changeItem(-1);
				}

				if (controls.UI_RIGHT_P)
				{
					FlxG.sound.play(Paths.sound('scrollMenu'));
					changeItem(1);
				}
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new MainMenuState());
			}

			if (controls.ACCEPT)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('confirmMenu'));

				switch (optionShit[curSelected])
				{
					case 'Story':
						FreeplayState.chosenFreeplay = ["Week1", "Opus", "Bonus"];
					case 'FFV':
						FreeplayState.chosenFreeplay = [optionShit[curSelected].toLowerCase()];
					case 'Progressive':
						FreeplayState.chosenFreeplay = [optionShit[curSelected].toLowerCase()];
				}
				MusicBeatState.switchState(new FreeplayState());
			}
		}

		super.update(elapsed);
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.color = 0x444444;
			if(!StoryDone2 && (spr.ID == 0 || spr.ID == 2)) {
				spr.color = 0xaa0000;
			}
			if (spr.ID == curSelected)
				spr.color = 0xffffff;
		});
	}
}
