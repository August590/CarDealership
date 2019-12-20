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
 * Servlet implementation class detailsShowServlet
 */
@WebServlet("/detailsShowServlet")
public class detailsShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public detailsShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Inventory inventory = new Inventory();
		inventory.readFromTransactionsFile();
		//inventory.writeToTxtFiles("001", "Truman", "01/18/2019", "43000", "Mk39", "Jeep", "fasdfasdf", "232332", "true", "189");
		HttpSession session = request.getSession(true);
		session.setAttribute("inventory", inventory);
		
		//session.setAttribute("student", student);
		//var bar = 123;
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
