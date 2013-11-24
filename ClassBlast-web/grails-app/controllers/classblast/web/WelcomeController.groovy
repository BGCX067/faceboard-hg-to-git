package classblast.web

import main.GeneralUtils;

@Mixin(GeneralUtils)
class WelcomeController{
	def groupList
	def communityList
	def index() {
		if(session["user"]!=null){
			groupList = this.loadCollectionsOfUser(session["user"])
			communityList = this.loadCommunityListOfUser(session["user"])
			render(view:"/welcome/index")
		}
		else{
			//flash.message = "Debes estar logueado para visualizar esta página"
			redirect controller:"user",action:"login"
		}
	}
	
}
