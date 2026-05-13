function scr_spawn_action_circles(manager) {
    var count = 1 + (manager.combo_count div 5);
    count = clamp(count, 1, 3);

    for (var i = 0; i < count; i++) {
        var cx = irandom_range(120, room_width - 120);
        var cy = irandom_range(80,  room_height - 120);
        var ctype = choose(CircleType.PICARETA, CircleType.PA);

        var circ = instance_create_layer(cx, cy, "Instances", obj_action_circle);
        circ.circle_type   = ctype;
        circ.manager_ref   = manager;
        circ.timeout_max   = CIRCLE_TIMEOUT - (manager.combo_count * 0.01);
        circ.timeout_max   = max(circ.timeout_max, 0.4);
        circ.timeout_timer = circ.timeout_max;

        ds_list_add(manager.active_circles, circ);
    }
}

function scr_clean_circle_list(list) {
    for (var i = ds_list_size(list) - 1; i >= 0; i--) {
        if (!instance_exists(ds_list_find_value(list, i))) {
            ds_list_delete(list, i);
        }
    }
}

function scr_on_hit(manager, result, circle_type) {
    with (manager) {
        combo_count++;
        flash_timer = FLASH_DURATION;
        shake_timer = SHAKE_DURATION;
        shake_intensity = SHAKE_INTENSITY;

        scr_apply_damage(enemy_ref, circle_type, combo_count);
        scr_audio_hit();

        // só chama o efeito visual se o inimigo existir
        if (instance_exists(enemy_ref)) {
            scr_visual_hit_effect(enemy_ref.x, enemy_ref.y);
        }
    }
}

function scr_on_miss(manager) {
    with (manager) {
        combo_count = 0;
        scr_audio_miss();

        for (var i = 0; i < ds_list_size(active_circles); i++) {
            var c = ds_list_find_value(active_circles, i);
            if (instance_exists(c)) instance_destroy(c);
        }
        ds_list_clear(active_circles);

        blink_bar = 1.0;
        scr_blink_bar_trigger_enemy_turn(id);
    }
}

function scr_enemy_attack_resolve(manager) {
    with (manager) {
        player_hp -= DMG_ENEMY_ATTACK;
        player_hp = max(player_hp, 0);
        scr_audio_enemy_attack();

        blink_bar  = 0.0;
        player_turn = true;
        enemy_attack_timer = 0;

        with (enemy_ref) {
            if (guard_hp > 0)
                scr_enemy_set_state(id, EnemyState.DEFENDENDO);
            else
                scr_enemy_set_state(id, EnemyState.IDLE);
        }
    }
}

function scr_combat_victory(manager) {
    with (manager) {
        combat_active = false;
        scr_audio_victory();
    }
}

function scr_combat_defeat(manager) {
    with (manager) {
        combat_active = false;
    }
}