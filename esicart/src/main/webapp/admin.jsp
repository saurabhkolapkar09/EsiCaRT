<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.entities.Category"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.User"%>
<%
User user = (User) session.getAttribute("curr-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in ! log in first");
	response.sendRedirect("login.jsp");
	return;

} else {

	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "You are not admin ! do not access this page ! Do logIn again");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>







<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>e</title>

<%@include file="components/common.jsp"%>

</head>
<body>

	<%@include file="components/navbar.jsp"%>

	<div class="container admin">

		<div class="container-fluid mt-3">
			<%@include file="msg.jsp"%>
		</div>

		<div class="row mt-3 mb-3">
			<div class="col-md-4">
				<div class="card item">

					<div class="card-body text-center">

						<div class="container">
							<img src="img/user.png" class="img-fluid rounded-circle"
								style="max-width: 120px" alt="user pht">
						</div>

						<h1>2345</h1>
						<h2 class="text-uppercase text-muted">User</h2>
					</div>

				</div>

			</div>
			<div class="col-md-4">
				<div class="card item">

					<div class="card-body text-center">

						<div class="container">
							<img src="img/category.png" class="img-fluid rounded-circle"
								style="max-width: 120px" alt="user pht">
						</div>

						<h1>123</h1>
						<h2 class="text-uppercase text-muted">Categories</h2>
					</div>

				</div>
			</div>
			<div class="col-md-4">
				<div class="card item">

					<div class="card-body text-center">
						<div class="container">
							<img src="img/product.png" class="img-fluid rounded-circle"
								style="max-width: 120px" alt="user pht">
						</div>

						<h1>34321</h1>
						<h2 class="text-uppercase text-muted">Products</h2>
					</div>

				</div>
			</div>

		</div>

		<div class="row mt-3">
			<div class="col-md-6">

				<div class="card item" data-toggle="modal"
					data-target="#add-category-model">

					<div class="card-body text-center">

						<div class="container">
							<img src="img/Add-icon.png" class="img-fluid rounded-circle"
								style="max-width: 120px" alt="user pht">
						</div>
						<br>
						<p>click here to add category</p>
						<h2 class="text-uppercase text-muted">Add category</h2>
					</div>

				</div>
			</div>

			<div class="col-md-6">
				<div class="card item" data-toggle="modal"
					data-target="#add-product-model">

					<div class="card-body text-center">

						<div class="container">
							<img src="img/add-product.png" class="img-fluid rounded-circle"
								style="max-width: 120px" alt="user pht">
						</div>
						<br>
						<p>click here to add products</p>
						<h2 class="text-uppercase text-muted">Add Product</h2>
					</div>

				</div>

			</div>

		</div>
		<br> <br>

	</div>

	<!-- model category -->

	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="add-category-model" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog " role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white bg-dark">
					<h5 class="modal-title" id="exampleModalLabel">Add Category
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="AddCategory" method="post">

						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter Category Title" required>


						</div>

						<div class="form-group">

							<textarea rows="" cols="" placeholder="enetre disc"
								name="catDescription" required class="form-control"
								style="height: 200px"></textarea>
						</div>

						<div class="container text-center">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>

					</form>





				</div>
			</div>
		</div>
	</div>
	<!-- end model category -->







	<!-- model category -->

	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="add-product-model" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog " role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white bg-dark">
					<h5 class="modal-title" id="exampleModalLabel">Add Product
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="AddProduct" method="post">

						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter Category Title" required>


						</div>

						<div class="form-group">

							<textarea rows="" cols="" placeholder="enetre disc"
								name="catDescription" required class="form-control"
								style="height: 200px"></textarea>
						</div>





						<div class="form-group">
							<input type="number" class="form-control" name="pPrice"
								placeholder="Enter Category price" required>


						</div>


						<div class="form-group">
							<input type="number" class="form-control" name="pDiscount"
								placeholder="Enter Category discount" required>


						</div>


						<div class="form-group">
							<input type="number" class="form-control" name="pQuantity"
								placeholder="Enter Category quantity" required>


						</div>









						<div class="form-group">
							<%
							CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
							List<Category> catList = catDao.getCategories();
							%>
							<select name="catId" id="" class="form-control" required>
								<option disabled selected>---Select---</option>
								<%
								for (Category c : catList) {
								%>
								<option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
								<%
								}
								%>
							</select>
						</div>















						<div class="form-group">
							<input type="file" class="form-control" name="pPic" required>


						</div>



















						<div class="container text-center">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>












					</form>





				</div>
			</div>
		</div>
	</div>
	<!-- end model category -->







	</div>
	</div>
	</div>



	<!-- end of modeal product -->







	<%@include file="components/footer.jsp"%>
</body>
</html>