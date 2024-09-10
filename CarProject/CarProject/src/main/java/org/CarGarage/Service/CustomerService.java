package org.CarGarage.Service;

import java.util.List;

import org.CarGarage.Model.CustomerModel;

public interface CustomerService {
	public boolean isAddNewCustomer(CustomerModel model);
	public List<CustomerModel> getAllCustomer();
	public boolean isDelCustomerById(int cid);
	public boolean isUpdateCustomer(CustomerModel model);
	public int isUserLogin(String email, String contact);
	public List<Object[]> getProfile(int cid);
	public List<Object[]> getAllCustomerDetails(List<Integer> cids);
}
