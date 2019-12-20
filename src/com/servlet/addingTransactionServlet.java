package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cars.Inventory;

/**
 * Servlet implementation class addingTransactionServlet
 */
@WebServlet("/addingTransactionServlet")
public class addingTransactionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addingTransactionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		Inventory inventory = new Inventory();
		inventory.readingFromTxtFile();
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String vendID = request.getParameter("vendID");
		inventory.addToTransactions(vendID, firstName, lastName, email);
		inventory.readFromTransactionsFile();
		inventory.removeFromTxtFile(vendID);
		session.setAttribute("inventory", inventory);
		
		
		RequestDispatcher rs = request.getRequestDispatcher("Reporting.jsp");
		rs.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
