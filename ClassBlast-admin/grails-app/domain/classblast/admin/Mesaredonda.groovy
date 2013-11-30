package classblast.admin

import java.util.Date;

class Mesaredonda {
	String meetingTopic
	Date meetingDate
	static belongsTo = User
	static hasMany = [
		partakerList:User,
		meetingRolList:Rol,
		entryList:Participacion
		]
	static constraints = {
	}
}
