import wollok.game.*

object configuracion{
	method iniciar(){
	game.title("El Messias")
	game.width(25)
	game.height(15)
	game.boardGround("fondo.png")
	game.cellSize(50)
	game.addVisual(jugador)
	game.addVisual(reloj)
	//game.addVisual(tiempo)
	}
	}


object teclado{
	
	method comandosTeclado(){
	keyboard.s().onPressDo{jugador.siguienteEscalon()}
	keyboard.up().onPressDo{jugador.saltar()}
	keyboard.left().onPressDo{jugador.moverALaIzquierda()}
	keyboard.right().onPressDo{jugador.moverALaDerecha()}
	}
}


object reloj {
	
	var tiempo = 0
	
	method text() = tiempo.toString()
	method position() = game.at(2, game.height()-1)
	
	method pasarTiempo() {
		tiempo = tiempo +1
	}
	method iniciar(){
		tiempo = 0
		game.onTick(1000,"tiempo",{self.pasarTiempo()})
	}
	method detener(){
		game.removeTickEvent("tiempo")
	}
}
/* 
object tiempo{
	method position()= game.at(0, game.height()-1)
	method text()= "TIEMPO"

}*/

object suelo{
	var property position = game.origin().up(1)
}

object jugador {
	var property position = game.at(24,1)
	var property image = "jugador.png"
	
	/*method image(unaImagen){ image = unaImagen}
	method image()= image*/
	
	method siguienteEscalon(){ //SUBE AL SIGUIENTE ESCALON SOLO POR LAS ESCALERAS
		if (position == game.at(0,1) or position == game.at(24,5)){
		position = position.up(4)}
	}
	
	method saltar(){ //SALTA EN DIAGONAL (EL SALTO DURA 1 SEGUNDO, CUALQ COSA LO MODIFICAMOS Y LE AGREGAMOS MAS DURACION)
		if (position.y() == suelo.position().y()){
		self.subir()}
		if(image == "jugador.png"){
			position =position.left(1)	
		}else{
			position = position.right(1)
		}
		
		game.schedule(1000, {self.bajar()})		
	}
	
	method bajar(){
		if (position.y() != suelo.position().y()){
		position = position.down(2)}
	}
	method subir(){
		position = position.up(2)
	}
	
	method moverALaIzquierda(){
		self.image("jugador.png")
		position = position.left(1)
	}
	
	method moverALaDerecha(){
		self.image("jugador_mirando_derecha.png")
		position = position.right(1)
	}
		
}