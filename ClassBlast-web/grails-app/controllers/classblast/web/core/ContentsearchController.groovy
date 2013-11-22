package classblast.web.core

class ContentsearchController {

    def index() { 
		[myDomainObjList:this.findAll()]
    }
}
