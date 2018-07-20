package com.moim.mvc.domain;

public class Member {

	int memberNo;
	String nickName;
	String statusMessage;
	String profileImg;
	int visitCount;
	String stateCode;
	String role;
	String userId;
	int groupNo;
	String comment;
	
	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getStatusMessage() {
		return statusMessage;
	}

	public void setStatusMessage(String statusMessage) {
		this.statusMessage = statusMessage;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public int getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}

	public String getStateCode() {
		return stateCode;
	}

	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public Member() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", nickName=" + nickName + ", statusMessage=" + statusMessage
				+ ", profileImg=" + profileImg + ", visitCount=" + visitCount + ", stateCode=" + stateCode + ", role="
				+ role + ", userId=" + userId + ", groupNo=" + groupNo + ", comment=" + comment + "]";
	}
	
}
