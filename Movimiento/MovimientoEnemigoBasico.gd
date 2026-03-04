class_name Enemigo extends CharacterBody2D

#****** Variables ******
#Velocidad del enemigo
var speed=80
#Exportamos variables de fuerza y vida
@export var fuerza:int=1
@export var vida:int=3

#Variables para seleccionar a un jugador
#DATO: Solo sigue a un jugador, no eh probado con mas de uno :O
var player_chase:bool=false
var player=null
#****** Funciones ******
#*** Integradas de Godot ***
func _ready() -> void:
	print(str(name) + " Y tengo "+str(vida))
func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	if player_chase and player:
		direction = (player.position - position).normalized()
	velocity = direction * speed
	move_and_slide()  # ¡IMPORTANTE! Esto respeta las colisiones

#*** Personalizadas ***
#Se encarga de quitar vida a si mismo, y si la vida es menor a 1, se destruye
#Se destruye liberando el nodo con queue_free()
func quitarVida(dano):
	vida-=dano
	if(vida<1):
		queue_free()


#*** Señales ***
#Estas señales son con el nodo Area2D
func _on_area_deteccion_body_entered(body: Node2D) -> void:
	player=body
	player_chase=true


func _on_area_deteccion_body_exited(body: Node2D) -> void:
	player=null
	player_chase=false

	