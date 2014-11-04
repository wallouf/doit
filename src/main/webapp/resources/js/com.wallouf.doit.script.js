function doit_updateTaskState(taskId, taskState){
	$.ajax({
		  type: "POST",
		  url: "updateTaskState",
		  data: { taskId: taskId, taskState: taskState },
		    success: function(data, textStatus, jqXHR)
		    {
		        if(data == -1){
		        	window.location.reload();
		        }else{
		        	$("#taskListRow[data-task-id='" + taskId +"']").find("#taskListRow-State").html('<span class="label label-success">Done</span>');
		        }
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
	        	window.location.reload();
		    }	
	});
}