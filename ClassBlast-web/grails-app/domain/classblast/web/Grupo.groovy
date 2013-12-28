package classblast.web

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
	static mapping = {
		postList(sort:'postDate', order:'desc')
		groupRolList cascade: 'all-delete-orphan'
		fileList cascade: 'all-delete-orphan'
		homeworkList cascade: 'all-delete-orphan'
		meetingList cascade: 'all-delete-orphan'
		postList cascade: 'all-delete-orphan'
		userList cascade: 'all-delete-orphan'
	}
	def groupState(option){
		switch(option){
			case "TO_START":
				return "Por empezar"
			case "ONGOING":
				return "En curso"
			case "FINISHED":
				return "Finalizado"
			default:
				return ""
		}
	}
	
	def loadUserList(grupo){
		def studs = User.withCriteria {
			groupList {
			  eq('id', grupo.id)
			}
		  }
		return studs
	}
}
