package classblast.web.core

class HomeworkController {

	def index() {
		if(true){
			render(view:"/group/homeworks")
		}
		//render(view:"/user/homeworks/homeworks-index")
	}
	
	def edit() {
		render(view:"/user/homeworks/homeworks-edit")
	}
	
	def create() {
		render(view:"/user/homeworks/homeworks-create")
	}
	
}
