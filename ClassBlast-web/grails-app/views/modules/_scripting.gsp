<script type="text/javascript">
function miFuncion(inputText){
    $.ajax({
          url:"${request.contextPath}/group/createPost",
          dataType: 'script',
          type:'GET',
          data: {
                inputText: "33"
          },
          //data: { ListID: '1', ItemName: 'test' },
          success: function(data) {
                alert(data)
          },
          error: function(request, status, error) {
              alert(error)
          },
          complete: function() {
             
          }
    });
}
</script>
