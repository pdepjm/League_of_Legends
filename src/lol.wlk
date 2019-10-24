class Invocador {

	var property ego
	var property habilidad
	var property moral

	method aumentarEgo(cantidad) {
		ego += cantidad
	}

	method disminuirEgo(cantidad) {
		ego -= cantidad
	}

	method aumentarHabilidad(cantidad) {
		habilidad += cantidad
	}

	method disminuirHabilidad(cantidad) {
		habilidad -= cantidad
	}

	method aumentarMoral(cantidad) {
		moral += cantidad
	}

	method disminuirMoral(cantidad) {
		moral -= cantidad
	}

	method multiplicarMoral(cantidad) {
		moral *= cantidad
	}

	method multiplicarEgo(cantidad) {
		ego *= cantidad
	}

	method insultar(jugador) {
		self.aumentarEgo(15)
	}

	method ponerseTriste() {
		self.disminuirEgo(7)
		self.disminuirHabilidad(7)
	}

}

class Toxico inherits Invocador {

	override method insultar(jugador) {
		super(jugador)
		jugador.disminuirMoral((ego / 2) * habilidad * 0.2)
	}

	method enojarse() {
		self.disminuirMoral(23)
		self.disminuirHabilidad(habilidad / 2)
	}

	method realizarUnaPlay(invocadorEnemigo) {
		self.aumentarHabilidad(5)
		
		if (self.realizoUnInsect(invocadorEnemigo)) {
			self.aumentarEgo(69)
		}
	}
	
	method realizoUnInsect(invocadorEnemigo){
		return habilidad > invocadorEnemigo.habilidad() || ego > 100
	}

}

class Positivos inherits Invocador {

	var property iraAcumulada

	method enojarse() {
		if (iraAcumulada >= 80) {
			self.estallar()
		} else {
			self.aumentarIra(10)
		}
	}

	method aumentarIra(cantidad) {
		iraAcumulada += cantidad
	}

	method estallar() {
		iraAcumulada = 0
		self.disminuirHabilidad(habilidad * 0.3)
		self.disminuirMoral(moral * 0.3)
	}

	override method insultar(jugador) {
		super(jugador)
		jugador.multiplicarMoral(1 / 3)
	}
	
	method realizarUnaPlay(invocadorEnemigo){
		self.aumentarHabilidad(13)
		self.aumentarEgo(2)
		self.aumentarMoral(2)
			
	}

}

class CampeonConMecanicas {

	var property asesinatos
	var property muertes
	var property invocador

	method asesinar(championEnemigo) {
		invocador.realizarPlay(championEnemigo.invocador())
	}

	method morir() {
		invocador.ponerseTriste()
	}

}

class CampeonSinMecanicas {

	var property asesinatos
	var property muertes
	var property invocador

	method asesinar(cantidadDeEnemigos) {
		invocador.multiplicarEgo(1.15)
	}

	method morir() {
		invocador.enojarse()
	}

	method tirarM7(campeonEnemigo) {
		invocador.aumentarEgo(10)
		campeonEnemigo.invocador().enojar()
	}

}

