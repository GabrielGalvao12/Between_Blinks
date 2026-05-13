/*
    Inicializa todas as variáveis do combate e instancia os
    objetos auxiliares.
*/

// --- Referências aos objetos auxiliares ---------------------
enemy_ref        = instance_create_layer(room_width/2, room_height/2 - 60,
                       "Instances", obj_enemy);

input_ref        = instance_create_layer(0, 0, "Instances", obj_player_input);

// --- Estado geral do combate --------------------------------
combat_active    = true;   // false quando vitória/derrota
player_hp        = 100;
player_hp_max    = 100;
combo_count      = 0;      // Contador de acertos consecutivos

// --- Barra de piscada (turno) -------------------------------
blink_bar        = 0.0;    // 0 = vazia, 1 = cheia
blink_bar_paused = false;
blink_bar_speed  = BLINK_BAR_FILL_SPEED; // Pode ser alterado em runtime

// --- Feedback visual ----------------------------------------
shake_timer      = 0;
shake_intensity  = 0;
screen_offset_x  = 0;
screen_offset_y  = 0;

flash_timer      = 0;      // Flash branco no inimigo

// --- Círculos de ação ativos --------------------------------
active_circles   = ds_list_create(); // Referências aos obj_action_circle

// --- Flags de controle de turno -----------------------------
player_turn      = true;   // true = jogador ataca; false = inimigo ataca
enemy_attack_timer = 0;    // Contador da animação de ataque inimigo

// =========================
// COMBATE - CREATE EVENT
// =========================

// Referências
enemy_ref = noone;

// Estado do combate
combat_active = true;
player_turn   = true;

// Combo
combo_count = 0;

// Vida do jogador
player_hp     = PLAYER_HP_MAX;
player_hp_max = PLAYER_HP_MAX;

// Barras
blink_bar = 0;

// Timers
enemy_attack_timer = 0;
flash_timer        = 0;
shake_timer        = 0;

// Shake
shake_intensity = SHAKE_INTENSITY;

// Lista de círculos ativos
active_circles = ds_list_create();

// Limpeza ao destruir
event_inherited();