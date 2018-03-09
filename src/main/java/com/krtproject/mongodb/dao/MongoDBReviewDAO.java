package com.krtproject.mongodb.dao;

import java.util.ArrayList;

import java.util.List;
import java.util.regex.Pattern;

import com.krtproject.mongodb.converter.ReviewConverter;
import com.krtproject.mongodb.model.Review;
import com.mongodb.BasicDBObject;
import com.mongodb.BasicDBObjectBuilder;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;

public class MongoDBReviewDAO {

	private DBCollection col;
	private DBCollection img;

	public MongoDBReviewDAO(MongoClient mongo) {
		System.out.println("Database connection established");
		this.col = mongo.getDB("amazonreview").getCollection("MyReview");
		this.img = mongo.getDB("amazonreview").getCollection("images");
		System.out.println("Collection connection established");	
	}

	public Review readIndividualReview(Review r) {
		DBObject query = BasicDBObjectBuilder.start().append("Id", r.getId()).get();
		
		DBObject data = this.col.findOne(query);
		return ReviewConverter.toReview(data);
	}
	
	public void createReviewComment(Review r){
		
		BasicDBObject cmt = new BasicDBObject().append("$push", new  BasicDBObject("comment", r.getComment()));
		this.col.update(new BasicDBObject().append("Id", r.getId()), cmt);
	}
	
	public Review getImage(Review r) {
		
		BasicDBObjectBuilder builder = BasicDBObjectBuilder.start().add("item", Pattern.compile(r.getSearchKeyword()));
		DBObject query = builder.get();
		
		DBObject data = this.img.findOne(query);
		return ReviewConverter.toImgReview(data);
	}

	public List<Review> readReview(Review p) {
		List<Review> data = new ArrayList<Review>();

		BasicDBObjectBuilder builder = BasicDBObjectBuilder.start().add("Summary", Pattern.compile(p.getSummary()));
		DBObject query = builder.get();

		DBCursor cursor = this.col.find(query).sort(new BasicDBObject("Score",-1));

		while (cursor.hasNext()) {
			DBObject doc = cursor.next();
			Review r = ReviewConverter.toReview(doc);
			data.add(r);
		}
		return data;
	}

}
