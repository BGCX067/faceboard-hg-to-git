package classblast.web

class Solicitud {
	enum RequestState{EN_PROCESO,ACEPTADO,RECHAZADO}
	Grupo groupRelated
	Parche communityRelated
	Date requestDate
	RequestState requestState
    static constraints = {
    }
}
