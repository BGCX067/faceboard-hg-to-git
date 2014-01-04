package main

import classblast.web.Grupo
import classblast.web.Parche
import classblast.web.User
import classblast.web.Rol

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
		return Rol.findByRolOwnerAndGroupRelated(user,group);
	}

	def getRolByUserAndCommunity(User user, Parche community){
		return Rol.findByRolOwnerAndCommunityRelated(user,community);
	}

	def loadSelectedUserListWithGroupByEmail(email,group){
		User.withCriteria {
			like('email',email+"%")
			groupList{
				eq('id',group.id)
			}
		}
	}
	def loadSelectedUserListWithGroupByLogin(login,group){
		User.withCriteria {
			like('login',login+"%")
			groupList{
				eq('id',group.id)
			}
		}
	}
	
	def loadSelectedUserListWithCommunityByName(name,community){
		name = name.toString()
		String[] nameList = name.split()
		User.withCriteria {
			or{
				nameList.each {
					like('firstName',"%"+it+"%")
					like('lastName',"%"+it+"%")
				}
			}
			communityList{
				eq('id',community.id)
			}
		}
	}

	def loadSelectedUserListWithGroupByName(name,group){
		name = name.toString()
		String[] nameList = name.split()
		User.withCriteria {
			or{
				nameList.each {
					like('firstName',"%"+it+"%")
					like('lastName',"%"+it+"%")
				}
			}
			groupList{
				eq('id',group.id)
			}
		}
	}

	def loadSelectedUserListWithCommunityByNameAndNotInside(name,community){
		name = name.toString()
		if(name.length()<3)
			return []
		String[] nameList = name.split()
		def userList = []
		def flag = true
		def candidateUserList = User.withCriteria {
			or{
				nameList.each {
					like('firstName',"%"+it+"%")
					like('lastName',"%"+it+"%")
				}
			}
		}
		candidateUserList.each{
			flag=true
			it.communityList.each{
				if(it.id==community.id){
					flag = false
				}
			}
			if(flag)
				userList+=it
		}
		userList
	}
	
	def loadSelectedUserListWithGroupByNameAndNotInside(name,group){
		name = name.toString()
		if(name.length()<3)
			return []
		String[] nameList = name.split()
		def userList = []
		def flag = true
		def candidateUserList = User.withCriteria {
			or{
				nameList.each {
					like('firstName',"%"+it+"%")
					like('lastName',"%"+it+"%")
				}
			}
		}
		candidateUserList.each{
			flag=true
			it.groupList.each{
				if(it.id==group.id){
					flag = false
				}
			}
			if(flag)
				userList+=it
		}
		userList
	}

	def loadSelectedUserListWithCommunityByEmail(email,community){
		User.withCriteria {
			like('email',email+"%")
			communityList{
				eq('id',community.id)
			}
		}
	}

	def loadSelectedUserListWithCommunityByLogin(login,community){
		User.withCriteria {
			like('login',login+"%")
			communityList{
				eq('id',community.id)
			}
		}
	}
}
