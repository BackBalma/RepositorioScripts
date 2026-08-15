# Repositorio de Script Club de Videojuegos
## Contenidos
[Ir a fundamentos de Godot](#fundamentos-de-godot)
[Ir a funciones integradas](#funciones-basicas-de-godot)
[Ir a Singleton](#singleton)
[Ir a Crud Json](#crud-de-json)
## Estuctura del Repositorio
[Carpeta de Movimiento](Movimiento/)
[Carpeta de Maquina de estado](MaquinaDeEstados/)
[Carpeta de Singleton's](SingletonIdeas/)
[Carpeta de CrudJson](CrudJson/)
___
## Fundamentos de Godot
`var` es para declarar una variable
<pre>var puntajeJugador = 20</pre>

`const` es para declarar una constante, importante definirla al momento de declararla
<pre>const gravedad = 9,807</pre>
Dato importante para las `variables` y `constantes`, uno puede definir el tipo de dato que debe ser la variable o la constante
<pre>const esVerdad:bool = true</pre>


`#` es para hacer comentarios
<pre>#Esto es un comentario :O</pre>


`func` es para crear una funcion
<pre>
func sumar(a, b):
    return a + b
</pre>
Dato, godot permite declarar de que tipo es el dato que queremos retornar
<pre>
func sumar(a, b) -> Int:
    return a + b
</pre>


`if/else/elif` condicionales
<pre>
if contador == 0:
    print("La condicion del if es verdadera")
elif contador == 1: 
    print("La condicion del elif es verdadera")
else:
    print("Ninguna es verdadera")
</pre>

___
## Funciones basicas de Godot
`_ready` Se ejecuta en el primer frame
<pre>
func _ready() -> void:
    print("Iniciando el juego :D")
</pre>

`__physics_proces` Se ejecuta en cada frame del juego, perfecto para logicas de movimiento :0
<pre>
func _physics_process(delta: float) -> void:
    print("Hola soy un frame :D")
</pre>
`get_tree()` Obtiene la rama actual, esta funcion posee mas funciones internas
* `.quit()` Sirve para cerrar el nodo
* `.change_scene_to_file("ruta/a/nodo.tscn")` Cambia el nodo/escena actual, a un nodo/escena necesitado colocando una ruta

___
## CRUD de JSON
En este ejemplo se usa un archivo JSON para guardar datos de personajes en una lista. La idea principal es guardar, cargar, modificar y eliminar información sin perderla al reiniciar el juego.

`const` sirve para guardar la ruta del archivo JSON
<pre>
const RUTA = "res://personajes.json"
</pre>

`var` se usa para declarar la lista donde se almacenan los personajes
<pre>
var personajes: Array = []
</pre>

`FileAccess.file_exists()` verifica si el archivo existe antes de intentar leerlo
<pre>
if not FileAccess.file_exists(RUTA):
    personajes = []
    return
</pre>

`FileAccess.open()` abre el archivo en modo lectura y `get_as_text()` obtiene todo el contenido en texto
<pre>
var archivo = FileAccess.open(RUTA, FileAccess.READ)
var contenido = archivo.get_as_text()
archivo.close()
</pre>

`JSON.parse_string()` convierte el texto JSON en datos que Godot puede manejar, como un arreglo
<pre>
var datos = JSON.parse_string(contenido)

if datos is Array:
    personajes = datos
else:
    personajes = []
</pre>

`append()` agrega un nuevo personaje al arreglo
<pre>
personajes.append(personaje)
guardar_personajes()
</pre>

Para crear un personaje, se arma un diccionario con sus propiedades y luego se guarda en la lista
<pre>
var personaje = {
    "nombre": nombre,
    "serie": serie,
    "trabajo": trabajo,
    "aficiones": aficiones
}
</pre>

`for` sirve para recorrer todos los personajes y buscar el que coincide con el nombre
<pre>
for personaje in personajes:
    if personaje["nombre"] == nombre:
        personaje["trabajo"] = nuevo_trabajo
</pre>

`remove_at()` elimina un elemento del arreglo por su indice
<pre>
for i in range(personajes.size()):
    if personajes[i]["nombre"] == nombre:
        personajes.remove_at(i)
        break
</pre>

`JSON.stringify()` convierte el arreglo de diccionarios en un texto JSON listo para guardarse
<pre>
var contenido = JSON.stringify(personajes, "\t")
archivo.store_string(contenido)
</pre>

`FileAccess.WRITE` abre el archivo en modo de escritura para guardar los cambios
<pre>
var archivo = FileAccess.open(RUTA, FileAccess.WRITE)
</pre>



___
