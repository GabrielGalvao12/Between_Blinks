timer++;

if (timer > 60) {
    with (obj_player) hp -= 1;
    timer = 0;
}

if (hp <= 0) {
    room_goto(rm_win);
}

