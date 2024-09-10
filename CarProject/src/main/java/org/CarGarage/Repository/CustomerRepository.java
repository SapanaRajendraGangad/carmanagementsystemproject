package org.CarGarage.Repository;

import org.CarGarage.Model.CustomerModel;
import java.util.*;
public interface CustomerRepository {
public boolean isAddNewCustomer(CustomerModel model);
public List<CustomerModel> getAllCustomer();
public boolean isDelCustomerById(int cid);
public boolean isUpdateCustomer(CustomerModel model);
List<Object[]> getProfile(int cid);
public int isCustomerLogin(String email, String contact);
public List<Object[]> getAllCustomerDetails(List<Integer> cids);
}
