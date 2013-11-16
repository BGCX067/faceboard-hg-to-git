package classblast.web

class Tarea {
	String homeworkTitle
	String htmlDescription
	Date creationDate
	Date deadline
	Tarea associatedCourseHomework
	Grupo groupRelated
	Apunte noteRelated
    static constraints = {
    }
}
