
/// @function scr_audio_hit()
/// Som de acerto no inimigo.
function scr_audio_hit() {
    // audio_play_sound(snd_hit, 0, false);
    show_debug_message("[SOM] Hit!");
}

/// @function scr_audio_miss()
/// Som de erro / miss.
function scr_audio_miss() {
    // audio_play_sound(snd_miss, 0, false);
    show_debug_message("[SOM] Miss!");
}

/// @function scr_audio_guard_break()
/// Som de quebra de guarda.
function scr_audio_guard_break() {
    // audio_play_sound(snd_guard_break, 0, false);
    show_debug_message("[SOM] Guard Break!");
}

/// @function scr_audio_enemy_attack()
/// Som do ataque do inimigo.
function scr_audio_enemy_attack() {
    // audio_play_sound(snd_enemy_attack, 0, false);
    show_debug_message("[SOM] Enemy Attack!");
}

/// @function scr_audio_victory()
/// Som de vitória.
function scr_audio_victory() {
    // audio_play_sound(snd_victory, 0, false);
    show_debug_message("[SOM] Victory!");
}