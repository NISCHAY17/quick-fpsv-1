shader_type spatial;

uniform sampler2D text_sampler;
uniform vec4 screen_color : source_color;
uniform float pixel_size = 20.0;

void fragment() {
	vec2 scaled_uv = round(UV * pixel_size) / pixel_size;

	float text = texture(text_sampler, scaled_uv).r;

	ALBEDO = vec3(text);
}