package classblast.web

class ExampleController {

    def index() {
		[myDomainObjList: this.findAll()]
	}
}
