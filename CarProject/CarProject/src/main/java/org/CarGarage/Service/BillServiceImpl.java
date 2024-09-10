package org.CarGarage.Service;

import java.util.List;

import org.CarGarage.Model.BillModel;
import org.CarGarage.Repository.*;

public class BillServiceImpl implements BillService {
BillRepository br=new BillRepositoryImpl();
public int isgetChargePrice(int sid)
{
	return br.isgetChargePrice(sid);
}
public boolean isAddBill(BillModel bmodel,int sid,int vid) {
	return br.isAddBill(bmodel, sid, vid);
}
public int isSetVehicle(int vid) {
	return br.isSetVehicle(vid);
}
@Override
public List<Object[]> getAllInfo() {
	
	return br.getAllInfo();
}
@Override
public boolean isDelBillById(int bid) {
	// TODO Auto-generated method stub
	return br.isDelBillById(bid);
}
@Override
public List<Object[]> getAllInfoPart(int bid) {
	// TODO Auto-generated method stub
	return br.getAllInfoPart(bid);
}
@Override
public List<Object[]> getAllInfoC(int bid) {
	// TODO Auto-generated method stub
	return br.getAllInfoC(bid);
}

}
