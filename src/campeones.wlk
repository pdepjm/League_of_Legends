import solucion.*

// Los campeones con y sin mecánica son POLIMORFICOS para
// los invocadores (que les mandan el mensaje asesinar y morirse).

// En el diagrama hicimos una interfaz para explicitar esto.
// La interfaz se llama Campeon, y tiene dos mensajes:
// asesinar(campeon) y morirse().
// Así sabemos en el diagrama qué objetos deben cumplir el 
// CONTRATO, respetar la INTERFAZ para ser polimórficos.
// Siempre que hicimos polimorfismo en el pasado, había una 
// interfaz que era justamente el contrato que debían cumplir
// todos los objetos para ser polimórficos.
// La interfaz en Wollok es una IDEA.
// Otros lenguajes de programación (como Java) me OBLIGAN a poner
// interfaces en el código para usar polimórficamente dos objetos.

class CampeonConMecanica {
	var miInvocador
	
	method asesinar(campeon){
		miInvocador.hacerleUnaPlayA(campeon.invocador())
	}
	method morirse(){
		miInvocador.poneteTriste()
	}
}

class CampeonSinMecanica {
	var miInvocador
	method asesinar(campeon){
		miInvocador.multiplicarEgo(1.15)
	}
	method morirse(){
		miInvocador.enojarse()
	}
}
