package org.CarGarage.Repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.CarGarage.Config.DBConfig;
import org.CarGarage.Model.BillModel;

public class BillRepositoryImpl extends DBConfig implements BillRepository {
	List<Object[]> list;
	public int isgetChargePrice(int sid) {
		try {
			stmt=conn.prepareStatement("select sum(p.price)+sum(s.charges) from service s inner join spmjoin1 spm on s.sid=spm.sid inner join part p on spm.pid=p.pid where spm.sid=?");
			
			stmt.setInt(1, sid);
			rs=stmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			else {
				return -1;
			}
		}
		catch(Exception ex) {
			System.out.println("Exception occure in isgetChargePrice method in billRepository"+ex);
			
		}
		return 0;
	}
	public int isSetVehicle(int vid) {
		try {
			stmt=conn.prepareStatement("select max(sid) from Service where vid=?");
			stmt.setInt(1, vid);
			rs=stmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			else {
				return -1;
			}
		}
		catch(Exception ex) {
			System.out.println("Exception occure in isSetVehicle Method in billRepository "+ex);
			return 0;
		}
		
	}
	public boolean isAddBill(BillModel bmodel,int sid,int vid) {
		try {
			int amount=this.isgetChargePrice(vid);
			int sid1=this.isSetVehicle(sid);
			stmt=conn.prepareStatement("insert into bill value('0',?,?,?)");
			stmt.setInt(1, amount);
			stmt.setString(2, bmodel.getBdate());
			stmt.setInt(3, sid1);
			return stmt.executeUpdate()>0?true:false;
		}
		catch(Exception ex) {
			System.out.println("Error is AddBill repository is"+ex);
			return false;
		}
	}
	public List<Object[]> getAllInfo() {
		try {
			list=new ArrayList<Object[]>();
			stmt=conn.prepareStatement("select c.cname,c.contact,c.email,v.vname,v.noplate,b.bdate,s.sdate,b.amount,b.bid from vehicle v inner join service s on v.vid=s.vid inner join bill b on s.sid=b.sid inner join customer c on v.cid=c.cid;");
			rs=stmt.executeQuery();
			while(rs.next()) {
				Object []obj=new Object[] {rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getInt(8),rs.getInt(9)};
				list.add(obj);
			}
			return list.size()>0?list:null;
		}catch(Exception ex) {
			System.out.println("Error is"+ex);
			return null;
		}
	}
	public List<Object[]> getAllInfoPart(int bid) {
		try {
			list=new ArrayList<Object[]>();
			stmt=conn.prepareStatement(" select c.cname,c.contact,c.email,p.pname,p.price,s.charges,v.vname,v.noplate,b.bid from part p inner join spmjoin1 spm on p.pid=spm.pid inner join service s on spm.sid=s.sid inner join vehicle v on s.vid=v.vid inner join customer c on v.cid=c.cid inner join bill b on s.sid=b.sid where b.bid=?;");
			stmt.setInt(1, bid);
			rs=stmt.executeQuery();
			while(rs.next()) {
				Object []obj=new Object[] {rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getInt(6),rs.getString(7),rs.getString(8),rs.getInt(9)};
				list.add(obj);
			}
			return list.size()>0?list:null;
		}catch(Exception ex) {
			System.out.println("Error is"+ex);
			return null;
		}
	}
	public List<Object[]> getAllInfoC(int bid) {
		try {
			list=new ArrayList<Object[]>();
			stmt=conn.prepareStatement("select c.cname,c.contact,c.email,v.vname,v.noplate,b.amount from customer c inner join vehicle v on c.cid=v.cid inner join service s on v.vid=s.vid inner join bill b on s.sid=b.sid where b.bid=?;");
			stmt.setInt(1, bid);
			rs=stmt.executeQuery();
			while(rs.next()) {
				Object []obj=new Object[] {rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6)};
				list.add(obj);
			}
			return list.size()>0?list:null;
		}catch(Exception ex) {
			System.out.println("Error is"+ex);
			return null;
		}
	}
	public boolean isDelBillById(int bid) {
		try {
			stmt=conn.prepareStatement("delete from bill where bid=?");
			stmt.setInt(1, bid);
			int value=stmt.executeUpdate();
		
			return value>0?true:false;
		}
		catch(Exception ex) {
			System.out.println("Error is"+ex);
		}
		return false;
	}
	
	
}
