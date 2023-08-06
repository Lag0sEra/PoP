function onStepHit()
	if stepHitFuncs[curStep] then 
		stepHitFuncs[curStep]()
	end
end

stepHitFuncs = {

	-- Cactus
	[320] = function()
		setProperty('defaultCamZoom', 0.825);
	end,

	[336] = function()
		setProperty('defaultCamZoom', 0.725);
	end,

	-- BF
	[352] = function()
		setProperty('defaultCamZoom', 0.825);
	end,

	[368] = function()
		setProperty('defaultCamZoom', 0.725);
	end,

	-- Cactus
	[384] = function()
		setProperty('defaultCamZoom', 0.825);
	end,

	[400] = function()
		setProperty('defaultCamZoom', 0.725);
	end,

	-- BF
	[416] = function()
		setProperty('defaultCamZoom', 0.825);
	end,

	[432] = function()
		setProperty('defaultCamZoom', 0.725);
	end,

	-- ________________________________________________

	-- Cactus
	[448] = function()
		setProperty('defaultCamZoom', 0.725);
	end,

	[460] = function()
		setProperty('defaultCamZoom', 0.750);
	end,

	[462] = function()
		setProperty('defaultCamZoom', 0.725);
	end,

	[464] = function()
		setProperty('defaultCamZoom', 0.825);
	end,

	[472] = function()
		setProperty('defaultCamZoom', 0.750);
	end,

	-- BF
	[480] = function()
		setProperty('defaultCamZoom', 0.725);
	end,

	[492] = function()
		setProperty('defaultCamZoom', 0.750);
	end,

	[494] = function()
		setProperty('defaultCamZoom', 0.725);
	end,

	[496] = function()
		setProperty('defaultCamZoom', 0.750);
	end,

	[504] = function()
		setProperty('defaultCamZoom', 0.825);
	end,

	-- ________________________________________________

	-- Cactus
	[512] = function()
		setProperty('defaultCamZoom', 0.725);
	end,

	[524] = function()
		setProperty('defaultCamZoom', 0.750);
	end,

	[526] = function()
		setProperty('defaultCamZoom', 0.725);
	end,

	[528] = function()
		setProperty('defaultCamZoom', 0.825);
	end,

	[536] = function()
		setProperty('defaultCamZoom', 1);
	end,

	-- BF
	[544] = function()
		setProperty('defaultCamZoom', 0.725);
	end,

	[556] = function()
		setProperty('defaultCamZoom', 0.750);
	end,

	[558] = function()
		setProperty('defaultCamZoom', 0.725);
	end,

	[560] = function()
		setProperty('defaultCamZoom', 0.750);
	end,

	[568] = function()
		setProperty('defaultCamZoom', 0.825);
	end,

	-- ________________________________________________

	[576] = function()
		setProperty('defaultCamZoom', 0.725);
	end,

	[592] = function()
		setProperty('defaultCamZoom', 0.825);
	end,

	[608] = function()
		setProperty('defaultCamZoom', 0.725);
	end,

	[624] = function()
		setProperty('defaultCamZoom', 0.825);
	end,
	
	-- ________________________________________________

	[640] = function()
		setProperty('defaultCamZoom', 0.725);
	end,

	[656] = function()
		setProperty('defaultCamZoom', 0.825);
	end,

	[672] = function()
		setProperty('defaultCamZoom', 0.725);
	end,

	[688] = function()
		setProperty('defaultCamZoom', 0.8);
	end,

	[696] = function()
		setProperty('defaultCamZoom', 0.8);
	end,

	[700] = function()
		setProperty('defaultCamZoom', 0.9);
	end,

	[704] = function()
		setProperty('defaultCamZoom', 1);
	end,

	-- ________________________________________________


	[736] = function()
		setProperty('defaultCamZoom', 0.725);
	end,

}