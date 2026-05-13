var a = lifetime / lifetime_max;
draw_set_color(make_color_rgb(80, 160, 255));
draw_set_alpha(a);
draw_circle(x, y, radius, true);
draw_set_alpha(a * 0.4);
draw_circle(x, y, radius * 0.7, true);
draw_set_alpha(1);
