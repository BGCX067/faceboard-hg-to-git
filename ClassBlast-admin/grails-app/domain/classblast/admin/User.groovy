package classblast.admin

import java.util.Date;

class User {
	String login
	String email
	String firstName
	String lastName
	String encryptedPassword
	Date registerDate
	static hasMany = [
		postList:Publicacion,
		commentList:Comentario,
		meetingList:Mesaredonda,
		groupList:Grupo,
		requestList:Solicitud,
		conversation1List:Conversacion,
		conversation2List:Conversacion,
		rolList:Rol,
		bookList:Cuaderno,
		communityList:Parche,
		alertList:Notificacion
	]
	static mappedBy = [conversation1List:'user1Related',
		conversation2List:'user2Related']
	static constraints = {
	}
	def loadGroupList(user){
		def studs = Grupo.withCriteria {
			userList {
				eq('id', user.id)
			}
		}
		return studs
	}
	def loadCommunityList(user){
		def studs = Parche.withCriteria {
			userList {
				eq('id', user.id)
			}
		}
		return studs
	}
}
