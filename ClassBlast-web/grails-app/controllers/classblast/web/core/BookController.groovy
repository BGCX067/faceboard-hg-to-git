package classblast.web.core

class BookController {

	def prueba = "bienvenido al controlador de libros"
	
    def index() { 
		render(view:"/user/books/books-index")
	}
	
	def create() {
		render(view:"/user/books/books-create")
	}
	
	def setup() {
		render(view:"/user/books/books-setup")
	}
	
	def books(){
		
	}
}
