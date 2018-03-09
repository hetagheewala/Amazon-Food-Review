package com.krtproject.mongodb.model;

import java.util.List;

public class Review {

	private int id;

	private String ProductId;

	private String UserId;

	private String ProfileName;
	
	private int HelpfulnessNumerator;
	
	private int HelpfulnessDenominator;
	
	private int Score;
	
	private int Time;
	
	private String Summary;
	
	private String Text;
	
	private String searchKeyword;
	
	private String imageVal;
	
	private List<String> comment;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProductId() {
		return ProductId;
	}

	public void setProductId(String productId) {
		ProductId = productId;
	}

	public String getUserId() {
		return UserId;
	}

	public void setUserId(String userId) {
		UserId = userId;
	}

	public String getProfileName() {
		return ProfileName;
	}

	public void setProfileName(String profileName) {
		ProfileName = profileName;
	}

	public int getHelpfulnessNumerator() {
		return HelpfulnessNumerator;
	}

	public void setHelpfulnessNumerator(int helpfulnessNumerator) {
		HelpfulnessNumerator = helpfulnessNumerator;
	}

	public int getHelpfulnessDenominator() {
		return HelpfulnessDenominator;
	}

	public void setHelpfulnessDenominator(int helpfulnessDenominator) {
		HelpfulnessDenominator = helpfulnessDenominator;
	}

	public int getScore() {
		return Score;
	}

	public void setScore(int score) {
		Score = score;
	}

	public int getTime() {
		return Time;
	}

	public void setTime(int time) {
		Time = time;
	}

	public String getSummary() {
		return Summary;
	}

	public void setSummary(String summary) {
		Summary = summary;
	}

	public String getText() {
		return Text;
	}

	public void setText(String text) {
		Text = text;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getImageVal() {
		return imageVal;
	}

	public void setImageVal(String imageVal) {
		this.imageVal = imageVal;
	}
	
	public List<String> getComment() {
		return comment;
	}

	public void setComment(List<String> comment) {
		this.comment = comment;
	}	
}
