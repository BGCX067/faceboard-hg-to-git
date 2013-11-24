package classblast.web.main

import groovy.model.DefaultTableModel.MyTableColumnModel;
import main.MainUtils

class MainController {

	def templateToRender=""
	
    def index() {
		this.templateToRender= session["user"]==null?"nologged":"logged"
		[myDomainObjList:this.findAll()] }
	
}
