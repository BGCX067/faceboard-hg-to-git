package classblast.web

class TipoRol {
	String rolType
	String rolDescription
	static hasMany = [privilegeList : Privilegio, rolList: Rol]
    static constraints = {
    }
}
