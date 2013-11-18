package classblast.web

class WelcomeController {

    def index() { 
		print ":)"
		if(session["user"]!=null){
			print session["user"]
			[myDomainObjList:this.findAll()]
		}
		else{
			redirect controller:"main",action:"index"
		}
	}
	
}
