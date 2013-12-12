package classblast.web.core

import main.UserUtils

class ProfilesearchController {

	def resultList
    def index() { }
	
	def searchProcess(){
		def profile_search = params.profile_search
		render template:"/modules/people_result_list",
		model:['resultList':new UserUtils().returnMatchByProfileSearch(profile_search)]
	}
}
