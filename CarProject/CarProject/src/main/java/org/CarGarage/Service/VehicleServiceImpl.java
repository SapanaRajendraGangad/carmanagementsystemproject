package org.CarGarage.Service;

import java.util.List;

import org.CarGarage.Model.VehicleModel;
import org.CarGarage.Repository.*;

public class VehicleServiceImpl implements VehicleService {
	VehicleRepository vr=new VehicleRepositoryImpl();
	public boolean isAddVehicle(VehicleModel model,String contact) {
		return vr.isAddVehicle(model,contact);
	}
	@Override
	public int isCustomeConatct(String contact) {
		return vr.isCustomerContact(contact);
	}
	@Override
	public List<Object[]> getAllInfo() {
		return vr.getAllInfo();
	}
	public boolean isDelVehicleById(int vid) {
		return vr.isDelVehicleById(vid);
	}
	@Override
	public boolean isUpdateVehicle(VehicleModel model) {
		// TODO Auto-generated method stub
		return vr.isUpdateVehicle(model);
	}
	@Override
	public List<Object[]> isSearchVehicle(String noplate) {
		// TODO Auto-generated method stub
		return vr.isSearchVehicle(noplate);
	}
	@Override
	public List<VehicleModel> getAllVehicleDetails(List<Integer> vids) {
		// TODO Auto-generated method stub
		return vr.getAllVehicleDetails(vids);
	}
}
