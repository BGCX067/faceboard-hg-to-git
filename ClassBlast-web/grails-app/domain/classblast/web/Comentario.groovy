package classblast.web

class Comentario {
	java.util.Date commentDate // No hay seguridad de esta implementación
	String commentBody // texto del comentario
	User owner
	Publicacion postLinked   // publicación a la que pertenece este comentario
    static constraints = {
    }
}
