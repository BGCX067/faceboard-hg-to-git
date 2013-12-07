package classblast.web.core

import classblast.web.Curso
import classblast.web.Rol
import classblast.web.TipoRol
import classblast.web.User
import classblast.web.Grupo
import classblast.web.Seccion
class GroupController {
	
	def courseList 
	def errorList = []
	public static final NO_ID = 0 
	public static final ADMIN_GROUP_ROL = "AdministradorGrupo"
	def groupNotFound = true
	
    def index() {
		def groupId = params.groupid
		def grupo = Grupo.get(groupId==null?NO_ID:groupId)
		def userRolInGroup = Rol.findByRolOwnerAndGroupRelated(session.user,grupo)
		def typeRolInGroup = userRolInGroup.rolType.rolType
		groupNotFound = (groupId==null || grupo==null)
		render (view:"/group/index",
			model:[groupNotFound:groupNotFound,
				grupo:grupo,
				isAdmin:typeRolInGroup==ADMIN_GROUP_ROL])
	}
	def create(){
		courseList = Curso.findAll()
		render(view:"/group/create")
	}
	
	def createGroupProcess(){
		errorList = []
		Seccion s = new Seccion(sectionName:"seccion-linked-to-group")
		def groupName = params.group_name
		def groupDescription = params.group_description
		def courseId = params.course_related
		def grupo = new Grupo(
			 groupName: groupName, 
			 groupDescription: groupDescription,
			 courseRelated: Curso.findAllById(courseId),
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
			def tipoRol = TipoRol.findAllByRolType("AdministradorGrupo").get(0)
			def rol = new Rol(rolType:tipoRol,rolOwner: user,groupRelated:grupo )
			rol.save()
			redirect(action:"index",params:[groupid:grupo.id])
		}
	}
	
	def loadPostList(grupo){
		def postList = grupo.postList;
		
	}
	
	def createPost(){
		print ".p"
	}
}
