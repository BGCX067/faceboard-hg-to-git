import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_classBlastWeb_welcomeindex_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/welcome/index.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
createTagBody(1, {->
printHtmlPart(1)
invokeTag('captureMeta','sitemesh',4,['gsp_sm_xmlClosingForEmptyTag':("/"),'name':("layout"),'content':("basic")],-1)
printHtmlPart(2)
createTagBody(2, {->
createClosureForHtmlPart(3, 3)
invokeTag('captureTitle','sitemesh',5,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',5,[:],2)
printHtmlPart(2)
})
invokeTag('captureHead','sitemesh',6,[:],1)
printHtmlPart(2)
createTagBody(1, {->
printHtmlPart(4)
createTagBody(2, {->
printHtmlPart(5)
invokeTag('img','g',12,['height':("50px"),'dir':("images"),'file':("logout.jpg"),'class':("middle")],-1)
printHtmlPart(6)
})
invokeTag('link','g',14,['controller':("user"),'action':("logout")],2)
printHtmlPart(7)
createTagBody(2, {->
printHtmlPart(5)
invokeTag('img','g',32,['height':("50px"),'dir':("images"),'file':("libro.jpg"),'class':("middle leftSideForm")],-1)
printHtmlPart(8)
})
invokeTag('link','g',34,['controller':("user"),'action':("recover")],2)
printHtmlPart(9)
createTagBody(2, {->
printHtmlPart(5)
invokeTag('img','g',37,['height':("50px"),'dir':("images"),'file':("estrella.png"),'class':("middle leftSideForm")],-1)
printHtmlPart(10)
})
invokeTag('link','g',39,['controller':("user"),'action':("recover")],2)
printHtmlPart(9)
createTagBody(2, {->
printHtmlPart(5)
invokeTag('img','g',42,['height':("50px"),'dir':("images"),'file':("mesa.png"),'class':("middle leftSideForm")],-1)
printHtmlPart(11)
})
invokeTag('link','g',44,['controller':("user"),'action':("recover")],2)
printHtmlPart(12)
createTagBody(2, {->
printHtmlPart(5)
invokeTag('img','g',47,['height':("50px"),'dir':("images"),'file':("explora.jpg"),'class':("middle leftSideForm")],-1)
printHtmlPart(13)
})
invokeTag('link','g',49,['controller':("user"),'action':("recover")],2)
printHtmlPart(14)
})
invokeTag('captureBody','sitemesh',52,[:],1)
printHtmlPart(15)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1384745053000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'none'
public static final String TAGLIB_CODEC = 'none'
}
