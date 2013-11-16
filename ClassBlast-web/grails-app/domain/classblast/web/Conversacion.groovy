package classblast.web

class Conversacion {
	enum Category {
		PRIVATE,PUBLIC,GROUP
	}
	Category talkCategory
	Grupo groupRelated
	Parche communityRelated
	User user1Related
	User user2Related
	static hasMany = [messageList:Mensaje]
    static constraints = {
    }
}
