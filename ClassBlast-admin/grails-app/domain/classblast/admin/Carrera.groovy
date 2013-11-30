package classblast.admin

class Carrera {
	static hasMany = [courseList:Curso]
	String careerName
	Facultad faculty
	static constraints = {
	}
}
