package classblast.web.application

class ContactController {

    def index() { 
		if(session["user"]==null){
			[myDomainObjList:this.findAll()]
		}
		else{
			//flash.message = "Debes estar logueado para visualizar esta página" 
			redirect controller:"user",action:"login"
		}
	}
	
}
