package classblast.web

class Publicacion {
	User postOwner
	Date postDate
	String postBody
	Parche communityRelated
	Grupo groupRelated
	static hasMany = [commentList : Comentario]
    static constraints = {
    }
}
