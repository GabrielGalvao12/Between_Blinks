// Paleta de cores por tipo
var col_fill  = (circle_type == CircleType.PICARETA)
    ? make_color_rgb(255, 220, 60)   // Amarelo — Picareta
    : make_color_rgb(60, 200, 255);  // Azul — Pá

var col_ring  = (circle_type == CircleType.PICARETA)
    ? make_color_rgb(200, 140, 20)
    : make_color_rgb(20, 120, 200);

// --- Anel externo de contagem regressiva --------------------
var time_ratio = timeout_timer / timeout_max;
var ring_alpha = 0.35 + time_ratio * 0.4;

draw_set_color(col_ring);
draw_set_alpha(ring_alpha);
draw_circle(x, y, ring_radius * scale, false);
draw_set_alpha(1);

// --- Círculo principal --------------------------------------
draw_set_color(col_fill);
draw_set_alpha(0.7);
draw_circle(x, y, CIRCLE_RADIUS * scale, false);
draw_set_alpha(1);

// Borda
draw_set_color(c_white);
draw_circle(x, y, CIRCLE_RADIUS * scale, true);

// --- Ícone do tipo ------------------------------------------
draw_set_color(c_white);
draw_set_font(fnt_icons); // Use um font com ícones ou substitua por sprite
var label = (circle_type == CircleType.PICARETA) ? "⛏" : "⬅";
draw_text_transformed(x - 10, y - 12, label, 1.2 * scale, 1.2 * scale, 0);

// --- Barra de progresso de tempo (arco ao redor do círculo) -
// Implementação simples com linha de progresso abaixo
var pbar_w = CIRCLE_RADIUS * 2;
var pbar_x = x - CIRCLE_RADIUS;
var pbar_y = y + CIRCLE_RADIUS + 8;

draw_set_color(c_dkgray);
draw_rectangle(pbar_x, pbar_y, pbar_x + pbar_w, pbar_y + 5, false);

var prog_color = (time_ratio > 0.4)
    ? make_color_rgb(80, 220, 80)
    : make_color_rgb(255, 60, 60);
draw_set_color(prog_color);
draw_rectangle(pbar_x, pbar_y, pbar_x + pbar_w * time_ratio, pbar_y + 5, false);

// --- Feedback de resultado ----------------------------------
if (result_timer > 0) {
    var fbk_alpha = result_timer / 30.0;
    draw_set_alpha(fbk_alpha);
    draw_set_color(result_ok ? c_lime : c_red);
    draw_set_font(fnt_hud);
    draw_text_transformed(x - 10, y - 50,
        result_ok ? "✓" : "✗", 2.0, 2.0, 0);
    draw_set_alpha(1);
    draw_set_font(-1);
}

draw_set_color(c_white);
