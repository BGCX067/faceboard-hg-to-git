package classblast.web

class Cuaderno {
	String bookName
	Semestre semesterRelated
	Curso courseRelated
	User bookOwner
	static hasMany = [sectionList:Seccion]
    static constraints = {
    }
}
