package org.CarGarage.Service;

import java.sql.Date;
import java.util.List;

import org.CarGarage.Model.PartModel;
import org.CarGarage.Model.ServiceModel;

public interface ServiceService {
	public boolean isAddService(ServiceModel smodel, String noplate, List<String> partNames, List<String> mechanicNames);
	public int isSetMechanic(String name);
	public int isSetPart(String partname);
	public int isSetService(String sdate);
	public int isSetVehicle(String noplate);
	public List<Object[]> getAllInfo();
	public boolean isDeleteServiceById(int sid);
	boolean isUpdateService(ServiceModel model);
	public List<Object[]> getAllServiceDetails(List<Integer> sids);
	public List<Object[]> getAllInfoS();
}
