function onCreatePost()
    setProperty('gf.alpha', 0);
end

function onUpdate()
    setProperty('camZooming', false);
    noteTweenAlpha('note movement1', 0, 0, 0.005, 'linear');
    noteTweenAlpha('note movement2', 1, 0, 0.005, 'linear');
    noteTweenAlpha('note movement3', 2, 0, 0.005, 'linear');
    noteTweenAlpha('note movement4', 3, 0, 0.005, 'linear');
end