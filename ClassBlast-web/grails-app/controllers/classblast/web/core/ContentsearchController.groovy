package classblast.web.core

class ContentsearchController {
	
	def searchTarget = ""

    def index() { 
		[myDomainObjList:this.findAll()]
    }
	
	def searchprocess(){
		searchTarget = params.course_search
		
		render(view:'/construction')
	}
}
