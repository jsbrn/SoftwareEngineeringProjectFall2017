<html>
	<div class = "container" style = "padding: 20px 40px 20px 40px">
		<div class = "row">
			<div class = "six columns">
				<% HttpSession sess = request.getSession(); out.println("<h5>Signed in as "+(String)sess.getAttribute("name")+"</h2>"); %>
			</div>
			<div class = "u-pull-right">
				<h5>Student</h5>
			</div>
		</div>
		<div class = "row">
			<div class = "twelve columns u-pull-right">
				<a href = "index.jsp" class = "button">News Feed</a>
                <% if (sess.getAttribute("studentType").equals("yes"))
                   {
                        out.println("<a href = 'workorders.jsp' class = 'button'>Your Work Orders</a>");
                   }
                   else
                        out.println("<a href = 'applications.jsp' class = 'button'>Your Application</a>");
                   %>
				
				<a href = "../index.html" class = "button">Sign out</a>
			</div>
		</div>
	</div>
</html>
