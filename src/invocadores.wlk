class Invocador {

	var property ego = 0
	var property habilidad = 0
	var property moral = 0
	var miCampeon
	
	method poneteTriste(){
		//lo que corresponda
	}
	
	method insultar(invocador){
		ego += 15
		self.insultoEspecifico(invocador)
	}
	
	method insultoEspecifico(invocador)  // método sin cuerpo
	            // toda subclase debe implementarlo
	            // Se llama método abstracto
	
	
	method atacarA(campeonEnemigo){
		miCampeon.asesinar(campeonEnemigo)
		campeonEnemigo.morirse()
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
}


class Positivo inherits Invocador {
	var iraAcumulada = 0
	
	override method insultoEspecifico(invocador){
		invocador.multiplicarMoral(1/3)
	}
	method enojarse(){
		iraAcumulada = iraAcumulada + 10
		if(iraAcumulada >= 80) {
			self.estallar()
		}
	}
	method estallar() {
		moral = moral * 0.7
		habilidad = habilidad * 0.7
		iraAcumulada = 0 
	}
	
	method hacerUnaPlayA(invocador){ //no hace nada con el invocador
		habilidad = habilidad + 13
		ego = ego + 2
	}
}

class Toxico inherits Invocador {
	override method insultoEspecifico(invocador){
		invocador.disminuirMoral(ego/2)
	}
	method enojarse() {
		habilidad = habilidad/2
		moral = moral - 23
	}
	
	method hacerUnaPlayA(invocador){
		habilidad = habilidad + 5
		if(self.puedoRealizarInsecAl(invocador)){
			ego = ego + 69
		}
	}
	method puedoRealizarInsecAl(invocador) {
		return habilidad > invocador.habilidad() or 
					ego > 100 
	}
}