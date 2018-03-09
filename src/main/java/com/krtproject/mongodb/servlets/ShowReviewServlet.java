package com.krtproject.mongodb.servlets;

import java.io.IOException;

import java.util.List;

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
 * Servlet implementation class ShowReviewServlet
 */
@WebServlet("/showReview")
public class ShowReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MongoClient mongo = (MongoClient) request.getServletContext()
				.getAttribute("MONGO_CLIENT");
		MongoDBReviewDAO reviewDAO = new MongoDBReviewDAO(mongo);
		Review r = new Review();
		String reviewTerm = request.getParameter("reviewSearch");
		r.setSummary(reviewTerm);
		List<Review> reviews = reviewDAO.readReview(r);
		request.setAttribute("reviews", reviews);
		request.setAttribute("reviewTerm", reviewTerm);

		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/displayReviews.jsp");
		rd.forward(request, response);
	}

}
