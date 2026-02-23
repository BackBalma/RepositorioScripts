extends "./EstadoDeJugador.gd" # extends EstadoDeJugador 
# Lo de arriba lo deje asi para que no me de errores en VSCode, cambiar en Godot al comentario

func _enter():
    print("Entrando al estado Idle")
func _process(delta: float) -> void:
    if Input.is_action_just_pressed("ui_right"):
        maquinaDeEstados.changeTo(player.states._move)



