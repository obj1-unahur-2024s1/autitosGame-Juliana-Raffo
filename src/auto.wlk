import wollok.game.*


object auto {
	var image = "autitoRojo.png"
	var position = game.at(0,0)
	
	method image() = image
	method position() =position 
	
	method image(nuevaImagen){ image = nuevaImagen }
	method position(nuevaPosicion){ position = nuevaPosicion }
	
	
	
	}
	
object auto2{
	var property position = game.center()
	method image() = "autitoVerde.png"
	method subir(){
		position = position.up(1)
	}
	method quejarse()= "Hey, watch out!"
	
	method movete(){
		const x = 0.randomUpTo(game.width()).truncate(0)
    	const y = 0.randomUpTo(game.height()).truncate(0)
    	position = game.at(x,y)
	}
	
}
	

