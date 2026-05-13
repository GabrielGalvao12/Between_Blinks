/// @function scr_enemy_state_step(enemy)
/// Executa a lógica do estado atual do inimigo.
function scr_enemy_state_step(enemy) {
    with (enemy) {
        state_timer -= delta_time / 1000000;

        switch (state) {

            case EnemyState.IDLE:
                // Após um tempo curto, decide defender
                if (state_timer <= 0) {
                    scr_enemy_set_state(id, EnemyState.DEFENDENDO);
                }
            break;

            case EnemyState.DEFENDENDO:
                // Permanece defendendo durante o turno do jogador.
                // A transição é controlada pelo combat_manager (blink bar).
            break;

            case EnemyState.VULNERAVEL:
                // Após o tempo de vulnerabilidade, volta a defender
                if (state_timer <= 0) {
                    guard_hp = guard_hp_max; // Regenera guarda
                    scr_enemy_set_state(id, EnemyState.DEFENDENDO);
                }
            break;

            case EnemyState.PREPARANDO_ATAQUE:
                // Wind-up antes de atacar
                if (state_timer <= 0) {
                    scr_enemy_set_state(id, EnemyState.ATACANDO);
                }
            break;

            case EnemyState.ATACANDO:
                // O dano é aplicado pelo manager em scr_enemy_attack_resolve
                // Apenas aguarda o timer (controlado pelo manager)
            break;

            case EnemyState.DERROTADO:
                // Estado final — sem lógica adicional
            break;
        }
    }
}

/// @function scr_enemy_set_state(enemy, new_state)
/// Muda o estado do inimigo e configura o timer correspondente.
function scr_enemy_set_state(enemy, new_state) {
    with (enemy) {
        state = new_state;

        // Duração de cada estado em segundos
        switch (new_state) {
            case EnemyState.IDLE:              state_timer = 0.5;  break;
            case EnemyState.DEFENDENDO:        state_timer = 9999; break; // Controlado externamente
            case EnemyState.VULNERAVEL:        state_timer = 2.5;  break;
            case EnemyState.PREPARANDO_ATAQUE: state_timer = 0.8;  break;
            case EnemyState.ATACANDO:          state_timer = 0.5;  break;
            case EnemyState.DERROTADO:         state_timer = 9999; break;
        }

        // Atualiza sprite imediatamente
        sprite_index = spr_by_state[new_state];
        image_index  = 0;

        // Efeito de quebra de guarda
        if (new_state == EnemyState.VULNERAVEL) {
            scr_visual_guard_break(x, y);
            scr_audio_guard_break();
        }

        // Animação de wind-up: notifica o manager
        if (new_state == EnemyState.PREPARANDO_ATAQUE) {
            var mgr = instance_find(obj_combat_manager, 0);
            if (instance_exists(mgr)) {
                mgr.player_turn      = false;
                mgr.enemy_attack_timer = 0.8; // Mesmo valor do timer do estado
            }
        }
    }
}