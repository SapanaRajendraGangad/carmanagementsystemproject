package org.CarGarage.Service;

import java.util.List;

import org.CarGarage.Model.EmployeeModel;

public interface EmployeeService {
	public boolean isAddEmployee(EmployeeModel model);
	public List<EmployeeModel> getAllEmployee();
	public boolean isUpdateEmployee(EmployeeModel model);
	public List<EmployeeModel> getAllEmployeeDetails(List<Integer> mids);
}
