package classblast.web

class Seccion {
	String sectionName
	//Cuaderno bookRelated
	//Grupo groupRelated
	static label = "miSeccion"
	static hasMany = [noteList : Apunte ]
    static constraints = {
    }
}
