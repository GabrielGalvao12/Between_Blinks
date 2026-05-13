/*
    Desenha HUD: HP do jogador, barra de piscada, combo.
    Usa coordenadas de GUI (independem da câmera).
*/

if (!combat_active) exit;

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// --- Barra de HP do jogador ---------------------------------
var hp_bar_x = 20;
var hp_bar_y = gui_h - 40;
var hp_bar_w = 200;
var hp_bar_h = 18;
var hp_ratio = player_hp / player_hp_max;

draw_set_color(c_dkgray);
draw_rectangle(hp_bar_x, hp_bar_y, hp_bar_x + hp_bar_w, hp_bar_y + hp_bar_h, false);
draw_set_color(make_color_rgb(220, 60, 60));
draw_rectangle(hp_bar_x, hp_bar_y, hp_bar_x + hp_bar_w * hp_ratio, hp_bar_y + hp_bar_h, false);
draw_set_color(c_white);
draw_set_font(fnt_hud); // Substitua pelo seu font asset
draw_text(hp_bar_x, hp_bar_y - 20, "HP: " + string(player_hp) + "/" + string(player_hp_max));

// --- Barra de piscada (turno) -------------------------------
var bb_x = gui_w / 2 - 120;
var bb_y = gui_h - 40;
var bb_w = 240;
var bb_h = 18;

// Pisca quando perto do limite
var bar_color = (blink_bar >= BLINK_BAR_WARN_THRESH)
    ? ((current_time mod 400 < 200) ? make_color_rgb(255,80,80) : make_color_rgb(255,180,50))
    : make_color_rgb(80, 200, 255);

draw_set_color(c_dkgray);
draw_rectangle(bb_x, bb_y, bb_x + bb_w, bb_y + bb_h, false);
draw_set_color(bar_color);
draw_rectangle(bb_x, bb_y, bb_x + bb_w * blink_bar, bb_y + bb_h, false);
draw_set_color(c_white);
draw_text(bb_x, bb_y - 20, "Turno");

// --- Contador de combo --------------------------------------
if (combo_count > 1) {
    draw_set_color(c_yellow);
    draw_set_font(fnt_combo); // Substitua pelo seu font asset
    draw_text_transformed(gui_w/2, 80,
        "COMBO x" + string(combo_count), 1.5, 1.5, 0);
}

// --- Flash branco no inimigo --------------------------------
if (flash_timer > 0 && instance_exists(enemy_ref)) {
    var alpha = flash_timer / FLASH_DURATION;
    draw_set_color(c_white);
    draw_set_alpha(alpha * 0.7);
    draw_sprite(enemy_ref.sprite_index, enemy_ref.image_index,
                enemy_ref.x - camera_get_view_x(view_camera[0]),
                enemy_ref.y - camera_get_view_y(view_camera[0]));
    draw_set_alpha(1);
}

draw_set_color(c_white);
draw_set_font(-1);

