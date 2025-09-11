shader_type spatial;

uniform vec3 white : source_color = vec3(1.0); //white
uniform vec3 black : source_color = vec3(0.0); //black
uniform vec3 edge_color : source_color; //Around 231,207,180
uniform vec3 highlight : source_color = vec3(3,.9,0); // Would love to use this color-feel for the highlighted moves
uniform float tile_size = 1.0;
uniform float transparency: hint_range(0,1,.05);

varying vec3 v_world_pos;

void vertex() {
   v_world_pos = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
}

void fragment() {	
	vec3 g = floor(v_world_pos / tile_size);
    float parity = mod(g.x + g.y + g.z, 2.0);
    ALBEDO = mix(white, black, parity);
	ALPHA = transparency;
	
	if (v_world_pos.x < -6.0 || v_world_pos.z < -4.0 || v_world_pos.x > 6.0 || v_world_pos.z > 4.0){
		ALBEDO = edge_color;
		METALLIC = .9;
		//ALBEDO = highlight;
	}
}