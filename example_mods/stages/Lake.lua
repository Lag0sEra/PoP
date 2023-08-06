function onCreatePost()
    setProperty('gf.visible', false);
end

function onCreate()

    if not lowQuality then
    makeLuaSprite('sky', 'Frog/Lake sky', -550, -160);
    addLuaSprite('sky', false);
    setLuaSpriteScrollFactor('sky', 0.4, 1);

    makeLuaSprite('backs', 'Frog/Lake hills', -550, -160);
    addLuaSprite('backs', false);
    setLuaSpriteScrollFactor('backs', 0.5, 1);

    makeLuaSprite('back', 'Frog/Lake trees', -750, -160);
    addLuaSprite('back', false);
    setLuaSpriteScrollFactor('back', 0.6, 1);

    makeLuaSprite('middle', 'Frog/Lake water', -550, -360); -- 410, 30
    addLuaSprite('middle', false);
    setLuaSpriteScrollFactor('middle', 0.8, 1);
    
    makeLuaSprite('front','Frog/Lake ground', -620, -400);
    addLuaSprite('front', false);
-- This previous line of code was the fucking bane of my existence.
-- Cup. You are mt best friend, and I love you.
-- But adding in this line of code made me want to rip my own fucking hair out.
-- Cheers.
-- ~ River
    makeAnimatedLuaSprite('Lake_Lillie', 'Frog/Lake_Lillie', 410, 30);
    addAnimationByPrefix('Lake_Lillie', 'Idle', 'Lake_Lillie', 24, false);
    addLuaSprite('Lake_Lillie', false);
    setLuaSpriteScrollFactor('Lake_Lillie', 0.8, 1);
    end

--    makeLuaSprite('bg','Frog/Low lake', -620, -400);
--    addLuaSprite('bg', false);

    if lowQuality then
    makeLuaSprite('bg','Frog/Low lake', -620, -400);
    addLuaSprite('bg', false);

    end

end

function onBeatHit()
    --debugPrint('I hate you, Lillie.')
    objectPlayAnimation('Lake_Lillie', 'Idle', true);
end