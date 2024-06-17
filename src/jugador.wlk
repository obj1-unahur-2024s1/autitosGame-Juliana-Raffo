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



object jugador {
	var property position = game.at(24,1)
	
	method image()= "jugador.png"
	
	method siguienteEscalon(){
		if (position == game.at(0,1) or position == game.at(24,5)){
		position = position.up(4)}
	}
	
	/*method saltar(){
		position = position.up(2)
	}*/
	
	method moverALaIzquierda(){
		
		position = position.left(1)
	}
	
	method moverALaDerecha(){
		position = position.right(1)
	}
		
}