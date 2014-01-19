package classblast.web

class Conversacion {
	String talkCategory
	Grupo groupRelated
	Parche communityRelated
	User user1Related
	User user2Related
	static hasMany = [messageList:Mensaje]
	static constraints = {
		groupRelated nullable:true
		communityRelated nullable:true
		user1Related nullable:true
		user2Related nullable:true
    }
}
