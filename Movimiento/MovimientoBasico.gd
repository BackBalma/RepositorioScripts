class_name personaje #Definimos el nombre de la clase
extends CharacterBody2D #Extiende del nodo CharacterBody2D (Importante para el movimiento del personaje)

#****** Variables ******

var SPEED=100 #Velocidad del personaje
#@export var speed #<---- Sirve para mostrar la variable en el editor :O

#****** Funciones integradas de Godot ******
#*** Physics process ***
#Esta funcion se ejecuta cada frame
#Ideal para implementar las fisicas y el movimiento
func _physics_process(delta: float) -> void:
	movimiento()
	move_and_slide()
#*** Ready ***
#Esta funcion se ejecuta en el primer frame del juego
#Especificamente despues que la escena se ha cargado completamente
func _ready() -> void:
	print("Inicia el personaje :D")

#****** Funciones personalizadas ******
#Esta funcion se encarga de manejar el movimiento del personaje
func movimiento():
	var direction=Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		direction.y-=1	
	if Input.is_action_pressed("ui_down"):
		direction.y+=1
	if Input.is_action_pressed("ui_left"):
		direction.x-=1
	if Input.is_action_pressed("ui_right"):
		direction.x+=1
	velocity=direction*SPEED


