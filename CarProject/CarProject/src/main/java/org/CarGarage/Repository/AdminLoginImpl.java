package org.CarGarage.Repository;

import org.CarGarage.Config.DBConfig;
import org.CarGarage.Model.AdminModel;

public class AdminLoginImpl extends DBConfig implements AdminLogin{
public boolean isUserPass(AdminModel model) {
	try {
		stmt=conn.prepareStatement("select *from admin where user=? and pass=?");
		stmt.setString(1, model.getUserName());
		stmt.setString(2, model.getContact());
		rs=stmt.executeQuery();
		return rs.next()?true:false;
	}catch(Exception ex) {
		System.out.println("Exception in AdminLoginImpl Repository is"+ex);
		return false;
	}
}
}
