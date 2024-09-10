package org.CarGarage.Repository;

import java.util.List;

import org.CarGarage.Model.EmployeeModel;
import org.CarGarage.Model.PartModel;

public interface MechanicRepository {
public boolean isAddEmployee(EmployeeModel model);
public List<EmployeeModel> getAllEmployee();
public boolean isUpdateEmployee(EmployeeModel model);
public List<EmployeeModel> getAllEmployeeDetails(List<Integer> mids);
}
