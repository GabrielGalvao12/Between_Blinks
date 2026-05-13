// Atualiza sprite com base no estado atual
sprite_index = spr_by_state[state];

// Hit shake: balança o sprite ao ser atingido
if (hit_shake_timer > 0) {
    hit_shake_timer--;
    hit_shake_offset = (hit_shake_timer mod 2 == 0) ? 5 : -5;
} else {
    hit_shake_offset = 0;
}

// Atualiza lógica de estado
scr_enemy_state_step(id);
