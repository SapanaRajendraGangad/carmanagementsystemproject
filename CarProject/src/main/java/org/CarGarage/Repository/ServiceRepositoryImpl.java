package org.CarGarage.Repository;


import java.sql.SQLException;
import java.util.*;

import org.CarGarage.Config.DBConfig;
import org.CarGarage.Model.ServiceModel;
import org.CarGarage.Model.VehicleModel;

public class ServiceRepositoryImpl extends DBConfig implements ServiceRepository{
	List<Object[]> list;
	public int isSetVehicle(String noplate) {
		try {
			stmt=conn.prepareStatement("select vid from vehicle where noplate=?");
			stmt.setString(1, noplate);
			rs=stmt.executeQuery();
		
			if(rs.next()) {
				return rs.getInt(1);
			}
			else {
				return -1;
			}
		}
		catch(Exception ex) {
			System.out.println("Exception occure in issetVehicle in serviceRepository "+ex);
			return 0;
		}
	}
	public int isSetMechanic(String name) {
		try {
			stmt=conn.prepareStatement("select Mid from Mechanic where mname=?");
			stmt.setString(1, name);
			rs=stmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			else {
				return -1;
			}
		}
		catch(Exception ex) {
			System.out.println("Exception occure in isSetMechanic in serviceRepository "+ex);
			return 0;
		}
	}
	public int isSetPart(String partname) {
		try {
			stmt=conn.prepareStatement("select pid from part where pname=?");
			stmt.setString(1, partname);
			rs=stmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			else {
				return -1;
			}
		}
		catch(Exception ex) {
			System.out.println("Exception occure in isSetPart in serviceRepository "+ex);
			return 0;
		}
	}
	public int isSetService(String sdate) {
		try {
			stmt=conn.prepareStatement("select max(sid) from Service where sdate=?");
			stmt.setString(1, sdate);
			rs=stmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			else {
				return -1;
			}
		}
		catch(Exception ex) {
			System.out.println("Exception occure in isSetService in serviceRepository "+ex);
			return 0;
		}
	}

	@Override
	public boolean isAddService(ServiceModel smodel, String noplate, List<String> partNames, List<String> mechanicNames) {
	    try {
	        int vid = this.isSetVehicle(noplate);
	        if (vid == -1) {
	            throw new IllegalArgumentException("Vehicle not found.");
	        }
	        stmt = conn.prepareStatement("INSERT INTO service VALUES ('0', ?, ?, ?, ?)");
	        stmt.setString(1, smodel.getDate());
	        stmt.setInt(2, smodel.getCharges());
	        stmt.setString(3, smodel.getDistance());
	        stmt.setInt(4, vid);

	        int value = stmt.executeUpdate();
	        if (value > 0) {
	            int sid = this.isSetService(smodel.getDate());
	            if (sid == -1) {
	                throw new IllegalStateException("Service not found after insertion.");
	            }
	            Set<Integer> associatedParts = new HashSet<>();

	            for (String partName : partNames) {
	                int pid = this.isSetPart(partName);
	                if (pid != -1 && !associatedParts.contains(pid)) {
	                    for (String mechanicName : mechanicNames) {
	                        int mid = this.isSetMechanic(mechanicName);
	                        if (mid != -1) {
	                            stmt = conn.prepareStatement("INSERT INTO spmjoin1 VALUES (?, ?, ?)");
	                            stmt.setInt(1, pid);
	                            stmt.setInt(2, mid);
	                            stmt.setInt(3, sid);
	                            int result = stmt.executeUpdate();
	                            if (result <= 0) {
	                                throw new IllegalStateException("Failed to add part and mechanic for service.");
	                            }
	                        } else {
	                            throw new IllegalArgumentException("Mechanic '" + mechanicName + "' not found.");
	                        }
	                    }
	                   associatedParts.add(pid);
	                } else if (pid == -1) {
	                    throw new IllegalArgumentException("Part '" + partName + "' not found.");
	                } else {
	                    throw new IllegalStateException("Part '" + partName + "' is already associated with the service.");
	                }
	            }

	            return true; // Service added successfully
	        } else {
	            throw new IllegalStateException("Service not added.");
	        }
	    } catch (Exception ex) {
	        System.out.println("Exception occurred in isAddService: " + ex);
	        return false;
	    }
	}

	// Method to check if a part is already associated with a service
	private boolean isPartAssociatedWithService(int partId, int serviceId) {
	    try {
	        stmt = conn.prepareStatement("SELECT COUNT(*) FROM spmjoin1 WHERE pid = ? AND sid = ?");
	        stmt.setInt(1, partId);
	        stmt.setInt(2, serviceId);
	        rs = stmt.executeQuery();
	        if (rs.next()) {
	            return rs.getInt(1) > 0; // If count > 0, part is associated with the service
	        } else {
	            return false;
	        }
	    } catch (Exception ex) {
	        System.out.println("Exception occurred in isPartAssociatedWithService: " + ex);
	        return false;
	    }
	}

	
	public List<Object[]> getAllInfo() {
		try {
			list=new ArrayList<Object[]>();
			stmt=conn.prepareStatement("select s.sdate,s.charges,s.distance,p.pname,v.vname,m.mname,s.sid,v.vid from service s inner join spmjoin1 spm on s.sid=spm.sid inner join part p on spm.pid=p.pid inner join vehicle v on s.vid=v.vid inner join mechanic m on spm.mid=m.mid;");
			rs=stmt.executeQuery();
			while(rs.next()) {
				Object []obj=new Object[] {rs.getString(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7),rs.getInt(8)};
				list.add(obj);
			}
			return list.size()>0?list:null;
		}catch(Exception ex) {
			System.out.println("Error is"+ex);
			return null;
		}
		
	}
	public List<Object[]> getAllInfoS() {
		try {
			list=new ArrayList<Object[]>();
			stmt=conn.prepareStatement(" select s.sdate,v.vname,noplate,s.charges,s.sid,v.vid from vehicle v inner join service s on v.vid=s.vid;");
			rs=stmt.executeQuery();
			while(rs.next()) {
				Object []obj=new Object[] {rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getInt(6)};
				list.add(obj);
			}
			return list.size()>0?list:null;
		}catch(Exception ex) {
			System.out.println("Error is"+ex);
			return null;
		}
		
	}
	
	public boolean isDeleteServiceById(int sid) {
		try {
			stmt=conn.prepareStatement("delete from service where sid=?");
			stmt.setInt(1, sid);
			int value=stmt.executeUpdate();
		
			return value>0?true:false;
		}
		catch(Exception ex) {
			System.out.println("Error is"+ex);
		}
		return false;
	}

	@Override
	public boolean isUpdateService(ServiceModel model) {
		
			try {
				
				stmt=conn.prepareStatement("update service set sdate=?,charges=?,distance=? where sid=?");
				stmt.setString(1, model.getDate());
				stmt.setInt(2, model.getCharges());
				stmt.setString(3, model.getDistance());
				stmt.setInt(4,model.getId());
				int value=stmt.executeUpdate();
				//System.out.println(value);
				return value>0?true:false;
			}
			catch(Exception ex) {
				System.out.println("Error is "+ex);
				return false;
			
		}
	}
	public List<Object[]> getAllServiceDetails(List<Integer> sids) {
	    List<Object[]> services = new ArrayList<>();
	    try {
	        StringBuilder queryBuilder = new StringBuilder("SELECT s.sid, s.sdate, s.charges, s.distance, v.vname, v.noplate, p.pname, m.mname,v.vid FROM service s INNER JOIN spmjoin1 spm ON s.sid = spm.sid INNER JOIN vehicle v ON s.vid = v.vid INNER JOIN part p ON spm.pid = p.pid INNER JOIN mechanic m ON spm.mid = m.mid WHERE s.sid IN (");
	        for (int i = 0; i < sids.size(); i++) {
	            if (i > 0) {
	                queryBuilder.append(", ");
	            }
	            queryBuilder.append("?");
	        }
	        queryBuilder.append(")");

	        String query = queryBuilder.toString();
	        System.out.println("Query: " + query); // Log the generated query for debugging

	        stmt = conn.prepareStatement(query);

	        for (int i = 0; i < sids.size(); i++) {
	            stmt.setInt(i + 1, sids.get(i));
	        }

	        rs = stmt.executeQuery();

	        while (rs.next()) {
	            Object[] obj = new Object[]{
	                rs.getInt(1), 
	                rs.getString(2), 
	                rs.getInt(3),
	                rs.getString(4),
	                rs.getString(5), 
	                rs.getString(6), 
	                rs.getString(7), 
	                rs.getString(8) ,
	                rs.getInt(9)
	            };
	            services.add(obj);
	        }
	    } catch (SQLException ex) {
	        System.out.println("SQL Exception in getAllServiceDetails: " + ex.getMessage());
	        ex.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	        } catch (SQLException ex) {
	            System.out.println("Error closing resources: " + ex.getMessage());
	            ex.printStackTrace();
	        }
	    }
	    return services;
	}


	}

	
	


