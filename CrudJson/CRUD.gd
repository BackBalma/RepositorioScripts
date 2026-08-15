extends Node

const RUTA = "res://personajes.json"

var personajes: Array = []


func _ready():
	cargar_personajes()
	mostrar_personajes()


func crear_personaje(
	nombre: String,
	serie: String,
	trabajo: String,
	aficiones: Array
):
	var personaje = {
		"nombre": nombre,
		"serie": serie,
		"trabajo": trabajo,
		"aficiones": aficiones
	}

	personajes.append(personaje)

	guardar_personajes()



func cargar_personajes():
	if not FileAccess.file_exists(RUTA):
		personajes = []
		return

	var archivo = FileAccess.open(RUTA, FileAccess.READ)
	var contenido = archivo.get_as_text()
	archivo.close()

	var datos = JSON.parse_string(contenido)
	
	if datos is Array:
		personajes = datos
	else:
		personajes = []


func mostrar_personajes():
	for personaje in personajes:
		print(personaje["nombre"])



func modificar_personaje(
	nombre: String,
	nuevo_trabajo: String
):
	for personaje in personajes:
		if personaje["nombre"] == nombre:
			personaje["trabajo"] = nuevo_trabajo

	guardar_personajes()



func eliminar_personaje(nombre: String):
	for i in range(personajes.size()):
		if personajes[i]["nombre"] == nombre:
			personajes.remove_at(i)
			break

	guardar_personajes()



func guardar_personajes():
	var archivo = FileAccess.open(
		RUTA,
		FileAccess.WRITE
	)

	var contenido = JSON.stringify(
		personajes,
        "\t"
	)

	archivo.store_string(contenido)
	archivo.close()
