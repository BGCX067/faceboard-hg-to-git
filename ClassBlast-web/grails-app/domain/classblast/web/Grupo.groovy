package classblast.web

import java.util.Date;

class Grupo {
	enum GroupState{TO_START,ONGOING,FINISHED}
	String groupName
	String groupDescription
	Curso courseRelated
	GroupState groupState
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
