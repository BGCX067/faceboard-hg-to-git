package classblast.web

class Solicitud {
	User userInterested
	Grupo groupRelated
	Parche communityRelated
	Date requestDate
	String requestState
    static constraints = {
		groupRelated nullable:true
		communityRelated nullable:true
    }
}
