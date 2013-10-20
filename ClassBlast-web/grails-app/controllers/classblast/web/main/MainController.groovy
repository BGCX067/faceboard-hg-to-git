package classblast.web.main

import groovy.model.DefaultTableModel.MyTableColumnModel;
import main.MainUtils

class MainController {

    def index() {redirect action:"register",controller:"user" }
	def user() {render "123454321"}
	def test = {
		def mainUtils = new MainUtils()
		mainUtils.methodTest()
		}
}
