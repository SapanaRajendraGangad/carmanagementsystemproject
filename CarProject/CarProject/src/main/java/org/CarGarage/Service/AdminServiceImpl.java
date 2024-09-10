package org.CarGarage.Service;

import org.CarGarage.Model.AdminModel;
import org.CarGarage.Repository.*;

public class AdminServiceImpl implements AdminService {
AdminLogin al=new AdminLoginImpl();
public boolean isUserPass(AdminModel model) {
	return al.isUserPass(model);
}
}
