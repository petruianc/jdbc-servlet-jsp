/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petru.model;

import java.util.Date;

public class AuditHistory {
	private int userId;
	private int employeeId;
	private String action;
	private Date actionDate;
	
	private String userLastName;
	private String userFirstName;
	
	public AuditHistory(int userId, int employeeId, String action, Date actionDate, String userLastName, String userFirstName) {
		super();
		this.userId = userId;
		this.employeeId = employeeId;
		this.action = action;
		this.actionDate = actionDate;
		this.userLastName = userLastName;
		this.userFirstName = userFirstName;
	}
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getEmployeeID() {
		return employeeId;
	}
	public void setEmployeeID(int employeeId) {
		this.employeeId = employeeId;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public Date getActionDate() {
		return actionDate;
	}
	public void setActionDate(Date actionDate) {
		this.actionDate = actionDate;
	}
	public String getUserLastName() {
		return userLastName;
	}
	public void setUserLastName(String userLastName) {
		this.userLastName = userLastName;
	}
	public String getUserFirstName() {
		return userFirstName;
	}
	public void setUserFirstName(String userFirstName) {
		this.userFirstName = userFirstName;
	}
	@Override
	public String toString() {
		return "AuditHistory [userId=" + userId + ", employeeID=" + employeeId + ", action=" + action + ", actionDate="
				+ actionDate + ", userLastName=" + userLastName + ", userFirstName=" + userFirstName + "]";
	}
	
	
	
}