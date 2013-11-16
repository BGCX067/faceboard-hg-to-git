package classblast.web

class Apunte {
	String contenidoHtml
	java.util.Date fechaApunte //No hay seguridad de esta implementación
	Tema topic
	Seccion section
	static hasMany = [homeworkList:Tarea]
    static constraints = {
		// ¿Qué poner aquí?
    }
}
