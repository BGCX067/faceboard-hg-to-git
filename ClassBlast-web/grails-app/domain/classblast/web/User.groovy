package classblast.web

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
		communityList:Parche
		]
	static mappedBy = [conversation1List:'user1Related',
		conversation2List:'user2Related']
    static constraints = {
    }
}
