package classblast.web.main

import groovy.model.DefaultTableModel.MyTableColumnModel;
import main.MainUtils

class MainController {

    def index() {[myDomainObjList:this.findAll()] }
	
}
