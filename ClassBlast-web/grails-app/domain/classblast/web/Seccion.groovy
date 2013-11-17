package classblast.web

class Seccion {
	String sectionName
	//Cuaderno bookRelated
	//Grupo groupRelated
	static hasMany = [noteList : Apunte ]
    static constraints = {
    }
}
