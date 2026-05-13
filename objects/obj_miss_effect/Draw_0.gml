var a = lifetime / 20.0;
draw_set_alpha(a);
draw_set_color(c_red);
draw_set_font(fnt_hud);
draw_text_transformed(x - 10, y - 10, "MISS", 1.0, 1.0, 0);
draw_set_alpha(1);
draw_set_font(-1);
