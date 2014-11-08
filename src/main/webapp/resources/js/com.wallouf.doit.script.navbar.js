

function doit_changeLanguage(lang){
	$.ajax({
		  type: "POST",
		  url: "changeLanguage",
		  data: { lang: lang},
		    success: function(data, textStatus, jqXHR)
		    {
	        	window.location.reload();
		        
		    },
		    error: function (jqXHR, textStatus, errorThrown)
		    {
	        	window.location.reload();
		    }	
	});
}