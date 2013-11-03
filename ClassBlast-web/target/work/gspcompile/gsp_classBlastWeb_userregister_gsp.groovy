import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_classBlastWeb_userregister_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/user/register.gsp" }
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
if(true && (!controller.registerSuccessFul)) {
printHtmlPart(4)
createTagBody(3, {->
printHtmlPart(5)
invokeTag('img','g',12,['dir':("images/icons"),'file':("signup-48.ico"),'class':("middle leftSideForm")],-1)
printHtmlPart(6)
if(true && (validationErrors.size()>=1)) {
printHtmlPart(7)
invokeTag('img','g',17,['dir':("images/icons"),'file':("validerror-32.ico"),'class':("middle")],-1)
expressionOut.print(validationErrors[0])
printHtmlPart(8)
}
printHtmlPart(9)
invokeTag('textField','g',21,['name':("username"),'value':(username)],-1)
printHtmlPart(10)
invokeTag('passwordField','g',25,['name':("password")],-1)
printHtmlPart(11)
invokeTag('passwordField','g',29,['name':("repassword")],-1)
printHtmlPart(12)
invokeTag('textField','g',33,['name':("firstname"),'value':(firstname)],-1)
printHtmlPart(13)
invokeTag('textField','g',37,['name':("lastname"),'value':(lastname)],-1)
printHtmlPart(14)
invokeTag('textField','g',41,['name':("email"),'value':(email)],-1)
printHtmlPart(15)
invokeTag('submitButton','g',44,['name':("sbutton"),'value':("Registro")],-1)
printHtmlPart(4)
})
invokeTag('form','g',45,['action':("registerProcess"),'name':("registerForm"),'class':("registerForm")],3)
printHtmlPart(3)
}
else {
printHtmlPart(4)
createTagBody(3, {->
printHtmlPart(5)
invokeTag('img','g',51,['dir':("images/icons"),'file':("succesful-48.ico"),'class':("middle leftSideForm")],-1)
printHtmlPart(16)
invokeTag('submitButton','g',54,['name':("lbutton"),'value':("Ir a login")],-1)
printHtmlPart(4)
})
invokeTag('form','g',55,['url':([controller:'user',action:'login']),'name':("registerSuccesfulForm"),'class':("registerSuccesfulForm")],3)
printHtmlPart(3)
}
printHtmlPart(1)
})
invokeTag('captureBody','sitemesh',57,[:],1)
printHtmlPart(17)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1383449871918L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'none'
public static final String TAGLIB_CODEC = 'none'
}
