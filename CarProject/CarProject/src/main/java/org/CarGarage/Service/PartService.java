package org.CarGarage.Service;

import java.util.List;

import org.CarGarage.Model.PartModel;

public interface PartService {
public boolean isAddNewParts(PartModel model);
public List<PartModel> getAllParts();
public List<PartModel> getAllPartDetails(List<Integer> pids);
public boolean isUpdatePart(PartModel model) ;
}
