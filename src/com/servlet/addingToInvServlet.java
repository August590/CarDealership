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
 * Servlet implementation class addingToInvServlet
 */
@WebServlet("/addingToInvServlet")
public class addingToInvServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addingToInvServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Inventory inventory = new Inventory();
		//inventory.readingFromTxtFile();
		HttpSession session = request.getSession(true);
		session.setAttribute("inventory", inventory);
		String manufacturer = request.getParameter("manufacturer");
		String model = request.getParameter("model");
		String make = request.getParameter("make");
		String kilo = request.getParameter("kilo");
		String urlPic = request.getParameter("picture");
		String price = request.getParameter("price");
		String used = request.getParameter("used");
		String description = request.getParameter("description");
		inventory.writeToTxtFiles("005", manufacturer, kilo, make, model, urlPic, price, used,"0");
		RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
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
