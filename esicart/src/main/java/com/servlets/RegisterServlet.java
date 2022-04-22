package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.User;
import com.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		try {
			
			String userName=request.getParameter("username");
			String userEmail = request.getParameter("email");
			String userPassword = request.getParameter("password");
			String userPhone = request.getParameter("phone");
			String userAddress = request.getParameter("address");
			
			HttpSession s = request.getSession();
			if(userName.isEmpty() || userEmail.isEmpty() || userPassword.isEmpty() || userPhone.isEmpty() || userAddress.isEmpty())
			{
				
				s.setAttribute("message", " Please Fill All Deatils!! ");
				response.sendRedirect("Register.jsp");
				return;
			}
			Session session = FactoryProvider.getFactory().openSession();
			
			
			
			 User user = new User(userName, userEmail, userPassword, userPhone, "default.png", userAddress, "normal");
             
             Session hibernateSession = FactoryProvider.getFactory().openSession();
             Transaction tx = hibernateSession.beginTransaction();
             
             int userId = (Integer) session.save(user);
             
             tx.commit();
             hibernateSession.close();
  
             HttpSession httpSession = request.getSession();
             httpSession.setAttribute("message","Your Account has been created successfully !");
             response.sendRedirect("Register.jsp");
             return;
			
			
			
			
			
		}catch(Exception e)
		{
			HttpSession s = request.getSession();
			s.setAttribute("message", "Registration not SuccessFul !! ");
			e.printStackTrace();
		}
		
		
		
	}

}
