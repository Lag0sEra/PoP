--easy script configs
IntroTextSize = 20	--Size of the text for the Now Playing thing.
IntroSubTextSize = 20 --size of the text for the Song Name.
IntroAuthorTextSize = 20
local IntroTagColor = 'e61717'	--Color of the tag at the end of the box.
IntroTagWidth = 40	--Width of the box's tag thingy.
--easy script configs

--actual script
function onCreatePost()

	IntroTagColor = 'e61717'	-- Default color of the tag at the end of the box.

	--the box
	makeLuaSprite('JukeBox', 'BoxBox', -728, -160)
	setObjectCamera('JukeBox', 'other')
	addLuaSprite('JukeBox', true)
	setProperty('JukeBox.scale.x', getProperty('JukeBox.scale.x') -0.5);
	setProperty('JukeBox.scale.y', getProperty('JukeBox.scale.y') -0.5);
	
	--the text for the "Now Playing" bit
	makeLuaText('JukeBoxText', 'Now Playing:', 350, -305-IntroTagWidth, 30)
	setTextAlignment('JukeBoxText', 'left')
	setObjectCamera('JukeBoxText', 'other')
	setTextSize('JukeBoxText', IntroTextSize)
	addLuaText('JukeBoxText')
	
	--text for the song name
	makeLuaText('JukeBoxSubText', songName, 350, -305-IntroTagWidth, 60)
	setTextAlignment('JukeBoxSubText', 'left')
	setObjectCamera('JukeBoxSubText', 'other')
	setTextSize('JukeBoxSubText', IntroSubTextSize)
	addLuaText('JukeBoxSubText')
	setTextColor('JukeBoxSubText', '00FE00');

	makeLuaText('JukeBoxAuthor', songName, 300, -305-IntroTagWidth, 100)
	setTextAlignment('JukeBoxAuthor', 'left')
	setObjectCamera('JukeBoxAuthor', 'other')
	setTextSize('JukeBoxAuthor', IntroAuthorTextSize)
	addLuaText('JukeBoxAuthor')
end

--motion functions
function onEvent(n,v,b)
	if n == 'Intro' then
		if v ~= '' then
			setTextString('JukeBoxSubText',v)
		end
		if b ~= '' then
			setTextString('JukeBoxAuthor',b)
		end
		-- Inst and Vocals start playing, songPosition = 0
		doTweenX('MoveInOne', 'JukeBoxTag', -180, 1, 'CircInOut')
		doTweenX('MoveInTwo', 'JukeBox', -180, 1, 'CircInOut')
		doTweenX('MoveInThree', 'JukeBoxText', 50, 1, 'CircInOut')
		doTweenX('MoveInFour', 'JukeBoxSubText', 50, 1, 'CircInOut')
		doTweenX('MoveInFive', 'JukeBoxAuthor', 50, 1, 'CircInOut')
		
		runTimer('JukeBoxWait', 3, 1)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxWait' then
		doTweenX('MoveOutOne', 'JukeBoxTag', -728, 1.5, 'CircInOut')
		doTweenX('MoveOutTwo', 'JukeBox', -728, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'JukeBoxText', -728, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxSubText', -728, 1.5, 'CircInOut')
		doTweenX('MoveOutFive', 'JukeBoxAuthor', -728, 1.5, 'CircInOut')
	end
end