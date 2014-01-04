package classblast.web.core

import classblast.web.Comentario
import classblast.web.Curso
import classblast.web.Publicacion
import classblast.web.Rol
import classblast.web.Solicitud
import classblast.web.TipoRol
import classblast.web.User
import classblast.web.Grupo
import classblast.web.Seccion
import main.GeneralUtils

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
	def isUserInGroup
	def isRequestSent
	def groupList
	def communityList
	def resultsUserList
	def groupPossibleRolList
	def searchUserInput
	def searchNewUserInput

	def index() {
		parametersLoad()
		render (view:"/group/index",
		model:[groupNotFound:groupNotFound,
			grupo:grupo,
			isAdmin:isAdmin,
			isUserInGroup:isUserInGroup,
			isRequestSent:isRequestSent,
			groupList:groupList,
			communityList:communityList])
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

	def userspanel(){
		parametersLoad()
		def pendingRequestList = Solicitud.findAllByGroupRelatedAndRequestState(grupo,"Pendiente")
		groupPossibleRolList = [
			TipoRol.findByRolType("AdministradorGrupo"),
			TipoRol.findByRolType("MonitorGrupo"),
			TipoRol.findByRolType("EstudianteGrupo"),
			TipoRol.findByRolType("AsistenteGrupo")
		]
		if(groupNotFound || !isUserInGroup || !isAdmin){
			redirect(action:"index", params:[groupid:groupId])
		}
		else{
			render(view:"/group/userspanel",
			model:[grupo:grupo,isAdmin:isAdmin,groupList:groupList,
				communityList:communityList,
				pendingRequestList:pendingRequestList,
				rolList:groupPossibleRolList, isUserInGroup: isUserInGroup])
		}
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

	def editPost(){
		def post = Publicacion.get(params.post_id)
		post.postBody = params.post_body
		post.save()
		render (template:"/modules/postlistmodule",model:['postList':Grupo.get(groupId).postList])
	}

	def deletePost(){
		def publicacion = Publicacion.get(params.id)
		grupo.removeFromPostList(publicacion)
		def pToList = showPublicationList(Grupo.get(groupId).postList, publicacion)
		render (template:"/modules/postlistmodule",model:['postList':pToList])
	}

	def editComment(){
		def comment = Comentario.get(params.comment_id)
		def post = comment.postLinked
		comment.commentBody = params.comment_body
		comment.save()
		def commentList = Publicacion.get(post.id).commentList
		render template:"/modules/commentlistmodule",
		model:['commentList':commentList,'isAdmin':isAdmin]
	}

	def deleteComment(){
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







	def sendRequest(){
		def requestt = new Solicitud(requestDate: new Date(), groupRelated:grupo,
		userInterested:session.user,requestState:"Pendiente")
		requestt.save(flush:true)
		isRequestSent = true
		render template:"/modules/request_controls", model:['isRequestSent':isRequestSent]
	}

	def cancelRequest(){
		def requestList = Solicitud.findAllByUserInterestedAndGroupRelated(session.user,grupo)
		isRequestSent = false
		requestList.each{
			if(!it.requestState.equals("cancelado")){
				it.requestState = "cancelado"
				it.save(flush:true)
			}
		}
		render template:"/modules/request_controls", model:['isRequestSent':isRequestSent]
	}

	def searchUserInAdmin(){
		searchUserInput = params.newuserdescription
		executeSearch(params.userdescription,params.modesearch)
		render(template:"/modules/userspanel/usersdtable",model:['mode':'grupo',
			'userList':resultsUserList,'grupo':grupo,'rolList':groupPossibleRolList])
	}

	def searchNewUserInAdmin(){
		searchNewUserInput = params.newuserdescription
		resultsUserList = new GeneralUtils().
				loadSelectedUserListWithGroupByNameAndNotInside(searchNewUserInput,grupo)
		render(template:"/modules/userspanel/newusersdtable",model:['mode':'grupo',
			'userList':resultsUserList,'grupo':grupo,'rolList':groupPossibleRolList,
			'messageNotFound':'No hay usuarios con esa descripción'])
	}

	def executeSearch(userDescription,modeSearch){
		def gu = new GeneralUtils()
		resultsUserList = []
		if(modeSearch=='Por nombre'){
			resultsUserList = gu.loadSelectedUserListWithGroupByName(userDescription,grupo)
		}
		if(modeSearch=='Por usuario de login'){
			resultsUserList = gu.loadSelectedUserListWithGroupByLogin(userDescription, grupo)
		}
		if(modeSearch=='Por correo'){
			resultsUserList = gu.loadSelectedUserListWithGroupByEmail(userDescription, grupo)
		}
	}
	def deleteSearchResults(){
		for(int i=1;i<100000;i++){print i} //espera programada
		render(template:"/modules/userspanel/usersdtable",model:['mode':'grupo',
			'userList':Grupo.get(grupo.id).userList,'grupo':Grupo.get(grupo.id),'rolList':groupPossibleRolList])
	}

	def acceptRequest(){
		def requestObject = Solicitud.get(params.requestId)
		User userInterested = requestObject.userInterested
		def rolToAdd = TipoRol.findById(params.rol_field)
		def rolToNewIntegrant = new Rol(rolType:rolToAdd,rolOwner:userInterested,groupRelated:Grupo.get(grupo.id))
		rolToNewIntegrant.save(flush:true)
		userInterested.addToGroupList(Grupo.get(grupo.id))
		userInterested.save(flush:true)
		requestObject.requestState = "aceptado"
		requestObject.save(flush:true)
		render(template:"/modules/userspanel/requestsdtable",model:['mode':'grupo',
			'requestList':Solicitud.findAllByGroupRelatedAndRequestState(grupo,"Pendiente"),
			'grupo':grupo,'rolList':groupPossibleRolList])
	}

	def changeRolOfUser(){
		def userTarget = User.get(params.userId)
		def newRolType = TipoRol.findById(params.rol_field_to_change)
		def rolOfUser = Rol.findByRolOwnerAndGroupRelated(userTarget,grupo)
		rolOfUser.rolType = newRolType
		rolOfUser.save(flush:true)
		render(template:"/modules/userspanel/usersrecord",model:['mode':'grupo',
			'userItem':userTarget,
			'grupo':grupo,'rolList':groupPossibleRolList])
	}

	def rejectRequest(){
		def requestObject = Solicitud.get(params.requestId)
		requestObject.requestState = "rechazado"
		requestObject.save(flush:true)
		render(template:"/modules/userspanel/requestsdtable",model:['mode':'grupo',
			'requestList':Solicitud.findAllByGroupRelatedAndRequestState(grupo,"Pendiente"),
			'grupo':grupo,'rolList':groupPossibleRolList])
	}

	def addUserTo(){
		def userTarget = User.get(params.userId)
		def rolToAdd = TipoRol.findById(params.rol_field2)
		def rolToNewIntegrant = new Rol(rolType:rolToAdd,rolOwner:userTarget,groupRelated:Grupo.get(grupo.id))
		rolToNewIntegrant.save(flush:true)
		userTarget.addToGroupList(Grupo.get(grupo.id))
		userTarget.save(flush:true)
		render(template:"/modules/userspanel/newusersdtable",model:['mode':'grupo',
			'userList':new GeneralUtils().loadSelectedUserListWithGroupByNameAndNotInside(searchNewUserInput,grupo),
			'grupo':grupo,'rolList':groupPossibleRolList,
			'messageNotFound':'No hay usuarios con esa descripción'])
	}

	def deleteUserFrom(){
		print "entering"
		def userToDeleteFrom = User.get(params.userId)
		def groupRelated = Grupo.get(grupo.id)
		def rolFromUserToDelete = Rol.findByRolOwnerAndGroupRelated(userToDeleteFrom,groupRelated)
		try{
			userToDeleteFrom.removeFromGroupList(groupRelated)
			userToDeleteFrom.removeFromRolList(rolFromUserToDelete)
			rolFromUserToDelete.delete(flush:true)
			groupRelated.save()
		}
		catch(Exception e){

		}
		print Grupo.get(grupo.id).userList
		render(template:"/modules/userspanel/usersdtable",model:['mode':'grupo',
			'userList':Grupo.get(grupo.id).userList,'grupo':Grupo.get(grupo.id),'rolList':groupPossibleRolList])
	}






	def parametersLoad(){
		groupList = new GeneralUtils().loadCollectionsOfUser(session["user"])
		communityList = new GeneralUtils().loadCommunityListOfUser(session["user"])
		groupId = params.groupid
		grupo = Grupo.get(groupId==null?NO_ID:groupId)
		def userRolInGroup = groupId!=null?
				Rol.findByRolOwnerAndGroupRelated(session.user,grupo):null
		def typeRolInGroup = userRolInGroup!=null?userRolInGroup.rolType.rolType:null
		isAdmin = typeRolInGroup==ADMIN_GROUP_ROL
		groupNotFound = (groupId==null || grupo==null)
		isUserInGroup = groupNotFound?!groupNotFound:new GeneralUtils().isUserInGroup(session.user,grupo)
		def requestList = Solicitud.findAllByUserInterestedAndGroupRelated(session.user,grupo)
		isRequestSent = false
		requestList.each{
			if(!it.requestState.equals("cancelado"))
				isRequestSent = true
		}
	}
}