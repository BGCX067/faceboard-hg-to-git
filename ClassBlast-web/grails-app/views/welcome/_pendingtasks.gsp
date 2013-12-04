<div class="ui-pending-tasks columnmode">
	<h3>Classblast le recomienda</h3>
	<g:each in="${taskList}" var="taskItem">
		<p>
			<g:link controller="profile" action="profile">
				${taskItem}
			</g:link>
		</p>
	</g:each>
</div>
