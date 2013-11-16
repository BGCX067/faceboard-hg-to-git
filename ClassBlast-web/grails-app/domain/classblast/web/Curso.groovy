package classblast.web

class Curso {
	String courseName
	
	static hasMany = [
		careerList:Carrera,
		facultyList:Facultad,
		semesterList:Semestre,
		bookList:Cuaderno,
		groupList:Grupo
		]
	
    static constraints = {
    }
}
