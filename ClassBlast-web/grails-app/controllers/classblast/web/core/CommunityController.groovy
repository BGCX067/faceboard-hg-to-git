package classblast.web.core

import classblast.web.Comentario;
import classblast.web.Parche
import classblast.web.Publicacion;
import classblast.web.Solicitud;
import classblast.web.Rol
import classblast.web.Tag
import classblast.web.TipoRol
import classblast.web.User
import main.GeneralUtils

class CommunityController {
	def errorList = []
	static allowedMethods = [save: "POST", update: "POST", delete: "POST", list: "GET"]
	def communityNotFound = true
	public static final NO_ID = 0
	public static final ADMIN_COMMUNITY_ROL = "AdministradorParche"
	def parche
	def isAdmin
	def communityId
	def groupList
	def communityList
	def isUserInCommunity
	def isRequestSent
	def resultsUserList
	def communityPossibleRolList
	def searchUserInput
	def searchNewUserInput
	def index() {
		parametersLoad()
		render (view:"/community/index",
		model:[communityNotFound:communityNotFound,
			parche:parche,
			isAdmin:isAdmin,
			isUserInCommunity:isUserInCommunity,
			isRequestSent:isRequestSent,
			groupList:groupList,
			communityList:communityList])
	}

	def setup(){
		communityId = params.communityid
		parche = Parche.get(communityId==null?NO_ID:communityId)
		def userRolInCommunity = communityId!=null?
				Rol.findByRolOwnerAndCommunityRelated(session.user,parche):null
		def typeRolInCommunity = userRolInCommunity!=null?userRolInCommunity.rolType.rolType:null
		isAdmin = typeRolInCommunity==ADMIN_COMMUNITY_ROL
		communityNotFound = (communityId==null || parche==null)
		if(!isAdmin && userRolInCommunity!=null){
			redirect(action:"index",model:[communityid:communityId])
		}
		render (view:"/community/setup",
		model:[communityNotFound:communityNotFound,
			parche:parche,
			isAdmin:isAdmin,
			tagListFree:parche!=null?10-parche.tagList.size():0])
	}

	def create() {
		render (view:"/community/create")
	}

	def userspanel(){
		parametersLoad()
		def pendingRequestList = Solicitud.findAllByCommunityRelatedAndRequestState(parche,"Pendiente")
		communityPossibleRolList = [
			TipoRol.findByRolType("AdministradorParche"),
			TipoRol.findByRolType("ParticipanteParche")
		]
		if(communityNotFound || !isUserInCommunity || !isAdmin){
			redirect(action:"index", params:[communityid:communityId])
		}
		else{
			render(view:"/community/userspanel",
			model:[parche:parche,
				isAdmin:isAdmin,
				groupList:groupList,
				communityList:communityList,
				pendingRequestList:pendingRequestList,
				rolList:communityPossibleRolList])
		}
	}

	def createCommunityProcess(){
		errorList = []
		def tagList = []
		def communityName = params.community_name
		def communityDescription = params.community_description
		def tagParamList = [
			params.tag1,
			params.tag2,
			params.tag3,
			params.tag4,
			params.tag5,
			params.tag6,
			params.tag7,
			params.tag8,
			params.tag9,
			params.tag10
		]
		def parche = new Parche(
				communityName: communityName,
				communityDescription: communityDescription,
				creationDate: new Date(),
				communityType: params.community_state)
		if (parche.hasErrors()) {
			respond parche.errors,view:"create"
		}
		else{
			parche.save();
			if (parche.hasErrors()) {
				errorList = parche.errors.allErrors
				redirect (action:'create')
				return
			}
			def user = User.get(session["user"].id)
			user.addToCommunityList(parche)
			user.save(flush:true)
			def tipoRol = TipoRol.findAllByRolType("AdministradorParche").get(0)
			def rol = new Rol(rolType:tipoRol,rolOwner: user, communityRelated:parche )
			rol.save()
			tagParamList.each{
				if(it!=null){
					def tag = new Tag(tagDescription:it,communityRelated:parche)
					tag.save()
				}
			}
			redirect(action:"index",params:[communityid:parche.id])
		}
	}

	def editCommunityProcess(){
		errorList = []
		def tagList = []
		def communityName = params.community_name
		def communityDescription = params.community_description
		def tagParamList = [
			params.tag1,
			params.tag2,
			params.tag3,
			params.tag4,
			params.tag5,
			params.tag6,
			params.tag7,
			params.tag8,
			params.tag9,
			params.tag10
		]
		def parche = Parche.get(params.communityid)
		parche.communityName = communityName
		parche.communityDescription = communityDescription
		parche.communityType = params.community_state
		if (parche.hasErrors()) {
			respond parche.errors,view:"setup"
		}
		else{
			parche.save();
			if (parche.hasErrors()) {
				errorList = parche.errors.allErrors
				redirect (action:'setup',model:['communityid':communityId])
				return
			}
			def tagToUpdateList = Tag.findAllByCommunityRelated(parche)
			tagToUpdateList.each{
				parche.removeFromTagList(it)
				it.delete(flush:true)
			}
			tagParamList.each{
				if(it!=null){
					def tag = new Tag(tagDescription:it,communityRelated:parche)
					tag.save()
				}
			}
			redirect(action:"index",params:[communityid:parche.id])
		}
	}



	def createPost(){
		def post_title = params.post_title
		def post_body = params.post_body
		def publicacion = new Publicacion(postOwner:session.user,
		postDate:new Date(),postBody:post_body,communityRelated:parche)
		publicacion.save()
		render (template:"/modules/postlistmodule",model:['postList':Parche.get(communityId).postList])
	}

	def editPost(){
		def post = Publicacion.get(params.post_id)
		post.postBody = params.post_body
		post.save()
		render (template:"/modules/postlistmodule",model:['postList':Parche.get(communityId).postList])
	}

	def deletePost(){
		def publicacion = Publicacion.get(params.id)
		parche.removeFromPostList(publicacion)
		def pToList = showPublicationList(Parche.get(communityId).postList, publicacion)
		render (template:"/modules/postlistmodule",model:['postList':pToList])
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

	def editComment(){
		def comment = Comentario.get(params.comment_id)
		def post = comment.postLinked
		comment.commentBody = params.comment_body
		comment.save()
		def commentList = Publicacion.get(post.id).commentList
		render template:"/modules/commentlistmodule",
		model:['commentList':commentList,'isAdmin':isAdmin]
	}

	def sendRequest(){
		def requestt = new Solicitud(requestDate: new Date(), communityRelated:parche,
		userInterested:session.user,requestState:"Pendiente")
		requestt.save(flush:true)
		isRequestSent = true
		render template:"/modules/request_controls", model:['isRequestSent':isRequestSent]
	}

	def cancelRequest(){
		def requestList = Solicitud.findAllByUserInterestedAndCommunityRelated(session.user,parche)
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
		render(template:"/modules/userspanel/usersdtable",model:['mode':'parche',
			'userList':resultsUserList,'parche':parche,'rolList':communityPossibleRolList])
	}
	
	def searchNewUserInAdmin(){
		searchNewUserInput = params.newuserdescription
		resultsUserList = new GeneralUtils().
							loadSelectedUserListWithCommunityByNameAndNotInside(searchNewUserInput,parche)
		render(template:"/modules/userspanel/newusersdtable",model:['mode':'parche',
			'userList':resultsUserList,'parche':parche,'rolList':communityPossibleRolList,
			'messageNotFound':'No hay usuarios con esa descripción'])
	}

	def executeSearch(userDescription,modeSearch){
		def gu = new GeneralUtils()
		resultsUserList = []
		if(modeSearch=='Por nombre'){
			resultsUserList = gu.loadSelectedUserListWithCommunityByName(userDescription,parche)
		}
		if(modeSearch=='Por usuario de login'){
			resultsUserList = gu.loadSelectedUserListWithCommunityByLogin(userDescription, parche)
		}
		if(modeSearch=='Por correo'){
			resultsUserList = gu.loadSelectedUserListWithCommunityByEmail(userDescription, parche)
		}
	}
	def deleteSearchResults(){
		for(int i=1;i<100000;i++){print i} //espera programada
		render(template:"/modules/userspanel/usersdtable",model:['mode':'parche',
			'userList':Parche.get(parche.id).userList,'parche':Parche.get(parche.id),'rolList':communityPossibleRolList])
	}

	def acceptRequest(){
		def requestObject = Solicitud.get(params.requestId)
		User userInterested = requestObject.userInterested
		def rolToAdd = TipoRol.findById(params.rol_field)
		def rolToNewIntegrant = new Rol(rolType:rolToAdd,rolOwner:userInterested,communityRelated:Parche.get(parche.id))
		rolToNewIntegrant.save(flush:true)
		userInterested.addToCommunityList(Parche.get(parche.id))
		userInterested.save(flush:true)
		requestObject.requestState = "aceptado"
		requestObject.save(flush:true)
		render(template:"/modules/userspanel/requestsdtable",model:['mode':'parche',
			'requestList':Solicitud.findAllByCommunityRelatedAndRequestState(parche,"Pendiente"),
			'parche':parche,'rolList':communityPossibleRolList])
	}

	def changeRolOfUser(){
		def userTarget = User.get(params.userId)
		def newRolType = TipoRol.findById(params.rol_field_to_change)
		def rolOfUser = Rol.findByRolOwnerAndCommunityRelated(userTarget,parche)
		rolOfUser.rolType = newRolType
		rolOfUser.save(flush:true)
		render(template:"/modules/userspanel/usersrecord",model:['mode':'parche',
			'userItem':userTarget,
			'parche':parche,'rolList':communityPossibleRolList])
	}

	def rejectRequest(){
		def requestObject = Solicitud.get(params.requestId)
		requestObject.requestState = "rechazado"
		requestObject.save(flush:true)
		render(template:"/modules/userspanel/requestsdtable",model:['mode':'parche',
			'requestList':Solicitud.findAllByCommunityRelatedAndRequestState(parche,"Pendiente"),
			'parche':parche,'rolList':communityPossibleRolList])
	}

	def addUserTo(){
		def userTarget = User.get(params.userId)
		def rolToAdd = TipoRol.findById(params.rol_field2)
		def rolToNewIntegrant = new Rol(rolType:rolToAdd,rolOwner:userTarget,communityRelated:Parche.get(parche.id))
		rolToNewIntegrant.save(flush:true)
		userTarget.addToCommunityList(Parche.get(parche.id))
		userTarget.save(flush:true)
		render(template:"/modules/userspanel/newusersdtable",model:['mode':'parche',
			'userList':new GeneralUtils().loadSelectedUserListWithCommunityByNameAndNotInside(searchNewUserInput,parche),
			'parche':parche,'rolList':communityPossibleRolList,
			'messageNotFound':'No hay usuarios con esa descripción'])
	}
	
	def deleteUserFrom(){
		def userToDeleteFrom = User.get(params.userId)
		def communityRelated = Parche.get(parche.id)
		def rolFromUserToDelete = Rol.findByRolOwnerAndCommunityRelated(userToDeleteFrom,communityRelated)
		rolFromUserToDelete.delete(flush:true)
		userToDeleteFrom.removeFromCommunityList(communityRelated)
		communityRelated.save()
		userToDeleteFrom.save()
		render(template:"/modules/userspanel/usersdtable",model:['mode':'parche',
			'userList':communityRelated.userList,'parche':parche,'rolList':communityPossibleRolList])
	}

	def parametersLoad(){
		groupList = new GeneralUtils().loadCollectionsOfUser(session["user"])
		communityList = new GeneralUtils().loadCommunityListOfUser(session["user"])
		communityId = params.communityid
		parche = Parche.get(communityId==null?NO_ID:communityId)
		def userRolInCommunity = communityId!=null?
				Rol.findByRolOwnerAndCommunityRelated(session.user,parche):null
		def typeRolInCommunity = userRolInCommunity!=null?userRolInCommunity.rolType.rolType:null
		isAdmin = typeRolInCommunity==ADMIN_COMMUNITY_ROL
		communityNotFound = (communityId==null || parche==null)
		isUserInCommunity = communityNotFound?!communityNotFound:new GeneralUtils().isUserInCommunity(session.user,parche)
		def requestList = Solicitud.findAllByUserInterestedAndCommunityRelated(session.user,parche)
		isRequestSent = false
		requestList.each{
			if(it.requestState.equals("Pendiente"))
				isRequestSent = true
		}
	}
}
