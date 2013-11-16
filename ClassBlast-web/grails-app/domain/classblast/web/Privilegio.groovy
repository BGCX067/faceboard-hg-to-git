package classblast.web

class Privilegio {
	/* Ejemplos de privilegios
	boolean deleteCommunityPost
	boolean deleteCommunityComment
	boolean editCommunityPost
	boolean editCommunityComment
	boolean createGroup
	boolean createCommunity
	boolean editGroupDetails
	boolean editCommunityDetails
	boolean editGroupIntegrant
	boolean editCommunityIntegrant
	*/
	String privilegeDescription
	boolean privilegeValue
	static hasMany = [rolList:Rol]
    static constraints = {
    }
}
