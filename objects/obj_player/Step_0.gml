// MOVIMENTO
var h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

if (!place_meeting(x + h * spd, y, obj_wall)) x += h * spd;
if (!place_meeting(x, y + v * spd, obj_wall)) y += v * spd;


// ENTRAR EM COMBATE
if (place_meeting(x, y, obj_enemy111)) {
    room_goto(testeDeCombat);
}

if (place_meeting(x, y, obj_boss)) {
    room_goto(rm_boss);
}


// TROCAR ARMA
if (keyboard_check_pressed(ord("Q"))) {
    if (weapon == "pickaxe") weapon = "shovel";
    else weapon = "pickaxe";
}

// SISTEMA DE TURNO
if (player_turn) {
    blink += 1;

    if (blink >= blink_max) {
        player_turn = false;
        blink = 0;
    }
}

// ATAQUE
if (player_turn && mouse_check_button_pressed(mb_left)) {

    if (weapon == "pickaxe") {
        with (obj_enemy111) hp -= 1;
    }

    if (weapon == "shovel") {
        with (obj_enemy111) hp -= 2;
    }

    player_turn = false;
}


// TURNO INIMIGO
if (!player_turn) {
    alarm[0] = 60;
}

// Defina o tamanho do seu quadrante (o "quadrado" do mapa)
var quad_w = 1408; 
var quad_h = 768;

// Calcula em qual "coluna" e "linha" o jogador está
var col = floor(obj_player.x / quad_w);
var row = floor(obj_player.y / quad_h);

// Define a posição alvo da câmera baseada no quadrante atual
var target_x = col * quad_w;
var target_y = row * quad_h;

// Move a câmera (pode usar lerp para uma transição suave)
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

camera_set_view_pos(view_camera[0], lerp(cam_x, target_x, 0.1), lerp(cam_y, target_y, 0.1));