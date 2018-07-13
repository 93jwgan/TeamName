package com.moim.mvc.domain;

public class Schedule {

	int scheduleNo;
	String title;
	String contents;
	int maxMember;
	int fee;
	String startDay;
	String endDay;
	String lat;
	String lng;
	int groupNo;
	String address;

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
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

	public int getMaxMember() {
		return maxMember;
	}

	public void setMaxMember(int maxMember) {
		this.maxMember = maxMember;
	}


	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}


	public String getStartDay() {
		return startDay;
	}

	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}

	public String getEndDay() {
		return endDay;
	}

	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public Schedule() {
		// TODO Auto-generated constructor stub
	}

	public String toString() {
		return "Schedule : [scheduleNo]"+scheduleNo+" [title] : "+title+" [contents] : "+contents+" [maxMember] : "+maxMember+" [fee] : "+fee+
				" [startDay] : "+startDay+" [endDay] : "+endDay+" [lat] : "+lat+" [lng] : "+lng+" [groupNo] : "+groupNo+ " [address] :"+address;
	}
}
