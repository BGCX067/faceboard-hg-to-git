package main

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
}
