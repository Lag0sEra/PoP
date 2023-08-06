function onCreatePost()
    precacheImage('characters/Xoida-throne');
end

function onCreate()
    makeLuaSprite('opus','Throne room', -550, -500);
    addLuaSprite('opus', false);
end