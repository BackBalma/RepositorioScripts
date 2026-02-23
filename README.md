# Repositorio de Script Club de Videojuegos
## Contenidos
[Ir a fundamentos de Godot](#fundamentos-de-godot)
## Estuctura del Repositorio
[Carpeta de Movimiento](Movimiento/)
[Carpeta de Maquina de estado](MaquinaDeEstados/)
___
## Fundamentos de Godot
`var` es para declarar una variable
<pre>var puntajeJugador = 20</pre>

`const` es para declarar una constante, importante definirla al momento de declararla
<pre>const gravedad = 9,807</pre>
Dato importante para las `variables` y `constantes`, uno puede definir el tipo de dato que debe ser la variable o la constante
<pre>const esVerdad:bool = true</pre>
---

`#` es para hacer comentarios
<pre>#Esto es un comentario :O</pre>
---

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
---

`if/else/elif` condicionales
<pre>
if contador == 0:
    print("La condicion del if es verdadera")
elif contador == 1: 
    print("La condicion del elif es verdadera")
else:
    print("Ninguna es verdadera")
</pre>
---
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
