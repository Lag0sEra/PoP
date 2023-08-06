LBGX = -350
LBGY = -350

--function onCreatePost()
--	setProperty('dad.alpha', 0);
--end

function onCreate()

	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-beach');

	if not lowQuality then
	makeLuaSprite('BackCloud3', 'Stormy/back cloud3', LBGX, LBGY);
	makeLuaSprite('BackCloud2', 'Stormy/back cloud2', LBGX, LBGY);
	makeLuaSprite('BackCloud1', 'Stormy/back cloud1', LBGX, LBGY);
	makeLuaSprite('Umbrella', 'Stormy/umbrella stormy', LBGX, LBGY);
	makeLuaSprite('Cloud 3', 'Stormy/cloud3 stormy', LBGX, LBGY);
	makeLuaSprite('Cloud 2', 'Stormy/cloud2 stormy', LBGX, LBGY);
	makeLuaSprite('Cloud 1', 'Stormy/cloud1 stormy', LBGX, LBGY);
	makeLuaSprite('Palm Tree', 'Stormy/tree stormy', LBGX, LBGY);
	end

	makeLuaSprite('Wet Sand', 'Stormy/wet sand', LBGX, LBGY);
	makeLuaSprite('Water', 'Stormy/water stormy', LBGX, LBGY);
	makeLuaSprite('Shore', 'Stormy/shore', LBGX, LBGY);
	makeLuaSprite('Sand', 'Stormy/sand stormy', LBGX, LBGY);
	makeLuaSprite('Sky', 'Stormy/SKY stormy', LBGX, LBGY);

	addLuaSprite('Sky', false);
	addLuaSprite('BackCloud3', false);
	addLuaSprite('BackCloud2', false);
	addLuaSprite('BackCloud1', false);
	addLuaSprite('Cloud 3', false);
	addLuaSprite('Cloud 2', false);
	addLuaSprite('Cloud 1', false);
	addLuaSprite('Water', false);
	addLuaSprite('Sand', false);
	addLuaSprite('Wet Sand', false);
	addLuaSprite('Shore', false);
	addLuaSprite('Umbrella', false);
	addLuaSprite('Palm Tree', false);

end