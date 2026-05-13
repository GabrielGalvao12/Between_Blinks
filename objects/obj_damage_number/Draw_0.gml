var a = lifetime / 45.0;
draw_set_alpha(a);
draw_set_color(is_critical ? c_yellow : c_white);
draw_set_font(fnt_damage); // Substitua pelo seu font
var scale = is_critical ? 1.8 : 1.2;
draw_text_transformed(x, y, string(dmg_value), scale, scale, 0);
draw_set_alpha(1);
draw_set_font(-1);
