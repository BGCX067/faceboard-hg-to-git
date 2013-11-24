package classblast.web.application

class AboutController {

    def about() {
		[myDomainObjList:this.findAll()]
	}
}
