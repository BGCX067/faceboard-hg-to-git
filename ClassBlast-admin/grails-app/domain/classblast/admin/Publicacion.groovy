package classblast.admin

import java.util.Date;

class Publicacion {
	User postOwner
	Date postDate
	String postBody
	Parche communityRelated
	Grupo groupRelated
	static hasMany = [commentList : Comentario]
    static constraints = {
		communityRelated nullable:true
		groupRelated nullable:true
    }
}
