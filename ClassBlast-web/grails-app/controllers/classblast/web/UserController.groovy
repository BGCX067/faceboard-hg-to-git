package classblast.web

import main.ValidationUtils

class UserController {
	def errorValidationList = []
	def userName,firstName,lastName,email
	def MIN_SIZE_LENGTH = 6
    def register(){	
		[myDomainObjList: (this.findAll()),
			validationErrors:errorValidationList,
			username:userName,
			firstname:firstName,
			lastname:lastName,
			email:email]
	}
	
	def registerProcess(){
		this.cleanStackTrace()
		userName = params.username
		firstName = params.firstname
		lastName = params.lastname
		email = params.email
		def password = params.password
		def repassword = params.repassword
		def validateEmpty={field,name->
			if(field.isEmpty()){
				errorValidationList+="El campo ${name} está vacio. Es obligatorio"
			}
		}
		def validateSize={field,name,minSize->
			if(field.length()<minSize){
				errorValidationList+="El campo ${name} debe contener al menos ${minSize} caracteres"
			}
		}
		validateEmpty(userName, "nombre de usuario")
		validateEmpty(email, "email")
		validateEmpty(password, "password")
		validateEmpty(repassword,"repita la contraseña")
		validateSize(userName,"nombre de usuario",5)
		validateSize(password,"password",5)
		validateSize(repassword,"repita la contraseña",5)
		if(password!=repassword){
			errorValidationList+="Las contraseñas no coinciden"
		}
		def validationUtils = new ValidationUtils()
		if(!validationUtils.validateEmail(email)){
			errorValidationList+="Por favor ingrese un correo electrónico válido"
		}
		if(errorValidationList!=[]){
			redirect action:"register"
		}
		else{
			redirect action:"registerDone"
		}
	}
	
	def cleanStackTrace(){
		this.errorValidationList = []
	}
	def registerDone(){
		render "registrado"
		//[myDomainObjList: this.findAll()]
	}
	
	def login(){[myDomainObjList: this.findAll()]}
}
