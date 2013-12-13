<script type="text/javascript">
$(function(){$("#people_result_list").hide()})
function clickformprfsearchbutton(){
	$("#send_search").click();
}
</script>
<g:formRemote 
	update="people_result_list"
	url="[controller:'profilesearch',action:'searchProcess']"
	name="formprofilesearch" method="post"
	onSuccess="show('#people_result_list')">
	<g:textField name="profile_search"
		onfocus="if(this.value == 'Buscar personas') {this.value=''}"
		onblur="if(this.value == ''){this.value ='Buscar personas'}"
		value="Buscar personas" />
	<g:actionSubmit id="send_search" value="Enviar" style="display:none"/>
	<g:link url="#" onclick="clickformprfsearchbutton()">
		<g:img height="20px" dir="images/icons" class="middle"
			file="search-24.ico" />
	</g:link>
</g:formRemote>
<div id="people_result_list">
<g:render template="/modules/people_result_list" model="['resultList':[]]"/>
</div>