LBGX = -350
LBGY = -350

function onCreatePost()
	if songName == 'Akyuse' then
	-- debugPrint("SHOW ME YOUR BUTTHOLE");
	-- debugPrint("I'M GREEK, N___A");
	setProperty('gf.alpha', 0);
	end
end

function onCreate()

	if not lowQuality then
	makeLuaSprite('Umbrella', 'Normal/umbrella and bottle', LBGX, LBGY);
	makeLuaSprite('Cloud 3', 'Normal/cloud3', LBGX, LBGY);
	makeLuaSprite('Cloud 2', 'Normal/cloud2', LBGX, LBGY);
	makeLuaSprite('Cloud 1', 'Normal/cloud1', LBGX, LBGY);
	makeLuaSprite('Light', 'Normal/Lighting', LBGX, LBGY);
	makeLuaSprite('Palm Tree', 'Normal/palm tree', LBGX, LBGY);
	end

	makeLuaSprite('Wet Sand', 'Normal/wet sand', LBGX, LBGY);
	makeLuaSprite('Water', 'Normal/water', LBGX, LBGY);
	makeLuaSprite('Shore', 'Normal/shore', LBGX, LBGY);
	makeLuaSprite('Sand', 'Normal/sand', LBGX, LBGY);
	makeLuaSprite('Sky', 'Normal/Sky', LBGX, LBGY);

	addLuaSprite('Sky', false);
	addLuaSprite('Cloud 3', false);
	addLuaSprite('Cloud 2', false);
	addLuaSprite('Cloud 1', false);
	addLuaSprite('Water', false);
	addLuaSprite('Sand', false);
	addLuaSprite('Wet Sand', false);
	addLuaSprite('Shore', false);
	addLuaSprite('Umbrella', false);
	addLuaSprite('Palm Tree', false);
	addLuaSprite('Light', true);

	setScrollFactor('Light', 0.75, 1);

	if not lowQuality and songName == 'Spines' then
	makeAnimatedLuaSprite('Crowd Left 1', 'Crowd/crowd_left', -100, 150);
	makeAnimatedLuaSprite('Crowd Right 1', 'Crowd/crowd_right', 1100, 200);
	addAnimationByPrefix('Crowd Left 1', 'Idle', 'left side', 24, false);
	addAnimationByPrefix('Crowd Right 1', 'Idle', 'right side', 24, false);
	addLuaSprite('Crowd Left 1', false);
	addLuaSprite('Crowd Right 1', false);
	setProperty('Crowd Left 1.scale.x', getProperty('Crowd Left 1.scale.x') -0.2);
	setProperty('Crowd Left 1.scale.y', getProperty('Crowd Left 1.scale.y') -0.2);
	setProperty('Crowd Right 1.scale.x', getProperty('Crowd Left 1.scale.x') -0.025);
	setProperty('Crowd Right 1.scale.y', getProperty('Crowd Left 1.scale.y') -0.025);
	--debugPrint("Beach Party 1");
	end

	if not lowQuality and songName == 'Photosynthesis' then
	makeAnimatedLuaSprite('Crowd Left 2', 'Crowd/crowd_left_phase2', -100, 150);
	makeAnimatedLuaSprite('Crowd Right 2', 'Crowd/crowd_right_phase2', 1100, 200);
	addAnimationByPrefix('Crowd Left 2', 'Idle', 'left side', 24, false);
	addAnimationByPrefix('Crowd Right 2', 'Idle', 'right side', 24, false);
	addLuaSprite('Crowd Left 2', false);
	addLuaSprite('Crowd Right 2', false);
	setProperty('Crowd Left 2.scale.x', getProperty('Crowd Left 2.scale.x') -0.2);
	setProperty('Crowd Left 2.scale.y', getProperty('Crowd Left 2.scale.y') -0.2);
	setProperty('Crowd Right 2.scale.x', getProperty('Crowd Left 2.scale.x') -0.025);
	setProperty('Crowd Right 2.scale.y', getProperty('Crowd Left 2.scale.y') -0.025);
	--debugPrint("Beach Party 2");
	end

end

function onBeatHit()
	objectPlayAnimation('Crowd Left 1', 'Idle', true);
	objectPlayAnimation('Crowd Right 1', 'Idle', true);
	objectPlayAnimation('Crowd Left 2', 'Idle', true);
	objectPlayAnimation('Crowd Right 2', 'Idle', true);
end