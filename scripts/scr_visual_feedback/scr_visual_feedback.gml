/// @function scr_visual_hit_effect(ex, ey)
/// Efeito de impacto na posição do inimigo.
function scr_visual_hit_effect(ex, ey) {
    // Cria um efeito de partícula simples (substitua por sistema de partículas)
    // GameMaker tem part_system_create(), part_type_create(), etc.
    // Por simplicidade, usamos draw_circle temporário via um objeto de efeito.
    var eff = instance_create_layer(ex, ey, "Effects", obj_hit_effect);
    if (instance_exists(eff)) {
        eff.lifetime = 15;
        eff.radius   = CIRCLE_RADIUS * 0.8;
    }
}

/// @function scr_visual_guard_break(ex, ey)
/// Efeito visual de quebra de guarda.
function scr_visual_guard_break(ex, ey) {
    // Cria efeito de explosão de guarda
    var eff = instance_create_layer(ex, ey, "Effects", obj_guard_break_effect);
    if (instance_exists(eff)) {
        eff.lifetime = 40;
    }
    show_debug_message("*** GUARDA QUEBRADA! ***");
}

/// @function scr_visual_critical(ex, ey, dmg)
/// Mostra número de dano crítico flutuante.
function scr_visual_critical(ex, ey, dmg) {
    var eff = instance_create_layer(ex - 20, ey - 30, "Effects", obj_damage_number);
    if (instance_exists(eff)) {
        eff.dmg_value   = dmg;
        eff.is_critical = true;
        eff.vel_y       = -3;
        eff.lifetime    = 45;
    }
}

/// @function scr_visual_miss_effect(mx, my)
/// Mostra indicador de erro na posição do mouse.
function scr_visual_miss_effect(mx, my) {
    var eff = instance_create_layer(mx, my, "Effects", obj_miss_effect);
    if (instance_exists(eff)) {
        eff.lifetime = 20;
    }
}