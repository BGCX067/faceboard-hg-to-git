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
        "500"(view:'/error')
	}
}
