function onStepHit()
	if stepHitFuncs[curStep] then 
		stepHitFuncs[curStep]()
	end
end

stepHitFuncs = {

	-- Cactus
	[112] = function()
		setProperty('defaultCamZoom', 0.825);
	end,

	[124] = function()
		setProperty('defaultCamZoom', 1);
	end,

	[128] = function()
		setProperty('defaultCamZoom', 0.725);
	end,

}