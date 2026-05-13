// --- Atributos de combate -----------------------------------
hp              = 100;
hp_max          = 100;
guard_hp        = 60;        // Guarda atual
guard_hp_max    = 60;        // Guarda máxima

// --- Máquina de estados -------------------------------------
state           = EnemyState.DEFENDENDO;
state_timer     = 0;         // Contador para transições automáticas

// --- Vibração de acerto ("hit shake") -----------------------
hit_shake_timer  = 0;
hit_shake_offset = 0;

// --- Sprites por estado (substitua pelos seus assets) -------
spr_by_state[EnemyState.IDLE]              = spr_BarataP;
spr_by_state[EnemyState.DEFENDENDO]        = spr_Bdef1;
spr_by_state[EnemyState.VULNERAVEL]        = spr_BBroke;
spr_by_state[EnemyState.PREPARANDO_ATAQUE] = spr_BarataP;
spr_by_state[EnemyState.ATACANDO]          = spr_BarataP;
spr_by_state[EnemyState.DERROTADO]         = spr_BBroke;

// Inicializa sprite
sprite_index = spr_by_state[state];

// --- Barras de UI (posição relativa ao inimigo) -------------
bar_offset_y = -70; // Deslocamento Y das barras acima do sprite

