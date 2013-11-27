package classblast.web

import main.GeneralUtils;
import main.UserUtils
import main.ValidationUtils

@Mixin(GeneralUtils)
class UserController {
	def errorValidationList = []
	def errorExecList = []
	def registerSuccessFul = false
	def userName,firstName,lastName,email
	def MIN_SIZE_LENGTH = 6
	def visitNumber=0
	def redirFromProcess = false
	def userUtils = new UserUtils()
	def validationUtils = new ValidationUtils()

	def about(){
		redirect url:"/about/about"
	}
	def register(){
		if(session["user"]!=null){
			redirect(controller:"welcome")
		}
		if (registerSuccessFul){
			cleanActivity()
		}
		if(redirFromProcess){
			redirFromProcess = false
		}
		else{
			cleanVariables()
			cleanStackTrace()
		}
		[myDomainObjList: (this.findAll()),
			validationErrors:errorValidationList,
			execErrors:errorExecList,
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
		def validateEmpty={ field,name->
			if(field.isEmpty()){
				errorValidationList+="El campo ${name} está vacio. Es obligatorio"
			}
		}
		def validateSize={ field,name,minSize->
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
		if(!validationUtils.validateEmail(email)){
			errorValidationList+="Por favor ingrese un correo electrónico válido"
		}
		
		if(userUtils.userNameExists(userName)){
			errorValidationList+="El nombre de usuario suministrado ya existe, por favor seleccione otro"
		}
		if(userUtils.emailExists(email)){
			errorValidationList+="El email suministrado ya existe, por favor seleccione otro"
		}
		if(errorValidationList==[]){
			if(userUtils.registerUser(userName,email,firstName,lastName,password)){
				registerSuccessFul = true
			}
			else{
				errorExecList+="Ops! tenemos un problema, intente de nuevo más tarde"
			}
		}
		redirFromProcess=true
		redirect action:"register"
	}

	def loginProcess(){
		this.cleanStackTrace()
		userName = params.login
		def password = params.password
		def validateEmpty={ field,name->
			if(field.isEmpty()){
				errorValidationList+="El campo ${name} está vacio. Es obligatorio"
			}
		}
		validateEmpty(userName, "nombre de usuario")
		validateEmpty(password, "password")
		if(userUtils.validateLoginData(userName,password)){
			if(userUtils.login(this.session)){
				redirect action:"myprofile"
				return
			}
		}
		else{
			errorValidationList+="Usuario o contraseña incorrectas, intente de nuevo"
		}
		redirFromProcess=true
		redirect action:"login"
	}
	
	def logout(){
		session.invalidate()
		redirect controller:"main",action:"index"
	}
	def cleanStackTrace(){
		this.errorValidationList = []
		this.errorExecList=[]
	}
	def myprofile(){
		redirect controller:"welcome",action:"index"
	}
	def cleanActivity(){
		visitNumber++
		if(visitNumber>=2){
			visitNumber=0
			registerSuccessFul = false
		}
		cleanVariables()
		cleanStackTrace()
	}
	def cleanVariables(){
		userName=""
		firstName=""
		lastName=""
		email=""
	}
	def recover(){
		redirect url:"/construction"
	}

	def login(){
		if(session["user"]!=null){
			redirect(controller:"welcome")
		}
		if(redirFromProcess){
			redirFromProcess = false
		}
		else{
			cleanVariables()
			cleanStackTrace()
		}
		[myDomainObjList: this.findAll(),
			validationErrors:errorValidationList,
			execErrors:errorExecList,
			username:userName]
	}
}
