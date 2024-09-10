package org.CarGarage.Repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.CarGarage.Config.DBConfig;
import org.CarGarage.Model.EmployeeModel;
import org.CarGarage.Model.PartModel;

public class EmployeeRepositoryImpl extends DBConfig implements MechanicRepository {
	List<EmployeeModel> list;
	@Override
	public boolean isAddEmployee(EmployeeModel model) {
		
			try {
				stmt=conn.prepareStatement("insert into mechanic values('0',?,?,?)");
				stmt.setString(1,model.getName() );
				stmt.setString(2,model.getSpecialization());
				stmt.setString(3,model.getExperience());
				int value=stmt.executeUpdate();
				return value>0?true:false;
				
			}catch(Exception ex) {
				System.out.println("Exception in isAddNewEmployee Repository"+ex);
				return false;
			}
	}

	@Override
	public List<EmployeeModel> getAllEmployee() {
			try {
				list=new ArrayList<EmployeeModel>();
				stmt=conn.prepareStatement("select *from mechanic");
				rs=stmt.executeQuery();
				while(rs.next()) {
					EmployeeModel emodel=new EmployeeModel();
					emodel.setMid(rs.getInt("mid"));
					emodel.setName(rs.getString("mname"));
					emodel.setSpecialization(rs.getString("specialization"));
					emodel.setExperience(rs.getString("experience"));
					list.add(emodel);
				}
				return list.size()>0?list:null;
			}catch(Exception ex) {
				System.out.println("Exception in getAllEmployee Repository is"+ex);
			}
			return null;
		}

	@Override
	public boolean isUpdateEmployee(EmployeeModel model) {
       try {
			
			stmt=conn.prepareStatement("update mechanic set mname=?,specialization=?,Experience=? where mid=?");
			stmt.setString(1, model.getName());
			stmt.setString(2, model.getSpecialization());
			stmt.setString(3, model.getExperience());
			stmt.setInt(4, model.getMid());
			int value=stmt.executeUpdate();
			System.out.println(value);
			return value>0?true:false;
			
		}
		catch(Exception ex) {
			System.out.println("Error in isUpdateEmployee repository "+ex);
			return false;
		}
          
	}

	@Override
	public List<EmployeeModel> getAllEmployeeDetails(List<Integer> mids) {
		 List<EmployeeModel> emps = new ArrayList<>();
		    try {
		        StringBuilder queryBuilder = new StringBuilder("SELECT * FROM mechanic WHERE mid IN (");
		        for (int i = 0; i < mids.size(); i++) {
		            if (i > 0) {
		                queryBuilder.append(", ");
		            }
		            queryBuilder.append("?");
		        }
		        queryBuilder.append(")");
		        
		        stmt = conn.prepareStatement(queryBuilder.toString());
		        
		        for (int i = 0; i < mids.size(); i++) {
		            stmt.setInt(i + 1, mids.get(i));
		        }
		        
		        rs = stmt.executeQuery();

		        while (rs.next()) {
		            EmployeeModel emp = new EmployeeModel();
		            emp.setMid(rs.getInt(1));
		            emp.setName(rs.getString(2));
		            emp.setSpecialization(rs.getString(3));
		            emp.setExperience(rs.getString(4));
		            emps.add(emp);
		        }
		    }
		    catch (Exception ex) {
		        System.out.println("Exception in getAllEmployeeDetails: " + ex);
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
		    return emps;
		}


	}



