/*
    Loop principal do combate.
    Ordem: barra → spawn círculos → checar turno → checar vitória.
*/

if (!combat_active) exit;

// 1. Atualiza barra de piscada
scr_blink_bar_update(id);

// 2. Turno do jogador: spawna círculos se não houver nenhum ativo
if (player_turn) {
    // Limpa referências de círculos destruídos
    scr_clean_circle_list(active_circles);

    // Se não há círculos na tela, cria um novo conjunto
    if (ds_list_size(active_circles) == 0 && !blink_bar_paused) {
        scr_spawn_action_circles(id);
    }
}

// 3. Turno do inimigo
if (!player_turn) {
    enemy_attack_timer -= delta_time / 1000000; // converte microsegundos → segundos

    if (enemy_attack_timer <= 0) {
        // Inimigo desfere o golpe
        scr_enemy_attack_resolve(id);
    }
}

// 4. Screen shake
if (shake_timer > 0) {
    shake_timer--;
    screen_offset_x = irandom_range(-shake_intensity, shake_intensity);
    screen_offset_y = irandom_range(-shake_intensity, shake_intensity);
    camera_set_view_pos(view_camera[0],
        camera_get_view_x(view_camera[0]) + screen_offset_x,
        camera_get_view_y(view_camera[0]) + screen_offset_y);
} else {
    screen_offset_x = 0;
    screen_offset_y = 0;
}

// 5. Flash do inimigo
if (flash_timer > 0) flash_timer--;

// 6. Checa vitória / derrota

// Checa vitória / derrota
if (instance_exists(enemy_ref)) {
    if (enemy_ref.hp <= 0)   scr_combat_victory(id);
}
if (player_hp <= 0) scr_combat_defeat(id);

//if (enemy_ref.hp <= 0)    scr_combat_victory(id);
//if (player_hp  <= 0)      scr_combat_defeat(id);

