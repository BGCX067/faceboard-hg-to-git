package classblast.web.core

import classblast.web.Mensaje
import classblast.web.Conversacion

class ChatController {

	def index() {
	}

	def refreshPanel(){
		def messageList =
				Mensaje.findAllByConversation(Conversacion.findByTalkCategory("público"),
				[max: params.numberOfMessages, sort: "dateMessage", order: "desc"]);
		 render template:"/modules/chat/mymessagechat",
		 model:['myerrormessage':'no','mymessagelist': messageList]
	}

	def sendPublicMessage(){
		def messageToSend = params.messagetosend;
		def message = new Mensaje(conversation: Conversacion.findByTalkCategory("público"),
		dateMessage: new Date(),
		ownerMessage: session.user,
		isview: true,
		messageBody: messageToSend   );
		message.save()
		refreshPanel()
	}
}
