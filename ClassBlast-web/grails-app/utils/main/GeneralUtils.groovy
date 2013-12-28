package main

import classblast.web.Grupo
import classblast.web.Parche
import classblast.web.User;

class GeneralUtils {

	def prueba(){
		return ":)"
	}

	def loadCollectionsOfUser(User user){
		return new User().loadGroupList(user)
	}

	def loadCommunityListOfUser(User user){
		return new User().loadCommunityList(user)
	}

	def isUserInGroup(User user, Grupo group){
		def userList = group.userList
		def found = false
		userList.each {
			if(it.id==user.id)
				found=true
		}
		found
	}
	
	def isUserInCommunity(User user, Parche community){
		def userList = community.userList
		def found = false
		userList.each {
			if(it.id==user.id)
				found=true
		}
		found
	}
	
	def getRolByUserAndGroup(User user, Grupo group){
		return Rol.findByOwnerAndGroupRelated(user,group);
	}

	def getRolByUserAndCommunity(User user, Parche community){
	}
}
