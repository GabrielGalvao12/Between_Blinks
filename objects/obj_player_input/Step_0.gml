// --- Rastreia pressionamento --------------------------------
if (mouse_check_button_pressed(mb_left)) {
    mouse_held       = true;
    mouse_press_x    = mouse_x;
    mouse_press_y    = mouse_y;
    mouse_press_time = 0;
}

if (mouse_check_button(mb_left) && mouse_held) {
    mouse_press_time++;
}

if (mouse_check_button_released(mb_left)) {
    // Classifica o gesto ao soltar
    var dx       = mouse_x - mouse_press_x;
    var dy       = mouse_y - mouse_press_y;
    var dist     = point_distance(0, 0, dx, dy);

    if (dist >= DRAG_MIN_DISTANCE) {
        if (abs(dx) > abs(dy))
            last_gesture = DragDir.HORIZONTAL;
        else
            last_gesture = DragDir.VERTICAL;
    } else {
        last_gesture = DragDir.NONE; // Clique simples
    }

    mouse_held = false;
}

// --- Tecla de pausa (Escape) --------------------------------
if (keyboard_check_pressed(vk_escape)) {
    if (instance_exists(manager_ref)) {
        with (manager_ref) {
            blink_bar_paused = !blink_bar_paused;
        }
    }
}
