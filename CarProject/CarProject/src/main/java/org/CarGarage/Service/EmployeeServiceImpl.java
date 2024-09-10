package org.CarGarage.Service;

import java.util.List;

import org.CarGarage.Model.EmployeeModel;
import org.CarGarage.Repository.*;

public class EmployeeServiceImpl implements EmployeeService {
MechanicRepository es=new EmployeeRepositoryImpl();
	@Override
	public boolean isAddEmployee(EmployeeModel model) {
		
		return es.isAddEmployee(model);
	}

	@Override
	public List<EmployeeModel> getAllEmployee() {
		
		return es.getAllEmployee();
	}

	@Override
	public boolean isUpdateEmployee(EmployeeModel model) {
		// TODO Auto-generated method stub
		return es.isUpdateEmployee(model);
	}

	@Override
	public List<EmployeeModel> getAllEmployeeDetails(List<Integer> mids) {
		// TODO Auto-generated method stub
		return es.getAllEmployeeDetails(mids);
	}

}
