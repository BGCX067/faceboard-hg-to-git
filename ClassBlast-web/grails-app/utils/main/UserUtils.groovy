package main

import classblast.web.User

class UserUtils {
	def userNameExists(userName){
		//TODO: implementar este método cuando haya conexión a base de datos
		false
	}
	def emailExists(email){
		//TODO: implementar este método cuando haya conexión a base de datos
		false
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
		
		//login de juego
		println getUserItem(userName,password)
		return (getUserItem(userName,password))!=null
		
		// en el login de verdad debe ir el encryptedpassword como parámetro!
		//TODO: crear la conexión con la base de datos para poder enlazar los usuarios registrados
	}
	
	def getUserItem(userName,password){
		def userToReturn = null
		//userList de juguete
		def userList=[['username':'ojbeltran','password':'abcde'],
			['username':'afleyva','password':'abcde'],
			['username':'dcortesc','password':'abcde'],
			['username':'orsuarez','password':'abcde'],
			['username':'avillamil','password':'abcde']]
		userList.each{
			if(it.username==userName && it.password==password){
				userToReturn = it
			}
		}
		return userToReturn
	}
	
	def login(){
		//TODO: definir mejor este método, probablemente requiera parametros y sesiones
		true
	}
}
