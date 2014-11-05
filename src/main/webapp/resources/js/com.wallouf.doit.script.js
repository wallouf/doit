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

function doit_launchTaskStateEditorForList(){
	var sTaskStateId = $( "#doit_TaskStateModal_form_id" ).data("task-id");
	var sTaskStateValue = $( "#doit_TaskStateModal_form_state" ).val();
	if(sTaskStateId != null && typeof(sTaskStateId) != "undefined" && sTaskStateValue != null && typeof(sTaskStateValue) != "undefined"){
		doit_updateTaskListState(sTaskStateId,sTaskStateValue);
	}
	$('#doit_TaskStateModal').modal('hide');
}

function doit_launchTaskStateEditorForDetails(){
	var sTaskStateId = $( "#doit_TaskStateModal_form_id" ).data("task-id");
	var sTaskStateValue = $( "#doit_TaskStateModal_form_state" ).val();
	if(sTaskStateId != null && typeof(sTaskStateId) != "undefined" && sTaskStateValue != null && typeof(sTaskStateValue) != "undefined"){
		doit_updateTaskDetailsState(sTaskStateId,sTaskStateValue);
	}
	$('#doit_TaskStateModal').modal('hide');
}

function doit_displayTaskStateEditorForDetails(taskId){
	var sTaskStateValue = $("#taskDetailsStateRow[data-task-id='" + taskId +"']").find("#taskDetails-State span").data("task-state");
	if(sTaskStateValue != null && typeof(sTaskStateValue) != "undefined"){
		$( "#doit_TaskStateModal_form_state option[value='"+sTaskStateValue+"']" ).prop('selected', true);
	}
	$("#doit_TaskStateModal_form_id").data("task-id",taskId);
	$('#doit_TaskStateModal').modal('show');
}

function doit_displayTaskStateEditorForList(taskId){
	var sTaskStateValue = $("#taskListRow[data-task-id='" + taskId +"']").find("#taskListRow-State span").data("task-state");
	console.log("Value:"+sTaskStateValue);
	if(sTaskStateValue != null && typeof(sTaskStateValue) != "undefined"){
		$( "#doit_TaskStateModal_form_state option[value='"+sTaskStateValue+"']" ).prop('selected', true);
	}
	$("#doit_TaskStateModal_form_id").data("task-id",taskId);
	$('#doit_TaskStateModal').modal('show');
}