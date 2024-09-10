package org.CarGarage.Service;

import java.util.List;

import org.CarGarage.Model.PartModel;
import org.CarGarage.Repository.*;

public class PartServiceImpl implements PartService{
PartRepository pr=new PartRepositoryImpl();
	@Override
	public boolean isAddNewParts(PartModel model) {
		
		return pr.isAddParts(model);
	}

	@Override
	public List<PartModel> getAllParts() {
		
		return pr.getAllParts();
	}

	@Override
	public List<PartModel> getAllPartDetails(List<Integer> pids) {
		// TODO Auto-generated method stub
		return pr.getAllPartDetails(pids);
	}

	@Override
	public boolean isUpdatePart(PartModel model) {
		// TODO Auto-generated method stub
		return pr.isUpdatePart(model);
	}

}
