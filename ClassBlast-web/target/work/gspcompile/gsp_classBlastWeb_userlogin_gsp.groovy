import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_classBlastWeb_userlogin_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/user/login.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(1)
invokeTag('set','g',3,['var':("controller"),'value':(myDomainObjList[0])],-1)
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',4,['gsp_sm_xmlClosingForEmptyTag':("/"),'name':("layout"),'content':("basic")],-1)
printHtmlPart(1)
createTagBody(2, {->
createClosureForHtmlPart(2, 3)
invokeTag('captureTitle','sitemesh',5,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',5,[:],2)
printHtmlPart(1)
})
invokeTag('captureHead','sitemesh',6,[:],1)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(3)
createTagBody(2, {->
printHtmlPart(4)
invokeTag('img','g',10,['dir':("images/icons"),'file':("login-48.ico"),'class':("middle leftSideForm")],-1)
printHtmlPart(5)
if(true && (validationErrors.size()>=1)) {
printHtmlPart(6)
invokeTag('img','g',16,['dir':("images/icons"),'file':("validerror-32.ico"),'class':("middle")],-1)
printHtmlPart(7)
expressionOut.print(validationErrors[0])
printHtmlPart(8)
}
printHtmlPart(9)
invokeTag('textField','g',22,['name':("login"),'value':(username)],-1)
printHtmlPart(10)
invokeTag('passwordField','g',26,['name':("password")],-1)
printHtmlPart(11)
createClosureForHtmlPart(12, 3)
invokeTag('link','g',29,['controller':("user"),'action':("recover")],3)
printHtmlPart(4)
invokeTag('submitButton','g',30,['name':("sbutton"),'value':("Ingresar")],-1)
printHtmlPart(3)
})
invokeTag('form','g',31,['action':("loginProcess"),'name':("loginForm"),'class':("loginForm")],2)
printHtmlPart(1)
})
invokeTag('captureBody','sitemesh',32,[:],1)
printHtmlPart(13)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1383449871913L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'none'
public static final String TAGLIB_CODEC = 'none'
}
