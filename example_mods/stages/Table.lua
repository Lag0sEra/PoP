function onCreatePost()
    setProperty('dad.alpha', 0);
    setProperty('gf.alpha', 0);
end

function onCreate()
    makeLuaSprite('Circle', 'OurTable/Circle', -550, -90);
    addLuaSprite('Circle', false);
    setLuaSpriteScrollFactor('Circle', 1, 1);
end

function onUpdate()
    setProperty('camZooming', false);
    noteTweenAlpha('note movement1', 0, 0, 0.005, 'linear');
    noteTweenAlpha('note movement2', 1, 0, 0.005, 'linear');
    noteTweenAlpha('note movement3', 2, 0, 0.005, 'linear');
    noteTweenAlpha('note movement4', 3, 0, 0.005, 'linear');
end