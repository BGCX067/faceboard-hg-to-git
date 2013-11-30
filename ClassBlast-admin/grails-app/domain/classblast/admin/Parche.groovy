package classblast.admin

import java.util.Date;

class Parche {
	enum CommunityType{
		OPEN,PUBLIC,PRIVATE
	}
	String communityName
	String communityDescription
	Date creationDate
	Curso courseRelated
	Semestre semesterRelated
	CommunityType communityType
	static hasMany = [
		communityRolList:Rol,
		postList:Publicacion,
		userList:User
	]
	static belongsTo = User
	static constraints = {
	}
}
