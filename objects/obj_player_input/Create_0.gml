// Estado do mouse
mouse_held       = false;
mouse_press_x    = 0;
mouse_press_y    = 0;
mouse_press_time = 0;    // frames segurando o botão

// Resultado do último gesto classificado
last_gesture     = DragDir.NONE;

// Referência ao manager (opcional — para debug)
manager_ref      = instance_find(obj_combat_manager, 0);