package com.krtproject.mongodb.converter;

import java.util.ArrayList;
import java.util.List;

import org.bson.types.ObjectId;

import com.krtproject.mongodb.model.Review;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObjectBuilder;
import com.mongodb.DBObject;

public class ReviewConverter {

	public static DBObject toDBObject(Review r) {

		BasicDBObjectBuilder builder = BasicDBObjectBuilder.start().append("id", r.getId())
				.append("ProductId", r.getProductId()).append("UserId", r.getUserId())
				.append("ProfileName", r.getProfileName()).append("HelpfulnessNumerator", r.getHelpfulnessNumerator())
				.append("HelpfulnessDenominator", r.getHelpfulnessDenominator()).append("Score", r.getScore())
				.append("Time", r.getTime()).append("Summary", r.getSummary()).append("Text", r.getText());
		if (r.getId() > 0)
			builder = builder.append("_id", r.getId());
		return builder.get();
	}

	public static Review toReview(DBObject doc) {
		Review r = new Review();

		r.setId((int) doc.get("Id"));
		r.setProductId((String) doc.get("ProductId"));
		r.setUserId((String) doc.get("UserId"));
		r.setProfileName((String) doc.get("ProfileName"));
		r.setHelpfulnessNumerator((int) doc.get("HelpfulnessNumerator"));
		r.setHelpfulnessDenominator((int) doc.get("HelpfulnessDenominator"));
		r.setScore((int) doc.get("Score"));
		r.setTime((int) doc.get("Time"));
		r.setSummary((String) doc.get("Summary"));
		r.setText((String) doc.get("Text"));

		if (doc.get("comment") != null) {
			BasicDBList commentList = (BasicDBList) doc.get("comment");
			List<String> comments = new ArrayList<String>();
			for (Object o : commentList) {
				comments.add(o.toString().replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("\"", ""));
			}
			r.setComment(comments);
		}
		ObjectId id = (ObjectId) doc.get("_id");
		return r;
	}

	public static Review toImgReview(DBObject doc) {
		Review r = new Review();
		if (doc != null) {
			r.setSearchKeyword((String) doc.get("item"));
			r.setImageVal((String) doc.get("path"));
		}
		return r;
	}

}
