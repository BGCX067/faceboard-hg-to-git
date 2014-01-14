package classblast.web.core
import classblast.web.*


class ContentsearchController {
	
	def searchTarget = ""

    def index() { 
		[myDomainObjList:this.findAll()]
    }
	
	def searchprocess(){
		def templateToRender
		searchTarget = params.course_search
		def communityResultList=[]
		def groupResultList=[]
		def courseResultList=Curso.findAllByCourseNameLike("%"+searchTarget+"%")
		if(Grupo.findAllByGroupName("%"+searchTarget+"%")!=null){
			groupResultList+=Grupo.findAllByGroupName(searchTarget)
		}
		if(Curso.findAllByCourseNameLike("%"+searchTarget+"%")!=null &&
			Grupo.findAllByCourseRelated(Curso.findAllByCourseName("%"+searchTarget+"%"))!=null){
			groupResultList+=Grupo.findAllByCourseRelatedLike(Curso.findAllByCourseName("%"+searchTarget+"%"))
		}
		if(Parche.findAllByCommunityNameLike("%"+searchTarget+"%")!=null){
			communityResultList+=Parche.findAllByCommunityNameLike("%"+searchTarget+"%")
		}
		def communityListByTag = []
		communityListByTag
		def tagMatchingList = Tag.findAllByTagDescription(searchTarget)
		tagMatchingList.each{
			communityListByTag += it.communityRelated
		}
		if(session.user){
			templateToRender="logged"
		}else{
		 	templateToRender = "nologged"
		}
		communityResultList+=communityListByTag
		render(view:'/search/contentsearch/index',
			model:['communityResultList':communityResultList,
				'groupResultList':groupResultList,
				'courseResultList':courseResultList,
				'templateToRender':templateToRender,
				'searchWord':searchTarget])
	}
}
