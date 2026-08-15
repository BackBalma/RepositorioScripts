extends Node

#Dependiendo del juego podemos agregar muchos atributos
var vidas:float=3
#Formato JSON, tratar de no "Hardcodear" los datos del inventario :'O
var inventario:Dictionary={
    "Armas":["Espada","Arco","Escudo"],
    "Pociones":["Vida","Mana"],
    "Llaves":["Llave de oro","Llave de plata"]
}


func resetGame():
	vidas=3
    inventario={}

func quitarVida(dano):
	if vidas>=0:
		print("Soy el player y me quitaron vida")
		vidas-=dano
		print("Vida: "+ str(vidas))
	else:
		print("No deberias ver esto :0")
