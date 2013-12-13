package classblast.web.core

import classblast.web.Comentario;
import classblast.web.Parche
import classblast.web.Publicacion;
import classblast.web.Rol
import classblast.web.Tag
import classblast.web.TipoRol
import classblast.web.User

class CommunityController {
	def errorList = []
	static allowedMethods = [save: "POST", update: "POST", delete: "POST", list: "GET"]
	def communityNotFound = true
	public static final NO_ID = 0
	public static final ADMIN_COMMUNITY_ROL = "AdministradorParche"
	def parche
	def isAdmin
	def communityId

	def index() {
		communityId = params.communityid
		parche = Parche.get(communityId==null?NO_ID:communityId)
		def userRolInCommunity = communityId!=null?
				Rol.findByRolOwnerAndCommunityRelated(session.user,parche):null
		def typeRolInCommunity = userRolInCommunity!=null?userRolInCommunity.rolType.rolType:null
		isAdmin = typeRolInCommunity==ADMIN_COMMUNITY_ROL
		communityNotFound = (communityId==null || parche==null)
		render (view:"/community/index",
		model:[communityNotFound:communityNotFound,
			parche:parche,
			isAdmin:isAdmin])
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

	def deletePost(){
		def publicacion = Publicacion.get(params.id)
		parche.removeFromPostList(publicacion)
		def pToList = showPublicationList(Parche.get(communityId).postList, publicacion)
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
