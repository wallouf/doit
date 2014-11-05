function doit_updateTaskListState(taskId, taskState){
	$.ajax({
		  type: "POST",
		  url: "updateTaskListState",
		  data: { taskId: taskId, taskState: taskState },
		    success: function(data, textStatus, jqXHR)
		    {
		        $("#taskListRow[data-task-id='" + taskId +"']").find("#taskListRow-State").html(data);
		        
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
	        	window.location.reload();
		    }	
	});
}

function doit_updateTaskDetailsState(taskId, taskState){
	$.ajax({
		  type: "POST",
		  url: "updateTaskDetailsState",
		  data: { taskId: taskId, taskState: taskState },
		    success: function(data, textStatus, jqXHR)
		    {
		        $("#taskDetailsStateRow[data-task-id='" + taskId +"']").find("#taskDetails-State").html(data);
		        
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
	        	window.location.reload();
		    }	
	});
}