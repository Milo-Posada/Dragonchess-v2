shader_type spatial;
render_mode unshaded;

uniform vec4 outline_color : source_color;
uniform float outline_width = 1;
uniform sampler2D DEPTH_TEXTURE : hint_depth_texture, filter_linear_mipmap;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
    vec2 pixel_size = 1.0 / VIEWPORT_SIZE;

    // Get current depth
    float my_depth = texture(DEPTH_TEXTURE, SCREEN_UV).r;

    // Default: just sample the screen
    vec4 base_col = texture(SCREEN_TEXTURE, SCREEN_UV);
    ALBEDO = base_col.rgb;
    ALPHA = base_col.a;

    // Look around the pixel
    for (int y = -int(outline_width); y <= int(outline_width); y++) {
        for (int x = -int(outline_width); x <= int(outline_width); x++) {
            vec2 offset_uv = SCREEN_UV + vec2(float(x), float(y)) * pixel_size;

            // skip outside screen
            if (offset_uv.x < 0.0 || offset_uv.x > 1.0 || offset_uv.y < 0.0 || offset_uv.y > 1.0)
                continue;

            float neighbor_depth = texture(DEPTH_TEXTURE, offset_uv).r;

            // If depth differs -> edge
            if (abs(my_depth - neighbor_depth) > 0.001) {
                ALBEDO = outline_color.rgb;
                ALPHA = 1.0;
            }
        }
    }
}
