package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.CategoryDao;
import com.entities.Category;
import com.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AddCategory
 */
@WebServlet("/AddCategory")
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		try {
			
			
			String title = request.getParameter("catTitle");
			String desc = request.getParameter("catDescription");
			
			Category category = new Category();
			category.setCategoryTitle(title);
			category.setCategoryDescription(desc);
			
			//category save in db
			CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
			int catId = cdao.saveCategory(category);
			out.print("category saved :"+catId);
			HttpSession session = request.getSession();
			 session.setAttribute("message", "Category added successfully and category id is : " + catId);
             response.sendRedirect("admin.jsp");
             return;
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
