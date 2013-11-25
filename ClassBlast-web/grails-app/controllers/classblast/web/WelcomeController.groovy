package classblast.web

import main.GeneralUtils;

class WelcomeController{
	def groupList
	def communityList
	def index() {
		if(session["user"]!=null){
			groupList = new GeneralUtils().loadCollectionsOfUser(session["user"])
			communityList = new GeneralUtils().loadCommunityListOfUser(session["user"])
			render(view:"/welcome/index")
		}
		else{
			//flash.message = "Debes estar logueado para visualizar esta página"
			redirect controller:"user",action:"login"
		}
	}
	
}
