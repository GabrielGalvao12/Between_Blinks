/// @function scr_validate_attack(circle_type, input_type, in_time, in_area)
/// Retorna um valor do enum HitResult.
/// @param {CircleType} circle_type  - Tipo exigido pelo círculo
/// @param {CircleType} input_type   - Tipo executado pelo jogador
/// @param {bool}       in_time      - Ação dentro do tempo?
/// @param {bool}       in_area      - Ação dentro da área do círculo?
function scr_validate_attack(circle_type, input_type, in_time, in_area) {
    if (!in_time)                     return HitResult.ERRO_TEMPO;
    if (!in_area)                     return HitResult.ERRO_POSICAO;
    if (circle_type != input_type)    return HitResult.ERRO_TIPO;
    return HitResult.ACERTO;
}

/// @function scr_result_to_string(result)
/// Converte HitResult para texto legível (debug/UI).
function scr_result_to_string(result) {
    switch (result) {
        case HitResult.ACERTO:        return "ACERTO!";
        case HitResult.ERRO_TIPO:     return "Tipo errado";
        case HitResult.ERRO_TEMPO:    return "Tempo esgotado";
        case HitResult.ERRO_POSICAO:  return "Fora da área";
        default:                      return "Desconhecido";
    }
}