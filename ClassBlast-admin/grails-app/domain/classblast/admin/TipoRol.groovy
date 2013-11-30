package classblast.admin

class TipoRol {
	enum RolType {GENERIC,GROUP}
	RolType rolType
	static hasMany = [privilegeList : Privilegio, rolList: Rol]
    static constraints = {
    }
}
