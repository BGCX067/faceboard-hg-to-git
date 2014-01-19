<script type="text/javascript">
	$(function() {
		$(".comment_field").hide();
		$(".comment_edit").hide();
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
			$('#comment_list' + postId).fadeOut(function() {
				$("span#deleteComment" + commentId + " a").click()
			});
		}
	}
	function processCreateComment(id) {
		var cmField = "#comment_field" + id;
		var cList = "#comment_list" + id;
		$("" + cmField + "," + cList).fadeOut(function() {
			$("#add_comment" + id + " a").html("Agregar comentario")
			return true
		});
	}
	function processCreatePost() {
		var pList = "#post_list"
		$("" + pList + ", form#mf").fadeOut(function() {
			return true
		});
	}
	function clear(element) {
		$(element).val('');
	}
	function clear_element(element) {
		$(element).val('');
	}
	function nopaint() {
	}
	function repaint() {
		$("#post_list").fadeIn();
		$(".comment_field").hide();
	}
	function repaintCommentList(id) {
		$('#comment_list' + id).fadeIn()
	}
	function repaintPostForm() {
		$("form#mf #post_title, form#mf #post_body").val('');
		$("form#mf").fadeIn();
		repaint();
	}

	function enableEditComment(id, body) {
		$("#edit_comment" + id + " input#comment_body").val(body);
		$("#edit_comment" + id + " textarea#comment_body").val(body);
		$(".edit_comment_command").hide();
		$("#show_comment" + id).fadeOut(function() {
			$("#edit_comment" + id).fadeIn();
			return true;
		});
		return true;
	}

	function enableEditPost(id, body) {
		$("#edit_post" + id + " input#post_body").val(body);
		$("#edit_post" + id + " textarea#post_body").val(body);
		$(".edit_post_command").hide();
		$("#show_post" + id).fadeOut(function() {
			$("#edit_post" + id).fadeIn();
			return true;
		});
		return true;
	}

	function repaintComment(id) {
		$("#edit_comment" + id).fadeOut(function() {
			$("#edit_comment" + id + " input#comment_body").val('');
			$("#edit_comment" + id + " textarea#comment_body").val('');
			$(".edit_comment_command").show();
			$("#show_comment" + id).fadeIn();
		})
	}

	function repaintPost(id) {
		$("#edit_post" + id).fadeOut(function() {
			$("#edit_post" + id + " input#post_body").val('');
			$("#edit_post" + id + " textarea#post_body").val('');
			$(".edit_post_command").show();
			$("#show_post" + id).fadeIn();
		})
	}

	function load_comment_field(id) {
		if ($("#add_comment" + id + " a").html() == "Agregar comentario") {
			$("#comment_field" + id).show();
			$("#add_comment" + id + " a").html("Cancelar")
		} else {
			if ($("#comment_field" + id + " textarea").val().length > 0) {
				if (confirm("No has terminado de escribir tu comentario, ¿seguro deseas cancelar?'")) {
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
	function hide(element) {
		$(element).hide("slow");
	}
	function show(element) {
		$(element).show("slow");
	}
	function show_inline(element) {
		$(element).css('display', 'inline');
	}

	function triggerFormSubmitWithValue(input, submit) {
		$(input).val('')
		$(submit).click()
	}
	function pressClick(element) {
		$(element).click();
	}

	// funciones de chat
	var refreshId
	function refrescarSala() {
		pressClick("#updateRemoteButton");
	}
	function seeMoreMessages() {
		var messagesIn = parseInt($("#numberOfMessages").val())
		messagesIn += 10;
		$("#numberOfMessages").val(messagesIn.toString());
	}
	function hideChat() {
		$("#chat_container").animate({
			left : "-800px"
		}, 1500, function() {
			clearInterval(refreshId);
		});
	}
	function showChat() {
		var defaultNumOfMessages = 10;
		$("#numberOfMessages").val(defaultNumOfMessages.toString());
		$("#chat_container").animate({
			left : "0px"
		}, 500, function() {
			refreshId = setInterval(refrescarSala, 2000);
		});
	}
	$(function() {
		refreshId = setInterval(refrescarSala, 2000);
	});
</script>
