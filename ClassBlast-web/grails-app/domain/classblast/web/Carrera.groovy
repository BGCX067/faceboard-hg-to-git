package classblast.web

class Carrera {
	String careerName
	Facultad faculty
	static hasMany = [courseList:Curso]
    static constraints = {
    }
}
