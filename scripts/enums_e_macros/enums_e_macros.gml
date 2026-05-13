global.init = true;
// ============================================================
//  enums_e_macros.gml
//  Coloque este script para execução automática (no GameMaker:
//  Script Asset → marque "Auto-execute").
//  Define todos os enums e macros globais do sistema.
// ============================================================

// --------------- ESTADOS DO INIMIGO -------------------------
enum EnemyState {
    IDLE,              // Parado, sem ação
    DEFENDENDO,        // Com guarda ativa
    VULNERAVEL,        // Guarda quebrada — recebe dano crítico
    PREPARANDO_ATAQUE, // Animação de wind-up
    ATACANDO,          // Frame de hit ativo
    DERROTADO          // HP zerado
}

// --------------- TIPOS DE CÍRCULO DE AÇÃO -------------------
enum CircleType {
    PICARETA,  // Requer clique simples
    PA         // Requer drag/swipe
}

// --------------- DIREÇÕES DE DRAG ---------------------------
enum DragDir {
    NONE,
    HORIZONTAL,
    VERTICAL
}

// --------------- RESULTADO DA VALIDAÇÃO ---------------------
enum HitResult {
    ACERTO,
    ERRO_TIPO,    // Ação errada (picareta em vez de pá, etc.)
    ERRO_TEMPO,   // Tempo esgotado
    ERRO_POSICAO  // Clicou fora do círculo
}

// --------------- MACROS / CONSTANTES ------------------------

/// Raio do círculo de ação em pixels
#macro CIRCLE_RADIUS          48

/// Tempo máximo para completar a ação (em segundos)
#macro CIRCLE_TIMEOUT         1.2

/// Tamanho mínimo de drag para ser reconhecido como swipe (pixels)
#macro DRAG_MIN_DISTANCE      40

/// Velocidade de enchimento da barra de piscada (0 a 1 por segundo)
#macro BLINK_BAR_FILL_SPEED   0.18

/// Limiar da barra para começar a piscar (0–1)
#macro BLINK_BAR_WARN_THRESH  0.75

/// Dano base de picareta na guarda
#macro DMG_PICKAXE_GUARD      12

/// Dano base de pá na guarda
#macro DMG_SHOVEL_GUARD       20

/// Dano base quando inimigo está vulnerável (multiplicador)
#macro DMG_CRIT_MULT          2.5

/// Dano do contra-ataque do inimigo no jogador
#macro DMG_ENEMY_ATTACK       15

/// Duração do screen shake (frames)
#macro SHAKE_DURATION         8

/// Intensidade do screen shake (pixels)
#macro SHAKE_INTENSITY        4

/// Duração do flash branco (frames)
#macro FLASH_DURATION         6

// Define a vida base inicial
#macro PLAYER_HP_MAX 100