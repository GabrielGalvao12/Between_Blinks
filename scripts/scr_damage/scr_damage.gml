/// @function scr_apply_damage(enemy, circle_type, combo_count)
/// Aplica dano na guarda primeiro, depois no HP.
function scr_apply_damage(enemy, circle_type, combo_count) {
    with (enemy) {
        // Calcula dano base pelo tipo de ataque
        var base_dmg = (circle_type == CircleType.PICARETA)
            ? DMG_PICKAXE_GUARD
            : DMG_SHOVEL_GUARD;

        // Multiplicador de combo (leve bônus por acertos consecutivos)
        var combo_mult = 1.0 + (combo_count * 0.05);
        combo_mult     = min(combo_mult, 2.0); // Máximo 2x

        var total_dmg  = round(base_dmg * combo_mult);

        // Estado vulnerável = dano direto no HP com multiplicador crítico
        if (state == EnemyState.VULNERAVEL) {
            var crit_dmg = round(total_dmg * DMG_CRIT_MULT);
            hp -= crit_dmg;
            hp  = max(hp, 0);

            // Efeito de crítico
            scr_visual_critical(x, y, crit_dmg);
            show_debug_message("CRÍTICO! -" + string(crit_dmg) + " HP");
        } else {
            // Ataca a guarda primeiro
            if (guard_hp > 0) {
                guard_hp -= total_dmg;

                if (guard_hp <= 0) {
                    guard_hp = 0;
                    // Guarda quebrada → estado vulnerável
                    scr_enemy_set_state(id, EnemyState.VULNERAVEL);
                } else {
                    // Hit shake no inimigo
                    hit_shake_timer = 8;
                }

                show_debug_message("Dano na guarda: -" + string(total_dmg));
            } else {
                // Sem guarda → dano direto
                hp -= total_dmg;
                hp  = max(hp, 0);
                show_debug_message("Dano direto: -" + string(total_dmg));
            }
        }

        // Verifica derrota
        if (hp <= 0) {
            scr_enemy_set_state(id, EnemyState.DERROTADO);
        }
    }
}