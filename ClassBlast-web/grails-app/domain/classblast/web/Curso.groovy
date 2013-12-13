package classblast.web

class Curso {
	static hasMany = [
		careerList:Carrera,
		facultyList:Facultad,
		semesterList:Semestre,
		bookList:Cuaderno,
		groupList:Grupo,
		tagList:Tag
		]
	static belongsTo = Carrera
	String courseName
    static constraints = {
		tagList nullable:true
    }
}
