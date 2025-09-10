shader_type canvas_item;

//uniform vec4 board1_color : source_color = vec4(0.39, 0.69, 1.0, 1.0); // light blue
//uniform vec4 board2_color : source_color = vec4(0.0, 0.57, 0.0, 1.0);  // green
//uniform vec4 board3_color : source_color = vec4(0.86, 0.14, 0.08, 1.0); // red

uniform float outline_thickness = 10.0;

void fragment() {
	vec4 input_color = texture(TEXTURE, UV);
	bool is_foreground = (input_color.r > .6 || input_color.g > .6 || input_color.b > .6);

	// Sample nearby pixels to see if any differ
	float px = outline_thickness / float(textureSize(TEXTURE, 0).x);
	float py = outline_thickness / float(textureSize(TEXTURE, 0).y);

	bool neighbor_diff = false;
	for (int x = -1; x <= 1; x++) {
		for (int y = -1; y <= 1; y++) {
			vec2 offset = vec2(float(x) * px, float(y) * py);
			vec4 neighbor = texture(TEXTURE, UV + offset);
			bool neighbor_fg = (neighbor.r > .6 || neighbor.g > .6 || neighbor.b > .6);
			if (neighbor_fg != is_foreground) {
				neighbor_diff = true;
				}
			}
	}

	if (neighbor_diff) {
		COLOR = vec4(0.0);
	} 
	else {
		if (is_foreground) {
			COLOR = vec4(input_color.r, input_color.g, input_color.r, 0.0);
		} 
		else {
			COLOR = vec4(0.95, 0.95, 0.95, 1.0);
		}
	}
}