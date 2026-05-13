if (mouse_check_button_pressed(mb_left)) {

    if (
        mouse_x >= x - area_w/2 &&
        mouse_x <= x + area_w/2 &&
        mouse_y >= y - area_h/2 &&
        mouse_y <= y + area_h/2
    ) {

        room_goto(target_room);
    }
}