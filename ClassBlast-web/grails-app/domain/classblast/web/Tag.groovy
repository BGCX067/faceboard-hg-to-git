package classblast.web

class Tag {
	String tagDescription
	Parche communityRelated
	Curso courseRelated
	
    static constraints = {
		communityRelated nullable:true
		courseRelated nullable:true
    }
}
