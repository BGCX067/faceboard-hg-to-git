package classblast.web

class Notificacion {
	/*enum NotificationType{
		NEW_MESSAGE,
		POST_REPLY,
		POST_DELETED,
		NEW_POST,
		COMMENT_DELETED,
		NEW_HOMEWORK,
		NEW_MEETING
	}*/
	Date notificationDate
	User userRelated
	Grupo groupRelated
	Parche communityRelated
	Publicacion postRelated
	Conversacion talkRelated
	Mesaredonda meetingRelated
    static constraints = {
		groupRelated nullable:true
		communityRelated nullable:true
		postRelated nullable:true
		talkRelated nullable:true
		meetingRelated nullable:true
    }
}
