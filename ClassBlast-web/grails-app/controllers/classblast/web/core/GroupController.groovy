package classblast.web.core

import classblast.web.Comentario
import classblast.web.Curso
import classblast.web.Publicacion
import classblast.web.Rol
import classblast.web.TipoRol
import classblast.web.User
import classblast.web.Grupo
import classblast.web.Seccion

class GroupController {
	def courseList
	def errorList = []
	static allowedMethods = [save: "POST", update: "POST", delete: "POST", list: "GET"]
	public static final NO_ID = 0
	public static final ADMIN_GROUP_ROL = "AdministradorGrupo"
	def groupNotFound = true
	def grupo
	def isAdmin
	def groupId

	def index() {
		groupId = params.groupid
		grupo = Grupo.get(groupId==null?NO_ID:groupId)
		def userRolInGroup = groupId!=null?
		Rol.findByRolOwnerAndGroupRelated(session.user,grupo):null
		def typeRolInGroup = userRolInGroup!=null?userRolInGroup.rolType.rolType:null
		isAdmin = typeRolInGroup==ADMIN_GROUP_ROL
		groupNotFound = (groupId==null || grupo==null)
		render (view:"/group/index",
		model:[groupNotFound:groupNotFound,
			grupo:grupo,
			isAdmin:isAdmin])
	}
	def create(){
		courseList = Curso.findAll()
		render(view:"/group/create")
	}
	def posts(){
		render(view:"/group/posts")
	}
	def roundtable(){
		render(view:"/group/roundtable")
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
		def post_title = params.post_title
		def post_body = params.post_body
		def publicacion = new Publicacion(postOwner:session.user,
			postDate:new Date(),postBody:post_body,groupRelated:grupo)
		publicacion.save()
		render (template:"/modules/postlistmodule",model:['postList':Grupo.get(groupId).postList])
	}
	
	def deletePost(){
		def publicacion = Publicacion.get(params.id)
		grupo.removeFromPostList(publicacion)
		def pToList = showPublicationList(Grupo.get(groupId).postList, publicacion)
		render (template:"/modules/postlistmodule",model:['postList':pToList])
	}
	
	def deleteComment(){
		print "eliminando"
		def comment = Comentario.get(params.id)
		def post = comment.postLinked
		post.removeFromCommentList(comment)
		comment.delete()
		def commentList = Publicacion.get(post.id).commentList
		def cToList = showCommentList(commentList, comment)
		render template:"/modules/commentlistmodule",
				model:['commentList':cToList,'isAdmin':isAdmin]
	}
	
	def showPublicationList(postList,Publicacion postException){
		def listToReturn = []
		for(Publicacion postItem:postList){
			if(postItem.id!=postException.id){
				listToReturn+=postItem
			}
		}
		return listToReturn
	}
	
	def showCommentList(commentList,Comentario commentException){
		def listToReturn = []
		for(Comentario commentItem:commentList){
			if(commentItem.id!=commentException.id){
				listToReturn+=commentItem
			}
		}
		//print listToReturn
		return listToReturn
	}
	
	def addComment(){
		def post_id = params.post_id
		def comment_body = params.comment_body
		def publicacion = Publicacion.get(post_id)
		def comment = new Comentario(owner:session.user,
			commentDate:new Date(),commentBody:comment_body,postLinked:publicacion)
		comment.save(flush:true)
		render template:"/modules/commentlistmodule",
				model:['commentList':publicacion.commentList,'isAdmin':isAdmin]
	}
	
}