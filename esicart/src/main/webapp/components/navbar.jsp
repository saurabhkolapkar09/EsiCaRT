<%@page import="com.entities.User"%>




<nav class="navbar navbar-expand-lg navbar-dark bg-dark custom-bg nav nav-top">
	<div class="container ">

		<div class="logo">
			<a href="about.jsp"> <img src="img/lg.png" width="50px" alt=""></a>

		</div>
		<a class="navbar-brand" href="index.jsp">EsiCaRT</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active pop"><a class="nav-link"
					href="index.jsp">Home <span class="sr-only">(current)</span>
				</a></li>

				<li class="nav-item dropdown active pop"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> CATEGORIES </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>

			</ul>
			<ul class="navbar-nav ml-auto pop">
				<%
				User user1 = (User) session.getAttribute("curr-user");
				if (user1 == null) {
				%>
				<li class="nav-item active"><a class="nav-link"
					href="login.jsp">Login </a></li>
				<li class="nav-item active"><a class="nav-link"
					href="Register.jsp">Register </a></li>



				<%
				} else {
				%>


				<li class="nav-item active"><a class="nav-link"
					href="login.jsp"> <%=user1.getUserName()%>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="LogOutServlet">logout </a></li>


				<%
				}
				%>
			</ul>



		</div>
	</div>
</nav>