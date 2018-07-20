package com.moim.mvc.domain;

public class Board {

	int boardNo;
	String title;
	String contents;
	int clickCount;
	int recommendCount;
	String regDate;
	String stateCode;
	String userId;
	int memberNo;
	
	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getClickCount() {
		return clickCount;
	}

	public void setClickCount(int clickCount) {
		this.clickCount = clickCount;
	}

	public int getRecommendCount() {
		return recommendCount;
	}

	public void setRecommendCount(int recommendCount) {
		this.recommendCount = recommendCount;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getStateCode() {
		return stateCode;
	}

	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public Board() {
		// TODO Auto-generated constructor stub
	}

	public String toString() {
		return "Board : [boardNo] : "+boardNo+" [title] : "+title+" [contents] : "+contents+" [clickCount] : "+clickCount+" [recommendCount] : "+recommendCount+" [regDate] : "+regDate+
				" [stateCode] : "+stateCode+" [userId] : "+userId+ " [memberNo] : "+memberNo;
	}
}
