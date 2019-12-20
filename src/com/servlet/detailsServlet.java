package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cars.Car;
import com.cars.Inventory;

/**
 * Servlet implementation class detailsServlet
 */
@WebServlet("/detailsServlet")
public class detailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public detailsServlet() {
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
		String vendID = request.getParameter("vendID");
		for (Car car : inventory.getInvCars()) {
			if(car.getVendID().equals(vendID)) {
				session.setAttribute("car", car);
			}
		}
		session.setAttribute("vendID", vendID);
		RequestDispatcher rs = request.getRequestDispatcher("carInfo.jsp");
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
