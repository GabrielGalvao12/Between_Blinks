// Definidos externamente pelo manager ao instanciar:
circle_type   = CircleType.PICARETA; // Tipo padrão
manager_ref   = noone;               // Referência ao obj_combat_manager
timeout_max   = CIRCLE_TIMEOUT;
timeout_timer = timeout_max;

// Estado interno
completed     = false;  // true = ação concluída com sucesso
failed        = false;  // true = timeout ou erro

// Animação de surgimento (scale in)
scale         = 0.0;
scale_target  = 1.0;
scale_speed   = 8.0;   // por segundo

// Anel de contagem regressiva (raio externo que encolhe)
ring_radius   = CIRCLE_RADIUS * 2.0;
ring_target   = CIRCLE_RADIUS;

// Feedback visual de resultado
result_timer  = 0;      // Mostra ícone de certo/errado por X frames
result_ok     = false;

// Variáveis de drag (para tipo Pá)
drag_start_x  = 0;
drag_start_y  = 0;
drag_active   = false;

/// @function scr_circle_on_hit(circle)
/// Marca o círculo como acerto e notifica o manager.
function scr_circle_on_hit(circle) {
    with (circle) {
        completed    = true;
        result_ok    = true;
        result_timer = 30;

        if (instance_exists(manager_ref)) {
            scr_on_hit(manager_ref, HitResult.ACERTO, circle_type);
        }
    }
}

/// @function scr_circle_on_miss(circle, reason)
/// Marca o círculo como erro e notifica o manager.
function scr_circle_on_miss(circle, reason) {
    with (circle) {
        if (failed || completed) exit; // Evita duplo disparo

        failed       = true;
        result_ok    = false;
        result_timer = 30;

        if (instance_exists(manager_ref)) {
            scr_on_miss(manager_ref);
        }
    }
}
