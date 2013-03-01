
$(document).ready(function() {
	var id = $('#project_id').val();
	$('#tasks_list').sortable(
        {
          axis: 'y',
          dropOnEmpty:false,
          handle: $("#tasks_list").children(),
          cursor: 'crosshair',
          items: 'tr',
          opacity: 0.4,
          scroll: true,
          update: function(){
            $.ajax({
                type: 'post',
                data: $('#tasks_list').sortable('serialize') + '&id=' + id,
                dataType: 'script',
                complete: function(request){
                    $('#tasks_list').effect('highlight');
                  },
                url: '/projects/sort_tasks'})
        }
    });
});
