package org.CarGarage.Repository;

import java.util.List;

import org.CarGarage.Model.*;

public interface BillRepository {
	public int isgetChargePrice(int sid);
	public boolean isAddBill(BillModel bmodel,int sid,int vid);
	public int isSetVehicle(int vid);
	public List<Object[]> getAllInfo();
	public boolean isDelBillById(int bid);
	public List<Object[]> getAllInfoPart(int bid);
	public List<Object[]> getAllInfoC(int bid);
}
