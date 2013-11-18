package main

import classblast.web.User
import javax.servlet.http.HttpSession
import org.springframework.http.HttpRequest

class UserUtils {
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
		User.findAllByLoginAndEncryptedPassword(userName,encryptedPassword)!=[]
	}

	def login(userName,session, request){
		try{
			session["user"] = userName
		}
		catch(Exception e){
			print e
			return false
		}
		return true
	}
}
