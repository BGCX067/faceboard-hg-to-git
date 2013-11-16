package classblast.web

class Mesaredonda {
	String meetingTopic
	Date meetingDate
	static hasMany = [
		partakerList:User,
		meetingRolList:Rol,
		entryList:Participacion
		]
    static constraints = {
    }
}
