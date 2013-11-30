package classblast.admin

class Seccion {
	String sectionName
	Cuaderno bookRelated
	Grupo groupRelated
	static label = "miSeccion"
	static hasMany = [noteList : Apunte ]
	static constraints = {
		groupRelated nullable:true
		bookRelated nullable:true
	}
}
