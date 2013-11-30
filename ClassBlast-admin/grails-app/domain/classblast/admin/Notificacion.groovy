package classblast.admin

import java.util.Date;

class Notificacion {
	enum NotificationType{
		NEW_MESSAGE,
		POST_REPLY,
		POST_DELETED,
		NEW_POST,
		COMMENT_DELETED,
		NEW_HOMEWORK,
		NEW_MEETING
	}
	NotificationType notificationType
	Date notificationDate
	User userRelated
	Grupo groupRelated
	Parche communityRelated
	Publicacion postRelated
	Conversacion talkRelated
	Mesaredonda meetingRelated
    static constraints = {
    }
}
