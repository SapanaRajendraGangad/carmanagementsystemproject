package org.CarGarage.Service;

import java.util.List;

import org.CarGarage.Model.CustomerModel;
import org.CarGarage.Repository.CustomerRepository;
import org.CarGarage.Repository.CustomerRepositoryImpl;

public class CustomerServiceImpl implements CustomerService{
	CustomerRepository crepo=new CustomerRepositoryImpl();
	public boolean isAddNewCustomer(CustomerModel model) {
		return crepo.isAddNewCustomer(model)?true:false;
	}
	@Override
	public List<CustomerModel> getAllCustomer() {
		return crepo.getAllCustomer();
	}
	@Override
	public boolean isDelCustomerById(int cid) {
		// TODO Auto-generated method stub
		return crepo.isDelCustomerById(cid);
	}
	@Override
	public boolean isUpdateCustomer(CustomerModel model) {
		// TODO Auto-generated method stub
		return crepo.isUpdateCustomer(model);
	}
	@Override
	public int isUserLogin(String email,String contact) {
		// TODO Auto-generated method stub
		return crepo.isCustomerLogin(email,contact);
	}
	public List<Object[]> getProfile(int cid) {
		
		return crepo.getProfile(cid);
		
	}
	public List<Object[]> getAllCustomerDetails(List<Integer> cids){
		return crepo.getAllCustomerDetails(cids);
	}
}
