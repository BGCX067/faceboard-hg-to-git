package classblast.web

class Curso {
	static hasMany = [
		careerList:Carrera,
		facultyList:Facultad,
		semesterList:Semestre,
		bookList:Cuaderno,
		groupList:Grupo
		]
	static belongsTo = Carrera
	Carrera career
	String courseName
    static constraints = {
    }
}
