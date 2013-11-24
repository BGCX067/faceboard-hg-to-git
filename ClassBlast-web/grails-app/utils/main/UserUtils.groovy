package main

import classblast.web.User
import javax.servlet.http.HttpSession
import org.springframework.http.HttpRequest

class UserUtils {
	
	def targetUser
	
	def userNameExists(userName){
		User.findAllByLogin(userName)!=[]
	}
	def emailExists(email){
		User.findAllByEmail(email)!=[]
	}
	def registerUser(userName,email,firstName,lastName,password){
		def securityUtils = new SecurityUtils()
		def encryptedPassword = securityUtils.hashWithMd5(password)
		try{
			def newUser = new User(
					login:userName,
					email:email,
					firstName:firstName,
					lastName:lastName,
					registerDate:new Date(),
					encryptedPassword:encryptedPassword)
			newUser.save()
			return true
		}
		catch(Exception e){
			return false
		}
	}
	def validateLoginData(userName,password){
		def securityUtils = new SecurityUtils()
		def encryptedPassword = securityUtils.hashWithMd5(password)
		def userMatchingList = User.findAllByLoginAndEncryptedPassword(userName,encryptedPassword)
		if(userMatchingList!=[]){
			this.targetUser = userMatchingList[0]
			return true
		}
		return false
	}

	def login(session){
		try{
			session["user"] = this.targetUser
		}
		catch(Exception e){
			print e
			return false
		}
		return true
	}
	
	static loadGroupListOfUser(User user){
		return user.groupList
	}
}
