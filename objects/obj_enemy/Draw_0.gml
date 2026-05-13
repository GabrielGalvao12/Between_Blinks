// Desenha sprite com offset de shake
draw_sprite(sprite_index, image_index,
            x + hit_shake_offset, y);

// --- Barra de HP do inimigo ---------------------------------
var bw = 120;
var bx = x - bw/2;
var by = y + bar_offset_y;

draw_set_color(c_dkgray);
draw_rectangle(bx, by, bx + bw, by + 12, false);

draw_set_color(make_color_rgb(80, 210, 80));
draw_rectangle(bx, by, bx + bw * (hp / hp_max), by + 12, false);

// --- Barra de Guarda ----------------------------------------
var gby = by + 16;
draw_set_color(c_dkgray);
draw_rectangle(bx, gby, bx + bw, gby + 8, false);

draw_set_color(make_color_rgb(80, 160, 255));
draw_rectangle(bx, gby, bx + bw * (guard_hp / guard_hp_max), gby + 8, false);

// Labels
draw_set_color(c_white);
draw_set_font(fnt_hud);
draw_text(bx, by - 18, "HP");
draw_text(bx + 30, by - 18, string(hp) + "/" + string(hp_max));
draw_text(bx, gby - 14, "GRD");

draw_set_font(-1);

// --- Indicador visual de estado ------------------------------
var state_labels = ["IDLE", "DEFENDENDO", "VULNERÁVEL",
                    "PREPARANDO...", "ATACANDO!", "DERROTADO"];
var state_colors = [c_white, c_aqua, c_yellow, c_orange, c_red, c_gray];

draw_set_color(state_colors[state]);
draw_set_font(fnt_hud);
draw_text_transformed(x, y + bar_offset_y - 36,
    state_labels[state], 0.9, 0.9, 0);
draw_set_font(-1);
draw_set_color(c_white);
