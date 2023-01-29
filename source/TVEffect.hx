package;

// STOLEN FROM HAXEFLIXEL DEMO LOL
import flixel.system.FlxAssets.FlxShader;

class TVEffect
{
	public var shader(default, null):TVShader = new TVShader();

	public function new():Void
	{
		shader.iTime.value = [0];
	}

	public function update(elapsed:Float):Void
	{
		shader.iTime.value[0] += elapsed;
	}

	public function setValue(value:Float):Void
	{
		shader.iTime.value[0] = value;
	}
}

class TVShader extends FlxShader
{
	@:glFragmentSource('
		#pragma header
		vec2 uv = openfl_TextureCoordv.xy;
		vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
		vec2 iResolution = openfl_TextureSize;
		uniform float iTime;
		#define iChannel0 bitmap
		#define texture flixel_texture2D
		#define fragColor gl_FragColor
		#define mainImage main
		vec2 crt(vec2 coord, float bend)
		{
			coord = (coord - 0.5) * 2.0;
			coord *= 0.5;	
			coord.x *= 1.0 + pow((abs(coord.y) / bend), 2.0);
			coord.y *= 1.0 + pow((abs(coord.x) / bend), 2.0);
			coord  = (coord / 1.0) + 0.5;
			return coord;
		}

		float vignette(vec2 uv) {
			uv = (uv - 0.5) * 0.98;
			return clamp(pow(cos(uv.x * 3.1415), 1.2) * pow(cos(uv.y * 3.1415), 1.2) * 50.0, 0.0, 1.0);
		}

		void mainImage()
		{
			vec2 uv = fragCoord.xy / iResolution.xy;
			vec4 color;
			color.r = texture(iChannel0, crt(uv, 2.0)).r;
			color.g = texture(iChannel0, crt(uv, 2.0)).g;
			color.b = texture(iChannel0, crt(uv, 2.0)).b;
			fragColor = color * vignette(uv);
		}
	')
	public function new()
	{
		super();
	}
}
