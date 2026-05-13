/// @function scr_blink_bar_update(manager)
/// Incrementa a barra e aciona o turno do inimigo quando cheia.
function scr_blink_bar_update(manager) {
    with (manager) {
        if (blink_bar_paused || !player_turn) exit;

        blink_bar += blink_bar_speed * (delta_time / 1000000);
        blink_bar  = min(blink_bar, 1.0);

        if (blink_bar >= 1.0) {
            scr_blink_bar_trigger_enemy_turn(id);
        }
    }
}

/// @function scr_blink_bar_trigger_enemy_turn(manager)
/// Inicia o turno do inimigo.
function scr_blink_bar_trigger_enemy_turn(manager) {
    with (manager) {
        player_turn  = false;
        blink_bar    = 1.0;

        // Destroi círculos pendentes
        for (var i = 0; i < ds_list_size(active_circles); i++) {
            var c = ds_list_find_value(active_circles, i);
            if (instance_exists(c)) instance_destroy(c);
        }
        ds_list_clear(active_circles);

        // Inimigo prepara o ataque
        if (instance_exists(enemy_ref)) {
            scr_enemy_set_state(enemy_ref, EnemyState.PREPARANDO_ATAQUE);
        }
    }
}

/// @function scr_blink_bar_reset(manager)
/// Reseta a barra de piscada (início do turno do jogador).
function scr_blink_bar_reset(manager) {
    with (manager) {
        blink_bar   = 0.0;
        player_turn = true;
    }
}

/// @function scr_blink_bar_set_speed(manager, speed)
/// Altera a velocidade de enchimento (0.1 = lento, 0.5 = rápido).
function scr_blink_bar_set_speed(manager, speed) {
    with (manager) {
        blink_bar_speed = clamp(speed, 0.05, 1.0);
    }
}
