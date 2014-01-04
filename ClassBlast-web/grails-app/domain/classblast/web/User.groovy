package classblast.web

class User {
	String login
	String email
	String firstName
	String lastName
	String encryptedPassword
	String fullName = firstName+' '+lastName
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
		notificationList:Notificacion
	]
	static mappedBy = [conversation1List:'user1Related',
		conversation2List:'user2Related']
	static constraints = {
	}
	static transients = [ "fullName" ]

	
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
	
	def getGroupRolOfUser(Grupo group){
		def rolToReturn = null
		this.rolList.each {
			if(it.groupRelated!=null && it.groupRelated.id==group.id)
				rolToReturn = it
		}
		rolToReturn
	}
	def getCommunityRolOfUser(Parche community){
		def rolToReturn = null
		this.rolList.each {
			if(it.communityRelated!=null && it.communityRelated.id==community.id)
				rolToReturn = it;
		}
		rolToReturn
	}
}
