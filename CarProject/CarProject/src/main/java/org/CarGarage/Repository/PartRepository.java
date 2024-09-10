package org.CarGarage.Repository;

import java.util.List;

import org.CarGarage.Model.PartModel;

public interface PartRepository {
public boolean isAddParts(PartModel model);
public List<PartModel> getAllParts();
public List<PartModel> getAllPartDetails(List<Integer> pids);
public boolean isUpdatePart(PartModel model);
}
