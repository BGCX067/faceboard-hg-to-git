package classblast.web.core

import classblast.web.Curso
import classblast.web.User
import classblast.web.Grupo
import classblast.web.Seccion
class GroupController {
	
	def courseList 
	def errorList = []

    def index() { }
	
	def create(){
		courseList = Curso.findAll()
		render(view:"/group/create")
	}
	
	def createGroupProcess(){
		errorList = []
		Seccion s = new Seccion(sectionName:"seccion-linked-to-group")
		def groupState = Grupo.GroupState.TO_START
		def groupName = params.group_name
		def groupDescription = params.group_description
		def courseId = params.course_related
		def grupo = new Grupo(
			 groupName: groupName, 
			 groupDescription: groupDescription,
			 courseRelated: Curso.findAllById(courseId), 
			 groupState: groupState,
			 creationDate: new Date(),
			 courseSection: s )
		grupo.groupState = "Por empezar"
		if (grupo.hasErrors()) {
			respond grupo.errors,view:"create"
		}
		else{
			s.save()
			grupo.save();
			if (grupo.hasErrors()) {
				errorList = grupo.errors.allErrors
				redirect (action:'create')
				return
			}
			s.setGroupRelated(grupo)
			s.save();
			def user = User.get(session["user"].id)
			user.addToGroupList(grupo)
			redirect(action:"index",params:[groupid:grupo.id])
		}
	}
}
