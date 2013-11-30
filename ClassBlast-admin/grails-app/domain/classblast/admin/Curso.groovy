package classblast.admin

class Curso {
	static hasMany = [
		careerList:Carrera,
		facultyList:Facultad,
		semesterList:Semestre,
		bookList:Cuaderno,
		groupList:Grupo
	]
	static belongsTo = Carrera
	String courseName
	static constraints = {
	}
}
