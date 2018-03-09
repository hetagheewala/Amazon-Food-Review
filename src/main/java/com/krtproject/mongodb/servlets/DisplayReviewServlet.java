package com.krtproject.mongodb.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.krtproject.mongodb.dao.MongoDBReviewDAO;
import com.krtproject.mongodb.model.Review;
import com.mongodb.MongoClient;

/**
 * Servlet implementation class DisplayReview
 */
@WebServlet("/displayReview")
public class DisplayReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String searchWord = request.getParameter("searchKey");
		if (id == null || "".equals(id)) {
			throw new ServletException("id missing for edit operation");
		}
		MongoClient mongo = (MongoClient) request.getServletContext()
				.getAttribute("MONGO_CLIENT");
		MongoDBReviewDAO reviewDAO = new MongoDBReviewDAO(mongo);
		Review r = new Review();
		Review imgVal = new Review();
		r.setId(Integer.parseInt(id));
		imgVal.setSearchKeyword(searchWord);
		r = reviewDAO.readIndividualReview(r);
		imgVal = reviewDAO.getImage(imgVal);
		r.setImageVal(imgVal.getImageVal());
		request.setAttribute("review", r);
		request.setAttribute("searchWord", searchWord);
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/individualReview.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
