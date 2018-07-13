package com.moim.mvc.domain;

public class Groups {

	int groupNo;
	String groupName;
	String groupInfo;
	String memberLimit;
	int visitCount;
	int point;
	String birthDate;
	String mainImg;
	String infoImg;
	int ageLimitStart;
	int ageLimitEnd;
	String interestNo1;
	String interestNo2;
	String interestNo3;
	String hashTag;
	String groupMaster;

	public String getGroupMaster() {
		return groupMaster;
	}

	public void setGroupMaster(String groupMaster) {
		this.groupMaster = groupMaster;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getGroupInfo() {
		return groupInfo;
	}

	public void setGroupInfo(String groupInfo) {
		this.groupInfo = groupInfo;
	}

	public String getMemberLimit() {
		return memberLimit;
	}

	public void setMemberLimit(String memberLimit) {
		this.memberLimit = memberLimit;
	}

	public int getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	public String getInfoImg() {
		return infoImg;
	}

	public void setInfoImg(String infoImg) {
		this.infoImg = infoImg;
	}

	public int getAgeLimitStart() {
		return ageLimitStart;
	}

	public void setAgeLimitStart(int ageLimitStart) {
		this.ageLimitStart = ageLimitStart;
	}

	public int getAgeLimitEnd() {
		return ageLimitEnd;
	}

	public void setAgeLimitEnd(int ageLimitEnd) {
		this.ageLimitEnd = ageLimitEnd;
	}

	public String getInterestNo1() {
		return interestNo1;
	}

	public void setInterestNo1(String interestNo1) {
		this.interestNo1 = interestNo1;
	}

	public String getInterestNo2() {
		return interestNo2;
	}

	public void setInterestNo2(String interestNo2) {
		this.interestNo2 = interestNo2;
	}

	public String getInterestNo3() {
		return interestNo3;
	}

	public void setInterestNo3(String interestNo3) {
		this.interestNo3 = interestNo3;
	}

	public String getHashTag() {
		return hashTag;
	}

	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}

	@Override
	public String toString() {
		return "Groups [groupNo=" + groupNo + ", groupName=" + groupName + ", groupInfo=" + groupInfo + ", memberLimit="
				+ memberLimit + ", visitCount=" + visitCount + ", point=" + point + ", birthDate=" + birthDate
				+ ", mainImg=" + mainImg + ", infoImg=" + infoImg + ", ageLimitStart=" + ageLimitStart
				+ ", ageLimitEnd=" + ageLimitEnd + ", interestNo1=" + interestNo1 + ", interestNo2=" + interestNo2
				+ ", interestNo3=" + interestNo3 + ", hashTag=" + hashTag + ", groupMaster=" + groupMaster + "]";
	}

}
