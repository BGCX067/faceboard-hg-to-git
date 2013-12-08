package classblast.web

class SessionFilterFilters {
	def controllerExceptionList = ["main","about","contact","contentsearch","user"]
	def actionExceptionList = ["login","register"]
    def filters = {
        loginCheck(controller:'*', action:'*') {
            before = {
				if(!session.user
					&& !findInList(controllerName,controllerExceptionList)
					&& !findInList(actionName,actionExceptionList)){
					redirect controller:"user",action:"login"
					return false
				}
            }
        }
    }
	def findInList(contrllerName,listToFind){
		def findCheck = false
		listToFind.each {
			if (it.equals(contrllerName)){
				findCheck = true
			}
		}
		return findCheck
	}
}
