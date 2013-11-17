package classblast.web

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
