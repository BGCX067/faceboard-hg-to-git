package classblast.admin

class Facultad {
	String facultyName
	static hasMany = [careerList:Carrera]
	static constraints = {
	}
}
