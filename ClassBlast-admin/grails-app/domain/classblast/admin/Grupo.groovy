package classblast.admin

import java.util.Date;

class Grupo {
	String groupName
	String groupDescription
	Curso courseRelated
	String groupState
	Date creationDate
	Seccion courseSection
	static hasMany = [
		groupRolList:Rol,
		fileList:Archivo,
		homeworkList:Tarea,
		meetingList:Mesaredonda,
		postList:Publicacion,
		userList:User
		]
	static belongsTo = User
	static constraints = {
	}
}
