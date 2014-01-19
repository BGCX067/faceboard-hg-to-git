package classblast.web

import main.GeneralUtils;
import main.SecurityUtils
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
		if(session.user!=null){
			redirect url:"/user/home"
		}
		/*print User.get(3).firstName+" "+User.get(3).lastName;
		 print TipoRol.get(3).rolDescription
		 def tipoRolList = TipoRol.findAllByRolDescription("Estudiante de grupo")
		 print TipoRol.findAllByRolDescription("Estudiante de grupo").get(0).rolType
		 print TipoRol.findAllByRolDescriptionLike("E%").get(2).rolType
		 tipoRolList.each{
		 print it.rolType
		 }
		 def nameList = ["alex","jairo"]
		 print User.withCriteria {
		 or{
		 nameList.each {
		 like('firstName',"%"+it+"%")
		 like('lastName',"%"+it+"%")
		 }
		 }
		 }*/
		render view:"/user/recover",model:['send':false,'emailSent':'null']
	}

	def modifypassword(){
		if(params.token!="rwrwrwerwe22627672672yswus"||params.userid==null||User.get(params.userid)==null){
			redirect url:"/user/home"
		}
		render view:"/user/modifypassword",model:['userobj':User.get(params.userid)]
	}

	def sendEmailRecover(){
		def user = User.findByEmail(params.email)
		def emailnotfound = false
		if (user == null){
			emailnotfound = true
		}
		def userId = emailnotfound?0:user.id
		def error=false,success=true
		if(!emailnotfound){
			try{
				sendMail {
					to params.email
					from "classblastservice@gmail.com"
					subject "Recuperación de clave de acceso a classblast"
					html "Usted ha solicitado este correo para poder recuperar el acceso a su cuenta de"+
							" usuario. Por razones de seguridad, no es posible devolverle la clave que tenía"+
							" previamente. Sin embargo podrá cambiar su clave de acceso mediante el siguiente "+
							" enlace."+
							"<a href='http://localhost:8200/ClassBlast-web/user/modifypassword?token=rwrwrwerwe22627672672yswus&userid="+userId+"'>http://localhost:8200/ClassBlast-web/user/modifypassword?token=rwrwrwerwe22627672672yswus&userid="+userId+"</a>"+
							"<br/><br/>Cordialmente, el equipo de classblast."
				}
			}
			catch(Exception e){
				error=true;
				success=false;
			}
		}
		render template:"/modules/recoverform",
		model:['send':true,
			'success':success,
			'error':error,
			'emailnotfound':emailnotfound,
			'emailSent':params.email]
	}

	def modifyPasswordProcess(){
		def newPassword = params.contrasenia
		User user =  User.get(params.userid)
		user.encryptedPassword =  new SecurityUtils().hashWithMd5(newPassword)
		user.save()
		redirect action:"mPasswordSuccesful",params:["token":"rwrwrwerwe22627672672yswus"]
	}

	def mPasswordSuccesful(){
		if(params.token!="rwrwrwerwe22627672672yswus"){
			redirect url:"/user/home"
		}
		render view:"/user/mpasswordsuccesful"
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
