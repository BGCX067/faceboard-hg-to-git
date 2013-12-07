class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.${format})?"{
            constraints {
                // apply constraints here
            }
        }
        "/"(controller:"main")
		"/user/register/"(controller:"user.register()")
		"/user/login/"(controller:"user.login()")
		"/construction"(view:"/construction")
        "500"(view:'/error')
		"/user/home"(controller:"welcome")
		"/user/books/"(controller:"book")
		"/user/books/note"(controller:"note")
		"/user/books/setup"(controller:"book",action:"setup")
		"/user/books/create"(controller:"book",action:"create")
		"/user/homeworks/"(controller:"homework")
		"/user/homeworks/edit"(controller:"homework",action:"edit")
		"/user/homeworks/create"(controller:"homework",action:"create")
		"/group/create"(controller:"group",action:"create")
		"/user/profile"(controller:"profile")
		"/user/alerts"(controller:"alert")
		"/modules/_mainmenu"(controller:"mainmenu")
		"/about/about"(controller:'about')
	}
}
