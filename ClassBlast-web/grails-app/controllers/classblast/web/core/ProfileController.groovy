package classblast.web.core

import main.UserUtils
import classblast.web.Grupo;
import classblast.web.Rol
import classblast.web.User

class ProfileController {
    def rolOfUser
	def profile
	def isOtherUser
	def groupMap = []
	def index() {
		if(params.profileid!=null){
			profile = User.get(params.profileid)
			isOtherUser = session.user.id != profile.id
		}else{
			profile = User.get(session.user.id)
			isOtherUser = false
		}
		rolOfUser = new UserUtils().getGenericRolOfUser(profile)
		render(view:"/user/profile")
	}
	
	def getRolByUserAndGroup(){
		groupMap=[]
		for(Grupo g:profile.groupList){
			groupMap+=['group':g,
				'rol':clearRolName(Rol.findByRolOwnerAndGroupRelated(profile,g))]
		}
		print groupMap
	}
	
	def clearRolName(Rol rol){
		switch(rol.rolType.rolType){
			case("AdministradorGrupo"):
				return "Administrador"
			case("MonitorGrupo"):
				return "Monitor"
			case("EstudianteGrupo"):
				return "Estudiante"
			case("InvitadoGrupo"):
				return "Invitado"
		}
	}
	
	
}
