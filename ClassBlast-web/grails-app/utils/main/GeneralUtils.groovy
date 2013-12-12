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

	def getRolByUserAndGroup(User user, Grupo group){
		return Rol.findByOwnerAndGroupRelated(user,group);
	}

	def getRolByUserAndCommunity(User user, Parche community){
	}
}
