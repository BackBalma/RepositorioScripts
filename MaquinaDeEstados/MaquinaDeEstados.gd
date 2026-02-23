extends Node
class_name MaquinaDeEstados

#****** Variables ****** 
@onready var nodoAControlar= self.owner # Nodo al que se le asignaran los estados
@export_node_path('Node') var estadoInicial # Estado inicial de la maquina
@onready var estado = get_node(estadoInicial) # Estado actual, ademas espera que este instanciado

#****** Funciones ******
func _ready() -> void:
    call_deferred("_enterState") # Llama a la funcion de entrar al estado despues de que el nodo este listo
    pass
# Llama funciones del estado, y si existen las ejecuta
func _process(delta: float) -> void:
    if estado.has_method("process"):
        estado.process(delta)
func _physics_process(delta: float) -> void:
    if estado.has_method("physics_process"):
        estado.physics_process(delta)
func _input(event: InputEvent) -> void:
    if estado.has_method("input"):
        estado.input(event)
func _unhandled_input(event: InputEvent) -> void:
    if estado.has_method("unhandled_input"):
        estado.unhandled_input(event)
func _unhandled_key_input(event: InputEvent) -> void:
    if estado.has_method("unhandled_key_input"):
        estado.unhandled_key_input(event)

func _enterState():
    estado.node=nodoAControlar
    estado.state_machine=self
    estado.enter()
func changeTo(nombreDelNuevoEstado:String):
    estado = get_node(nombreDelNuevoEstado)
    _enterState()


