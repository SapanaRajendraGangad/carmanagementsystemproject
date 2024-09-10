package org.CarGarage.Model;

import java.util.Date;

public class ServiceModel {
private String sdate;
private int id;
public String getSdate() {
	return sdate;
}
public void setSdate(String sdate) {
	this.sdate = sdate;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
private int charges;
private String distance;
private PartModel pmodel;
private EmployeeModel emodel;
public String getDate() {
	return sdate;
}
public void setDate(String sdate) {
	this.sdate = sdate;
}
public int getCharges() {
	return charges;
}
public void setCharges(int charges) {
	this.charges = charges;
}
public String getDistance() {
	return distance;
}
public void setDistance(String distance) {
	this.distance = distance;
}
public PartModel getPmodel() {
	return pmodel;
}
public void setPmodel(PartModel pmodel) {
	this.pmodel = pmodel;
}
public EmployeeModel getEmodel() {
	return emodel;
}
public void setEmodel(EmployeeModel emodel) {
	this.emodel = emodel;
}
 
}
