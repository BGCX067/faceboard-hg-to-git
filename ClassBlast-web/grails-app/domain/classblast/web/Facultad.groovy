package classblast.web

class Facultad {
	String facultyName
	static hasMany = [careerList:Carrera]
    static constraints = {
    }
}
