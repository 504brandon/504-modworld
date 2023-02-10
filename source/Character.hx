package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = FlxG.save.data.antialiasing;

		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('GF_assets','shared',true);
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				loadOffsetFile(curCharacter);

				playAnim('danceRight');

			case 'gf-christmas':
				tex = Paths.getSparrowAtlas('gfChristmas','shared',true);
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				loadOffsetFile(curCharacter);

				playAnim('danceRight');

			case 'gf-car':
				tex = Paths.getSparrowAtlas('gfCar','shared',true);
				frames = tex;
				animation.addByIndices('singUP', 'GF Dancing Beat Hair blowing CAR', [0], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat Hair blowing CAR', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat Hair blowing CAR', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);

				loadOffsetFile(curCharacter);

				playAnim('danceRight');

			case 'gf-pixel':
				tex = Paths.getSparrowAtlas('gfPixel','shared',true);
				frames = tex;
				animation.addByIndices('singUP', 'GF IDLE', [2], "", 24, false);
				animation.addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				loadOffsetFile(curCharacter);

				playAnim('danceRight');

				setGraphicSize(Std.int(width * PlayState.daPixelZoom));
				updateHitbox();
				antialiasing = false;

			case 'gf-ryan':
				tex = Paths.getSparrowAtlas('gfRyan','shared',true);
				frames = tex;
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('sad', 262, 8);
				addOffset('danceLeft', 260, 1);
				addOffset('danceRight', 260, 1);

				playAnim('danceRight');

			case 'gf-whitty':
				tex = Paths.getSparrowAtlas('GF_Standing_Sway','shared',true);
				frames = tex;
				animation.addByPrefix('sad', 'Sad', 24, false);
				animation.addByPrefix('danceLeft', 'Idle Left', 24, false);
				animation.addByPrefix('danceRight', 'Idle Right', 24, false);
				animation.addByPrefix('scared', 'Scared', 24, false);

				addOffset('sad', -140, -153);
				addOffset('danceLeft', -140, -153);
				addOffset('danceRight', -140, -153);
				addOffset('scared', -140, -153);

				playAnim('danceRight');
				case 'gf-whitty-zoom':
					tex = Paths.getSparrowAtlas('GF_Standing_ZOOOOOOOOOOOOOOM','shared',true);
					frames = tex;
					animation.addByPrefix('sad', 'Sad', 24, false);
					animation.addByPrefix('danceLeft', 'Idle Left', 24, false);
					animation.addByPrefix('danceRight', 'Idle Right', 24, false);
					animation.addByPrefix('scared', 'Scared', 24, false);
	
					addOffset('sad', -140, -153);
					addOffset('danceLeft', -140, -153);
					addOffset('danceRight', -140, -153);
					addOffset('scared', -140, -153);
	
					playAnim('danceRight');

			case 'ryan':
				tex = Paths.getSparrowAtlas('Ryan_assets','shared',true);
				frames = tex;
				animation.addByPrefix('idle', 'Ryan idle dance', 24, false);
				animation.addByPrefix('singUP', 'Ryan SING UP', 24, false);
				animation.addByPrefix('singDOWN', 'Ryan SING DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'Ryan SING LEFT', 24, false);
				animation.addByPrefix('singRIGHT', 'Ryan SING RIGHT', 24, false);
				animation.addByPrefix('intro', 'Ryan YOU', 40, false);
				animation.addByPrefix('LEFT', 'YOU turned', 30, false);
				animation.addByPrefix('trouble', 'Ryan TROUBLE', 24, false);
				animation.addByPrefix('cough', 'Ryan COUGH', 24, false);
				animation.addByPrefix('asked', 'Ryan ASKED FOR IT', 35, false);
				animation.addByPrefix('seeya', 'Ryan SEEYA', 24, false);

				addOffset('idle');
				addOffset("singUP", 0, 42);
				addOffset("singRIGHT", 50, 5);
				addOffset("singLEFT", 0, 5);
				addOffset("singDOWN", 0, -20);
				addOffset("intro", -4, -1);
				addOffset("LEFT", 0, 5);
				addOffset("trouble", -8, 0);
				addOffset("cough", 0, 3);
				addOffset("asked", -4, 0);
				addOffset("seeya", 45, 0);
				playAnim('idle');
				
			case 'whitty': // whitty reg (lofight,overhead)
				tex = Paths.getSparrowAtlas('WhittySprites','shared',true);
				frames = tex;
				animation.addByPrefix('idle', 'Idle', 24);
				animation.addByPrefix('singUP', 'Sing Up', 24);
				animation.addByPrefix('singRIGHT', 'Sing Right', 24);
				animation.addByPrefix('singDOWN', 'Sing Down', 24);
				animation.addByPrefix('singLEFT', 'Sing Left', 24);

				addOffset('idle', 0,0 );
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				addOffset("singDOWN", 0, -30);
				
			case 'whittyCrazy': // whitty crazy (ballistic)
				tex = Paths.getSparrowAtlas('WhittyCrazy','shared',true);
				frames = tex;
				animation.addByPrefix('idle', 'Whitty idle dance', 24);
				animation.addByPrefix('singUP', 'Whitty Sing Note UP', 24);
				animation.addByPrefix('singRIGHT', 'whitty sing note right', 24);
				animation.addByPrefix('singDOWN', 'Whitty Sing Note DOWN', 24);
				animation.addByPrefix('singLEFT', 'Whitty Sing Note LEFT', 24);

				addOffset('idle', 50);
				addOffset("singUP", 50, 85);
				addOffset("singRIGHT", 100, -75);
				addOffset("singLEFT", 50);
				addOffset("singDOWN", 75, -150);

			case 'dad':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('DADDY_DEAREST','shared',true);
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24, false);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24, false);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');
			case 'spooky':
				tex = Paths.getSparrowAtlas('spooky_kids_assets','shared',true);
				frames = tex;
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByIndices('danceLeft', 'spooky dance idle', [0, 2, 6], "", 12, false);
				animation.addByIndices('danceRight', 'spooky dance idle', [8, 10, 12, 14], "", 12, false);

				loadOffsetFile(curCharacter);

				playAnim('danceRight');
			case 'mom':
				tex = Paths.getSparrowAtlas('Mom_Assets','shared',true);
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

			case 'mom-car':
				tex = Paths.getSparrowAtlas('momCar','shared',true);
				frames = tex;

				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');
			case 'monster':
				tex = Paths.getSparrowAtlas('Monster_Assets','shared',true);
				frames = tex;
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster left note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster Right note', 24, false);

				loadOffsetFile(curCharacter);
				playAnim('idle');
			case 'monster-christmas':
				tex = Paths.getSparrowAtlas('monsterChristmas','shared',true);
				frames = tex;
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster left note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster Right note', 24, false);

				loadOffsetFile(curCharacter);
				playAnim('idle');
			case 'pico':
				tex = Paths.getSparrowAtlas('Pico_FNF_assetss','shared',true);
				frames = tex;
				animation.addByPrefix('idle', "Pico Idle Dance", 24, false);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				if (isPlayer)
				{
					animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico Note Right Miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT miss', 24, false);
				}
				else
				{
					// Need to be flipped! REDO THIS LATER!
					animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico NOTE LEFT miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico Note Right Miss', 24, false);
				}

				animation.addByPrefix('singUPmiss', 'pico Up note miss', 24);
				animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'bf':
				var tex = Paths.getSparrowAtlas('BOYFRIEND','shared',true);
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, false);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;

			case 'bf-ryan':
				var tex = Paths.getSparrowAtlas('BOYFRIEND','shared',true);
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, false);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				loadOffsetFile('bf');

				playAnim('idle');

				flipX = true;

			case 'bf-christmas':
				var tex = Paths.getSparrowAtlas('bfChristmas','shared',true);
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				flipX = true;
			case 'bf-car':
				var tex = Paths.getSparrowAtlas('bfCar','shared',true);
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				loadOffsetFile(curCharacter);
				playAnim('idle');

				flipX = true;
			case 'bf-pixel':
				frames = Paths.getSparrowAtlas('bfPixel','shared',true);
				animation.addByPrefix('idle', 'BF IDLE', 24, false);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				loadOffsetFile(curCharacter);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;
			case 'bf-pixel-dead':
				frames = Paths.getSparrowAtlas('bfPixelsDEAD','shared',true);
				animation.addByPrefix('singUP', "BF Dies pixel", 24, false);
				animation.addByPrefix('firstDeath', "BF Dies pixel", 24, false);
				animation.addByPrefix('deathLoop', "Retry Loop", 24, false);
				animation.addByPrefix('deathConfirm', "RETRY CONFIRM", 24, false);
				animation.play('firstDeath');

				loadOffsetFile(curCharacter);
				playAnim('firstDeath');
				// pixel bullshit
				setGraphicSize(Std.int(width * 6));
				updateHitbox();
				antialiasing = false;
				flipX = true;

			case 'senpai':
				frames = Paths.getSparrowAtlas('senpai','shared',true);
				animation.addByPrefix('idle', 'Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'SENPAI UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'SENPAI LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'SENPAI RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'SENPAI DOWN NOTE', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;
			case 'senpai-angry':
				frames = Paths.getSparrowAtlas('senpai','shared',true);
				animation.addByPrefix('idle', 'Angry Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'Angry Senpai UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Angry Senpai LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Angry Senpai RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Angry Senpai DOWN NOTE', 24, false);

				loadOffsetFile(curCharacter);
				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;

			case 'spirit':
				frames = Paths.getPackerAtlas('spirit','shared',true);
				animation.addByPrefix('idle', "idle spirit_", 24, false);
				animation.addByPrefix('singUP', "up_", 24, false);
				animation.addByPrefix('singRIGHT', "right_", 24, false);
				animation.addByPrefix('singLEFT', "left_", 24, false);
				animation.addByPrefix('singDOWN', "spirit down_", 24, false);

				loadOffsetFile(curCharacter);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				antialiasing = false;

			case 'parents-christmas':
				frames = Paths.getSparrowAtlas('mom_dad_christmas_assets','shared',true);
				animation.addByPrefix('idle', 'Parent Christmas Idle', 24, false);
				animation.addByPrefix('singUP', 'Parent Up Note Dad', 24, false);
				animation.addByPrefix('singDOWN', 'Parent Down Note Dad', 24, false);
				animation.addByPrefix('singLEFT', 'Parent Left Note Dad', 24, false);
				animation.addByPrefix('singRIGHT', 'Parent Right Note Dad', 24, false);

				animation.addByPrefix('singUP-alt', 'Parent Up Note Mom', 24, false);

				animation.addByPrefix('singDOWN-alt', 'Parent Down Note Mom', 24, false);
				animation.addByPrefix('singLEFT-alt', 'Parent Left Note Mom', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'Parent Right Note Mom', 24, false);

				loadOffsetFile(curCharacter);

				playAnim('idle');

				case 'garcello':
					// GARCELLO ANIMATION LOADING CODE
					tex = Paths.getSparrowAtlas('garcello_assets','shared',true);
					frames = tex;
					animation.addByPrefix('idle', 'garcello idle dance', 24);
					animation.addByPrefix('singUP', 'garcello Sing Note UP', 24);
					animation.addByPrefix('singRIGHT', 'garcello Sing Note RIGHT', 24);
					animation.addByPrefix('singDOWN', 'garcello Sing Note DOWN', 24);
					animation.addByPrefix('singLEFT', 'garcello Sing Note LEFT', 24);
	
					addOffset('idle');
					addOffset("singUP", 0, 0);
					addOffset("singRIGHT", 0, 0);
					addOffset("singLEFT", 0, 0);
					addOffset("singDOWN", 0, 0);
	
					playAnim('idle');
	
				case 'garcellotired':
					// GARCELLO TIRED ANIMATION LOADING CODE
					tex = Paths.getSparrowAtlas('garcellotired_assets','shared',true);
					frames = tex;
					animation.addByPrefix('idle', 'garcellotired idle dance', 24, false);
					animation.addByPrefix('singUP', 'garcellotired Sing Note UP', 24, false);
					animation.addByPrefix('singRIGHT', 'garcellotired Sing Note RIGHT', 24, false);
					animation.addByPrefix('singDOWN', 'garcellotired Sing Note DOWN', 24, false);
					animation.addByPrefix('singLEFT', 'garcellotired Sing Note LEFT', 24, false);
	
					animation.addByPrefix('singUP-alt', 'garcellotired Sing Note UP', 24, false);
					animation.addByPrefix('singRIGHT-alt', 'garcellotired Sing Note RIGHT', 24, false);
					animation.addByPrefix('singLEFT-alt', 'garcellotired Sing Note LEFT', 24, false);
					animation.addByPrefix('singDOWN-alt', 'garcellotired cough', 24, false);
	
					addOffset('idle');
					addOffset("singUP", 0, 0);
					addOffset("singRIGHT", 0, 0);
					addOffset("singLEFT", 0, 0);
					addOffset("singDOWN", 0, 0);
					addOffset("singUP-alt", 0, 0);
					addOffset("singRIGHT-alt", 0, 0);
					addOffset("singLEFT-alt", 0, 0);
					addOffset("singDOWN-alt", 0, 0);
	
					playAnim('idle');
	
				case 'garcellodead':
					// GARCELLO DEAD ANIMATION LOADING CODE
					tex = Paths.getSparrowAtlas('garcellodead_assets','shared',true);
					frames = tex;
					animation.addByPrefix('idle', 'garcello idle dance', 24);
					animation.addByPrefix('singUP', 'garcello Sing Note UP', 24);
					animation.addByPrefix('singRIGHT', 'garcello Sing Note RIGHT', 24);
					animation.addByPrefix('singDOWN', 'garcello Sing Note DOWN', 24);
					animation.addByPrefix('singLEFT', 'garcello Sing Note LEFT', 24);
	
					animation.addByPrefix('garTightBars', 'garcello coolguy', 15);
	
					addOffset('idle');
					addOffset("singUP", 0, 0);
					addOffset("singRIGHT", 0, 0);
					addOffset("singLEFT", 0, 0);
					addOffset("singDOWN", 0, 0);
					addOffset("garTightBars", 0, 0);
	
					playAnim('idle');
	
				case 'garcelloghosty':
					// GARCELLO DEAD ANIMATION LOADING CODE
					tex = Paths.getSparrowAtlas('garcelloghosty_assets','shared',true);
					frames = tex;
					animation.addByPrefix('idle', 'garcello idle dance', 24);
					animation.addByPrefix('singUP', 'garcello Sing Note UP', 24);
					animation.addByPrefix('singRIGHT', 'garcello Sing Note RIGHT', 24);
					animation.addByPrefix('singDOWN', 'garcello Sing Note DOWN', 24);
					animation.addByPrefix('singLEFT', 'garcello Sing Note LEFT', 24);
	
					animation.addByPrefix('garFarewell', 'garcello coolguy', 15);
	
					addOffset('idle');
					addOffset("singUP", 0, 0);
					addOffset("singRIGHT", 0, 0);
					addOffset("singLEFT", 0, 0);
					addOffset("singDOWN", 0, 0);
					addOffset("garTightBars", 0, 0);
	
					playAnim('idle');

				case 'sans':
					tex = Paths.getSparrowAtlas('Sans_assets','shared',true);
					frames = tex;
					animation.addByPrefix('idle', 'sans Idle Dance0', 24);
					animation.addByPrefix('singUP', 'sans Up Note0', 24);
					animation.addByPrefix('singRIGHT', 'sans Right Note0', 24);
					animation.addByPrefix('singDOWN', 'sans Down Note0', 24);
					animation.addByPrefix('singLEFT', 'sans Left Note0', 24);

					addOffset('idle');
					addOffset("singUP", 14, 100);
					addOffset("singRIGHT", -2, -6);
					addOffset("singLEFT", 95, -1);
					addOffset("singDOWN", 45, 6);

					playAnim('idle');


				case 'sans2':
					tex = Paths.getSparrowAtlas('Sans_assets2','shared',true);
					frames = tex;
					animation.addByPrefix('idle', 'sans Idle Dance', 24);
					animation.addByPrefix('singUP', 'sans Up Note', 24);
					animation.addByPrefix('singRIGHT', 'sans Right Note', 24);
					animation.addByPrefix('singDOWN', 'sans Down Note', 24);
					animation.addByPrefix('singLEFT', 'sans Left Note', 24);

					addOffset('idle');
					addOffset("singUP", 14, 100);
					addOffset("singRIGHT", -2, -6);
					addOffset("singLEFT", 95, -1);
					addOffset("singDOWN", 45, 6);

					playAnim('idle');

				case 'sans3':
					tex = Paths.getSparrowAtlas('Sans_assets3','shared',true);
					frames = tex;
					animation.addByPrefix('idle', 'sans Idle Dance 3', 24);
					animation.addByPrefix('singUP', 'sans Up Note 3', 24);
					animation.addByPrefix('singRIGHT', 'sans Right Note 3', 24);
					animation.addByPrefix('singDOWN', 'sans Down Note 3', 24);
					animation.addByPrefix('singLEFT', 'sans Left Note 3', 24);

					animation.addByPrefix('singUP-alt', 'sans Up Note 4', 24);
					animation.addByPrefix('singRIGHT-alt', 'sans Right Note 4', 24);
					animation.addByPrefix('singDOWN-alt', 'sans Down Note 4', 24);
					animation.addByPrefix('singLEFT-alt', 'sans Left Note 4', 24);

					addOffset('idle');
					addOffset("singUP", 14, 100);
					addOffset("singRIGHT", -2, -6);
					addOffset("singLEFT", 95, -1);
					addOffset("singDOWN", 45, 6);
					addOffset("singUP-alt", 14, 100);
					addOffset("singRIGHT-alt", -2, -6);
					addOffset("singLEFT-alt", 95, -1);
					addOffset("singDOWN-alt", 45, 6);

					playAnim('idle');

				case 'tankman':
					tex = Paths.getSparrowAtlas('tankmanCaptain','shared',true);
					frames = tex;
					animation.addByPrefix('idle', "Tankman Idle Dance", 24);
					animation.addByPrefix('oldSingUP', 'Tankman UP note ', 24, false);
					animation.addByPrefix('singUP', 'Tankman UP note ', 24, false);
					animation.addByPrefix('singDOWN-alt', 'PRETTY GOOD tankman instance 1', 24);
					animation.addByPrefix('singDOWN', 'Tankman DOWN note ', 24, false);
					animation.addByPrefix('singLEFT', 'Tankman Right Note ', 24, false);
					animation.addByPrefix('singRIGHT', 'Tankman Note Left ', 24, false);
			
					animation.addByPrefix('ughAnim', 'TANKMAN UGH', 24, false);

					loadOffsetFile(curCharacter);

					playAnim('idle');

					flipX = true;
				
				case 'bf-fleetway-p':
					tex = Paths.getSparrowAtlas('fleetway fw','shared',true);
					frames = tex;
					animation.addByPrefix('idle', 'Fleet left0', 1);
					animation.addByPrefix('singUP', 'Fleet up0', 24);
					animation.addByPrefix('singRIGHT', 'Fleet right0', 24);
					animation.addByPrefix('singDOWN', 'Fleet down0', 24);
					animation.addByPrefix('singLEFT', 'Fleet left0', 24);
	
					addOffset('idle', 35,22);
					addOffset("singUP", -22,-31);
					addOffset("singRIGHT", -20,14);
					addOffset("singLEFT", 35,22);
					addOffset("singDOWN", 0,0);

					flipX = true;

				case 'bf-sonic-p':
					tex = Paths.getSparrowAtlas('sonic fw','shared',true);
					frames = tex;
					animation.addByPrefix('idle', 'Sonic idle', 24);
					animation.addByPrefix('singUP', 'Sonic up0', 24);
					animation.addByPrefix('singRIGHT', 'Sonic right0', 24);
					animation.addByPrefix('singDOWN', 'Sonic down0', 24);
					animation.addByPrefix('singLEFT', 'Sonic left0', 24);

					addOffset('idle', 0,0 );
					addOffset("singUP", -30,-9);
					addOffset("singRIGHT", -29,-1);
					addOffset("singLEFT", 8,3);
					addOffset("singDOWN", 0,0);

					flipX = true;
		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	public function loadOffsetFile(character:String, library:String = 'shared')
	{
		var offset:Array<String> = CoolUtil.coolTextFile(Paths.txt('images/characters/' + character + "Offsets", library));

		for (i in 0...offset.length)
		{
			var data:Array<String> = offset[i].split(' ');
			addOffset(data[0], Std.parseInt(data[1]), Std.parseInt(data[2]));
		}
	}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				trace('dance');
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance(forced:Bool = false)
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'gf' | 'gf-christmas' | 'gf-car' | 'gf-pixel' | 'gf-whitty' | 'gf-ryan' | 'gf-whitty-zoom':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'spooky':
					danced = !danced;

					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');
				default:
					playAnim('idle', forced);
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
