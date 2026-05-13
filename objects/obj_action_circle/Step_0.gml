// Se já terminou, aguarda o timer de feedback e se destrói
if (completed || failed) {
    result_timer--;
    if (result_timer <= 0) instance_destroy();
    exit;
}

// --- Animação de surgimento ---------------------------------
scale = lerp(scale, scale_target, scale_speed * delta_time / 1000000);

// --- Anel de tempo ------------------------------------------
var time_ratio = timeout_timer / timeout_max;
ring_radius    = lerp(CIRCLE_RADIUS, CIRCLE_RADIUS * 2.2, time_ratio);

// --- Timer de timeout ---------------------------------------
timeout_timer -= delta_time / 1000000; // microsegundos → segundos

if (timeout_timer <= 0 && !completed) {
    scr_circle_on_miss(id, HitResult.ERRO_TEMPO);
    exit;
}

// --- Input: Picareta (clique simples) -----------------------
if (circle_type == CircleType.PICARETA) {
    if (mouse_check_button_pressed(mb_left)) {
        var mx = mouse_x;
        var my = mouse_y;
        var dist = point_distance(x, y, mx, my);

        if (dist <= CIRCLE_RADIUS) {
            scr_circle_on_hit(id);
        } else {
            scr_circle_on_miss(id, HitResult.ERRO_POSICAO);
        }
    }
}

// --- Input: Pá (drag/swipe) ---------------------------------
if (circle_type == CircleType.PA) {
    // Início do drag — só registra se o mouse começou dentro do círculo
    if (mouse_check_button_pressed(mb_left)) {
        var dist = point_distance(x, y, mouse_x, mouse_y);
        if (dist <= CIRCLE_RADIUS) {
            drag_active  = true;
            drag_start_x = mouse_x;
            drag_start_y = mouse_y;
        }
    }

    // Movimento durante drag
    if (drag_active && mouse_check_button(mb_left)) {
        var dx = mouse_x - drag_start_x;
        var dy = mouse_y - drag_start_y;
        var total_dist = point_distance(0, 0, dx, dy);

        if (total_dist >= DRAG_MIN_DISTANCE) {
            // Classifica a direção do drag
            var drag_dir = DragDir.NONE;
            if (abs(dx) > abs(dy))
                drag_dir = DragDir.HORIZONTAL;
            else
                drag_dir = DragDir.VERTICAL;

            // Por enquanto aceita qualquer direção de drag válida
            // (você pode expandir para exigir direções específicas)
            scr_circle_on_hit(id);
            drag_active = false;
        }
    }

    // Soltou o botão sem completar
    if (mouse_check_button_released(mb_left) && drag_active) {
        drag_active = false;
        // Só penaliza se realmente estava dentro do círculo e arrastou pouco
        var dist = point_distance(x, y, drag_start_x, drag_start_y);
        if (dist <= CIRCLE_RADIUS) {
            scr_circle_on_miss(id, HitResult.ERRO_TIPO);
        }
    }
}
