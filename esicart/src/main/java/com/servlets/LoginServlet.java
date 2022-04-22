package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.UserDao;
import com.entities.User;
import com.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		// TODO Auto-generated method stub
	
		
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		//validation
		
		//Authantication of user
		
		UserDao dao = new UserDao(FactoryProvider.getFactory());
		User user = dao.getUserByEmailAndPassword(email, password);
		
		HttpSession session = request.getSession();
		
		if(user == null)
		{
			
			session.setAttribute("message", "Invalid details");
			response.sendRedirect("login.jsp");
		}
		else{
			out.println("<h1>Welcome"+ user.getUserName() +"</h1>");

			session.setAttribute("curr-user", user);
			
			
			if(user.getUserType().equals("admin"))
			{
				response.sendRedirect("admin.jsp");
			}
			else if(user.getUserType().equals("normal"))
			{
				response.sendRedirect("normal.jsp");
			}
			else {
				out.print("we have not identified");
			}
		}
		
		
		
		
		
		
	}

}
