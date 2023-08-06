function onCreatePost()
	--setProperty('dad.alpha', 0);
	--setProperty('bf.alpha', 0);
	setProperty('gf.alpha', 0);
end

function onCreate()

	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-beach');

	if not lowQuality then
	makeLuaSprite('WTF', 'xodiabg/xwhateverthefuckthisis', 650, -15);
	makeLuaSprite('Parrisol', 'xodiabg/xparrisol', -105, 350);
	makeLuaSprite('Hand', 'xodiabg/xhand', 1270, 175);

	makeLuaSprite('D1', 'xodiabg/xeffect1', 0, 0);
	makeLuaSprite('D2', 'xodiabg/xeffect2', 0, 0);
	end

	makeLuaSprite('Clouds', 'xodiabg/xclouds', -100, -15);
	makeLuaSprite('Sand', 'xodiabg/xsand', -100, 550);
	makeLuaSprite('Sun', 'xodiabg/xsun', 625, 100);
	makeLuaSprite('Sky', 'xodiabg/xsky', 275, 200);

	addLuaSprite('Sky', false);
	addLuaSprite('Sun', false);
	addLuaSprite('WTF', false);
	addLuaSprite('Sand', false);
	addLuaSprite('Clouds', false);
	addLuaSprite('Parrisol', false);
	addLuaSprite('Hand', false);

	addLuaSprite('D1', true);
	addLuaSprite('D2', true);

	setScrollFactor('WTF', 1.25, 1);

	setObjectCamera('D1', 'HUD');
	setObjectCamera('D2', 'HUD');

    setProperty('Sun.scale.x', getProperty('Sun.scale.x') +0.25);
    setProperty('Sun.scale.y', getProperty('Sun.scale.y') +0.25);

    setProperty('Sky.scale.x', getProperty('Sky.scale.x') +1.25);
    setProperty('Sky.scale.y', getProperty('Sky.scale.y') +1.25);

end