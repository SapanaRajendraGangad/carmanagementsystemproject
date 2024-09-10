package org.CarGarage.Repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.CarGarage.Config.DBConfig;
import org.CarGarage.Model.CustomerModel;
import org.CarGarage.Model.PartModel;

public class PartRepositoryImpl extends DBConfig implements PartRepository {
	List<PartModel> list;

@Override
public boolean isAddParts(PartModel model) {
		try {
			stmt=conn.prepareStatement("insert into part values('0',?,?)");
			stmt.setString(1,model.getPname() );
			stmt.setInt(2,model.getPrice());
			int value=stmt.executeUpdate();
			return value>0?true:false;
			
		}catch(Exception ex) {
			System.out.println("Exception in isAddNewPart Repository"+ex);
			return false;
		}
}
public List<PartModel> getAllParts() {
		try {
			list=new ArrayList<PartModel>();
			
			stmt=conn.prepareStatement("select *from part");
			rs=stmt.executeQuery();
			while(rs.next()) {
				PartModel pmodel=new PartModel();
				pmodel.setPid(rs.getInt("pid"));
				pmodel.setPname(rs.getString("pname"));
				pmodel.setPrice(rs.getInt("price"));
				list.add(pmodel);
			}
			return list.size()>0?list:null;
		}catch(Exception ex) {
			System.out.println("Exception in getAllPart Repository is"+ex);
			return null;
		}
		
		
	}
public boolean isUpdatePart(PartModel model) {
	try {
		
		stmt=conn.prepareStatement("update part set pname=?, price=? where pid=?");
		stmt.setString(1, model.getPname());
		stmt.setInt(2, model.getPrice());
		stmt.setInt(6, model.getPid());
		int value=stmt.executeUpdate();
		System.out.println(value);
		return value>0?true:false;
		
	}
	catch(Exception ex) {
		System.out.println("Error is "+ex);
		return false;
	}
}
public List<PartModel> getAllPartDetails(List<Integer> pids) {
    List<PartModel> parts = new ArrayList<>();
    try {
        StringBuilder queryBuilder = new StringBuilder("SELECT * FROM part WHERE pid IN (");
        for (int i = 0; i < pids.size(); i++) {
            if (i > 0) {
                queryBuilder.append(", ");
            }
            queryBuilder.append("?");
        }
        queryBuilder.append(")");
        
        stmt = conn.prepareStatement(queryBuilder.toString());
        
        for (int i = 0; i < pids.size(); i++) {
            stmt.setInt(i + 1, pids.get(i));
        }
        
        rs = stmt.executeQuery();

        while (rs.next()) {
            PartModel part = new PartModel();
            part.setPid(rs.getInt(1));
            part.setPname(rs.getString(2));
            part.setPrice(rs.getInt(3));
            parts.add(part);
        }
    }
    catch (Exception ex) {
        System.out.println("Exception in getAllPartDetails: " + ex);
        ex.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            System.out.println("Error closing resources: " + ex);
            ex.printStackTrace();
        }
    }
    return parts;
}


}

