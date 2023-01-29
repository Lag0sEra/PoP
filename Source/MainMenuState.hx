package;

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
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;

using StringTools;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.6.3'; // This is also used for Discord RPC
	public var curSelected:Int = 0;

	public var mbgs:FlxSprite = new FlxSprite();
	public var mbgn:FlxSprite = new FlxSprite();
	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;

	var optionShit:Array<String> = ['story', 'freeplay', 'options', 'credits', 'donate'];

	var camFollow:FlxObject;
	var camFollowPos:FlxObject;
	var debugKeys:Array<FlxKey>;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement);
		FlxCamera.defaultCameras = [camGame];
		var soom:Float = 1.025;
		camGame.zoom = soom;
		camAchievement.zoom = soom;

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut = new TransitionData(NONE, FlxColor.TRANSPARENT, 3);

		persistentUpdate = persistentDraw = true;

		var mbg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('mbg'));
		mbg.setGraphicSize(Std.int(mbg.width * 1.05));
		mbg.screenCenter();
		mbg.antialiasing = ClientPrefs.globalAntialiasing;
		var mbgc:FlxSprite = new FlxSprite().loadGraphic(Paths.image('mbgc'));
		mbgc.setGraphicSize(Std.int(mbgc.width * 1.05));
		mbgc.screenCenter();
		mbgc.antialiasing = ClientPrefs.globalAntialiasing;
		mbgs.frames = Paths.getSparrowAtlas('mainmenu/screens');
		mbgs.animation.addByPrefix('screen', "screens", 0);
		mbgs.animation.play('screen');
		mbgs.setGraphicSize(Std.int(mbgs.width * 1.05));
		mbgs.screenCenter();
		mbgs.antialiasing = ClientPrefs.globalAntialiasing;
		mbgn.frames = Paths.getSparrowAtlas('mainmenu/noise');
		mbgn.animation.addByPrefix('nois', "noise", 24, true);
		mbgn.alpha = 0.1;
		mbgn.animation.play('nois');
		mbgn.setGraphicSize(Std.int(mbgn.width * 1.05));
		mbgn.screenCenter();
		mbgn.antialiasing = ClientPrefs.globalAntialiasing;
		add(mbg);
		add(mbgc);
		add(mbgs);
		add(mbgn);
		
		camFollow = new FlxObject(0, 0, 1, 1);
		camFollowPos = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		add(camFollowPos);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 0.45;

		for (i in 0...optionShit.length)
		{
			var menuItem:FlxSprite = new FlxSprite();
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " idle", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " selected", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			switch (optionShit[i])
			{
				case 'story':
					menuItem.x = 140;
					menuItem.y = 116;
				case 'freeplay':
					menuItem.x = 140;
					menuItem.y = 166;
				case 'options':
					menuItem.x = 140;
					menuItem.y = 346;
				case 'credits':
					menuItem.x = 140;
					menuItem.y = 396;
				case 'donate':
					menuItem.x = 918;
					menuItem.y = 214;

			}
			menuItems.add(menuItem);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;
			menuItem.updateHitbox();
		}
		camFollow.screenCenter();
		camFollowPos.screenCenter();

		FlxG.camera.follow(camFollowPos, null, 1);

		var versionShit:FlxText = new FlxText(16, FlxG.height - 52, 0, "Psych Engine v" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(16, FlxG.height - 32, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		Achievements.loadAchievements();
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18)
		{
			var achieveID:Int = Achievements.getAchievementIndex('friday_night_play');
			if (!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2]))
			{ // It's a friday night. WEEEEEEEEEEEEEEEEEE
				Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				giveAchievement();
				ClientPrefs.saveSettings();
			}
		}
		#end

		super.create();
	}

	#if ACHIEVEMENTS_ALLOWED
	// Unlocks "Freaky on a Friday Night" achievement
	function giveAchievement()
	{
		add(new AchievementObject('friday_night_play', camAchievement));
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
		trace('Giving achievement "friday_night_play"');
	}
	#end

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}
		if(mbgn.alpha > 0.1)
			mbgn.alpha -= 0.02;

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 2, 0, 1);
		camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));

		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'donate')
				{
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					// if(ClientPrefs.flashing) FlxFlicker.flicker(magenta, 1.1, 0.15, false);

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 0.4, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						else
						{
							camFollow.x -= 40;
							camFollow.y -= 60;
							FlxTween.tween(camGame, {zoom: 0.99}, .3, {
								ease: FlxEase.sineOut,
								onComplete: function(twn:FlxTween)
								{
									FlxTween.tween(camGame, {zoom: 10}, 1.5, {
										ease: FlxEase.sineIn,
										onStart: function(twn:FlxTween)
										{
											FlxG.camera.fade(FlxColor.BLACK, 1.3);
											var daChoice:String = optionShit[curSelected];

											switch (daChoice)
											{
												case 'story':
													MusicBeatState.switchState(new StoryMenuState());
												case 'freeplay':
													MusicBeatState.switchState(new PreFreeplayState());
												case 'credits':
													MusicBeatState.switchState(new CreditsState());
												case 'options':
													MusicBeatState.switchState(new options.OptionsState());
											}
										}
									});
								}
							});
						}
					});
				}
			}
			#if desktop
			else if (FlxG.keys.anyJustPressed(debugKeys))
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
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

		if(curSelected >= 0 && curSelected < 4 && curSelected != mbgs.animation.curAnim.curFrame){
			mbgn.alpha = 1;
			mbgs.animation.curAnim.curFrame = curSelected;
		}

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.updateHitbox();

			if (spr.ID == curSelected)
				spr.animation.play('selected');
		});
	}
}