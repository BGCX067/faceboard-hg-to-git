package classblast.web

import main.GeneralUtils;

class WelcomeController{
	def groupList
	def communityList
	def taskList
	def index() {
		if(session["user"]!=null){
			groupList = new GeneralUtils().loadCollectionsOfUser(session["user"])
			communityList = new GeneralUtils().loadCommunityListOfUser(session["user"])
			taskList = ["Completar tu perfil"] // taskList de juguete, implementar mejor para entrega final
			render(view:"/welcome/index")
		}
		else{
			//flash.message = "Debes estar logueado para visualizar esta página"
			redirect controller:"user",action:"login"
		}
	}
	
}
