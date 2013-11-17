package classblast.web

class Carrera {
	static hasMany = [courseList:Curso]
	String careerName
	Facultad faculty
    static constraints = {
    }
}
