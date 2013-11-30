package classblast.admin

class Privilegio {
	String privilegeDescription
	boolean privilegeValue
	static hasMany = [rolList:Rol]
	static constraints = {
	}
}
