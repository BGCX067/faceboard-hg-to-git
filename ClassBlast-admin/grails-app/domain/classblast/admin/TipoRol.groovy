package classblast.admin

class TipoRol {
	String rolType
	String rolDescription
	static hasMany = [privilegeList : Privilegio, rolList: Rol]
    static constraints = {
    }
}
