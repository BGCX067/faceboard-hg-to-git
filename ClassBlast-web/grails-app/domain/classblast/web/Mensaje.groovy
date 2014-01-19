package classblast.web

import java.text.SimpleDateFormat

class Mensaje {
	User ownerMessage
	Date dateMessage
	Conversacion conversation
	String messageBody
	boolean isview
    static constraints = {
    }
	
	def formatDate(){
		return new SimpleDateFormat("hh:mm:ss").format(dateMessage)
	}
}
