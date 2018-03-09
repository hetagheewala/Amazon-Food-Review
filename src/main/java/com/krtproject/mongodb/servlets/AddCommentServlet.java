package com.krtproject.mongodb.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
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
 * Servlet implementation class AddCommentServlet
 */
@WebServlet("/addComment")
public class AddCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String comment = request.getParameter("usercomment");
		List<String> commentList = new ArrayList<String>();
		commentList.add(comment);
		int id = Integer.parseInt(request.getParameter("idVal"));
		String searchWord = request.getParameter("searchWord");

		if ((commentList.isEmpty())) {
			request.setAttribute("error", "Comment is missing");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/individualReview.jsp");
			rd.forward(request, response);
		} else {
			Review r = new Review();
			r.setComment(commentList);
			r.setId(id);
			MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGO_CLIENT");
			MongoDBReviewDAO reviewDAO = new MongoDBReviewDAO(mongo);
			reviewDAO.createReviewComment(r);
			request.setAttribute("success", "Comment Posted Successfully");

			Review imgVal = new Review();
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
	}
}
