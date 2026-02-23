extends Node
class_name EstadoDeJugador

var maquinaDeEstados#:MaquinaDeEstados #Quitar primer Gato para que funcione de manera mas optima
var node:Player:
	set(value):
		node=value
		player=value
	get:
		return node

var player:Player # Nodo del jugador, se asigna al entrar al estado, y se puede usar en los estados hijos