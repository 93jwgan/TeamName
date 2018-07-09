package com.moim.mvc.domain;

public class Attendee {

	int attendeeNo;
	int memberNo;
	public int getAttendeeNo() {
		return attendeeNo;
	}

	public void setAttendeeNo(int attendeeNo) {
		this.attendeeNo = attendeeNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}

	int scheduleNo;
	
	public Attendee() {
		// TODO Auto-generated constructor stub
	}

}
