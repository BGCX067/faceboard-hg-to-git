package classblast.web

class Parche {
	String communityName
	String communityDescription
	Date creationDate
	String communityType
	static hasMany = [
		communityRolList:Rol,
		postList:Publicacion,
		userList:User,
		tagList:Tag
		]
	static belongsTo = User
    static constraints = {
    }
}
