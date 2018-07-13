package com.moim.mvc.domain;

import java.sql.Date;

public class User {

	private String userId;
	private String name;
	private String password;
	private String birth;
	private String address;
	private String phone;


	private String profileImg;
	private String onOff;
	private String role;
	private String interestNo1;
	private String interestNo2;
	private String interestNo3;
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	public String getPassword() {
		return password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public void setPassword(String password) {
		this.password = password;
	}


	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getOnOff() {
		return onOff;
	}

	public void setOnOff(String onOff) {
		this.onOff = onOff;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
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

	@Override
	public String toString() {
		return "User [userId=" + userId + ", name=" + name + ", password=" + password + ", birth=" + birth
				+ ", address=" + address + ", phone=" + phone + ", profileImg=" + profileImg + ", onOff=" + onOff
				+ ", role=" + role + ", interestNo1=" + interestNo1 + ", interestNo2=" + interestNo2 + ", interestNo3="
				+ interestNo3 + "]";
	}

}
