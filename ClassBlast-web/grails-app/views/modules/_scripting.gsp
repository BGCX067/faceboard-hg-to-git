<script type="text/javascript">
	$(function() {
		$(".comment_field").hide();
	})
	function confirmMessage(id) {
		if (confirm("¿Estás seguro?")) {
			$('#post_list').fadeOut(function() {
				$("span#delete" + id + " a").click()
			});
		}
	}
	function confirmDelCommentMessage(postId, commentId) {
		if (confirm("¿Estás seguro?")) {
			$('#comment_list'+postId).fadeOut(function() {
				$("span#deleteComment" + commentId + " a").click()
			});
		}
	}
	function processCreateComment(id) {
		var cmField = "#comment_field" + id;
		var cList = "#comment_list"+id;
		$("" + cmField + "," + cList).fadeOut(function() {
			$("#add_comment" + id + " a").html("Agregar comentario")
			return true
		});
	}
	function processCreatePost() {
		var pList = "#post_list"
		$(""+pList+", form#mf").fadeOut(function() {
			return true
		});
	}
	function clear(element) {
		$(element).val('');
	}
	function nopaint() {

	}
	function repaint() {
		$("#post_list").fadeIn();
		$(".comment_field").hide();
	}
	function repaintCommentList(id) {
		$('#comment_list'+id).fadeIn()
	}
	function repaintPostForm(){
		$("form#mf #post_title, form#mf #post_body").val('');
		$("form#mf").fadeIn();
		repaint();
	}
	function load_comment_field(id) {
		if ($("#add_comment" + id + " a").html() == "Agregar comentario") {
			$("#comment_field" + id).show();
			$("#add_comment" + id + " a").html("Cancelar")
		} else {
			if ($("#comment_field" + id + " textarea").val().length > 0) {
				if (confirm("No has terminado de escribir tu comentario, ¿seguro deseas cancelar?'")) 
				{
					$("#comment_field" + id + " textarea").val('');
					$("#comment_field" + id).hide();
					$("#add_comment" + id + " a").html("Agregar comentario")
				}
			} else {
				$("#comment_field" + id).hide();
				$("#add_comment" + id + " a").html("Agregar comentario")
			}
		}
	}
	function hide(element){
		$(element).hide("slow");
	}
	function show(element){
		$(element).show("slow");
	}
</script>
