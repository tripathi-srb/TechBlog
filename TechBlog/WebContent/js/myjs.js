$(document).ready(function() {
	// alert("document loaded");
	console.log("hi");

})

// dolike function show_blog_page.jsp
function doLike(pid, uid) {
	console.log(pid + "," + uid)

	const d = {
		uid : uid,
		pid : pid,
		operation : 'like'

	}

	$.ajax({

		url : "LikeServlet",
		data : d,
		success : function(data, textStatus, jqXHR) {
			console.log(data);
			if (data.trim() == 'true') {
				let c = $(".like-counter").html();
				c++;
				$('.like-counter').html(c);
			}
			console.log("hi...................");
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log(data);
			console.log("no...................");
		}

	})
}