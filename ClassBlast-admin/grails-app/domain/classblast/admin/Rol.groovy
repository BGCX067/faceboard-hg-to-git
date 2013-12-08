package classblast.admin

class Rol {
	TipoRol rolType
	User rolOwner
	Grupo groupRelated
	Parche communityRelated
	Mesaredonda meetingRelated
    static constraints = {
		groupRelated nullable:true
		communityRelated nullable:true
		meetingRelated nullable:true
    }
}
