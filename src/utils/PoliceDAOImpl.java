package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import beans.Complaint;
import beans.Police;

public class PoliceDAOImpl implements PoliceDAO {
	Connection con = null;
	Statement stmt = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	// private String name;

	public boolean signUp(Police police) {
		boolean isPoliceRegistered = false;
		con = DBUtils.getConnection("crime_info", "root", "");
		String sql = "insert into police values (?,?,?,?,?,?)";
		pst = DBUtils.getPreparedStatement(sql);

		try {
			pst.setInt(1, police.getPs_id());
			pst.setString(2, police.getPs_name());
			pst.setString(3, police.getPs_location());
			pst.setString(4, police.getPs_password());
			int rows = pst.executeUpdate();
			if (rows > 0)
				isPoliceRegistered = true;

			DBUtils.closeResources();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isPoliceRegistered;
	}

	public Police login(String email, String pass) {
		Police police = null;
		con = DBUtils.getConnection("crime_info", "root", "root");
		String sql = "select * from police where ps_name = ? AND ps_password = ?";
		pst = DBUtils.getPreparedStatement(sql);
		try {
			pst.setString(1, email);
			pst.setString(2, pass);
			rs = pst.executeQuery();
			if (rs.next()) {
				police = new Police();
				police.setPs_id(rs.getInt("ps_id"));
				police.setPs_name(rs.getString("ps_name"));
				police.setPs_password(rs.getString("ps_password"));
				police.setPs_location(rs.getString("ps_location"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return police;
	}

	public boolean UpdateStatus_of_Complaint(int comp_id) {
		boolean statusUpdated = false;
		Complaint complaint = null;
		con = DBUtils.getConnection("crime_info", "root", "");
		String sql = "update complaint SET comp_status='SOLVED' WHERE comp_id=" + comp_id;
		stmt = DBUtils.getStatement();
		int rows = 0;
		try {
			rows = stmt.executeUpdate(sql);

			if (rows > 0)
				statusUpdated = true;

			DBUtils.closeResources();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return statusUpdated;
	}
	
	public boolean Assign_caseTopolice(String address, String case_id) {
		boolean statusUpdated = false;
		String state = null;
		Police police = null;
		con = DBUtils.getConnection("crime_info", "root", "");
		String sql = "select state from state_and_area where area = ?";
		pst = DBUtils.getPreparedStatement(sql);
		try {
			pst.setString(1, address);
			rs = pst.executeQuery();
			if (rs.next()) {
				state=rs.getString(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		String sql1 = "UPDATE police SET case_id = CONCAT(if(case_id is null ,'"+case_id+"', '"+case_id+",')) WHERE ps_location='"+state+"' and ps_rank='Deputy Commissioner of Police'";
		stmt = DBUtils.getStatement();
		int rows = 0;
		try {
			rows = stmt.executeUpdate(sql1);

			if (rows > 0)
				statusUpdated = true;

			DBUtils.closeResources();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return statusUpdated;
	
	}
	
	public boolean PoliceAssign_caseTopolice(String ps_name, String case_id) {
		boolean statusUpdated = false;
		Police police = null;
		con = DBUtils.getConnection("crime_info", "root", "root");
		String sql = "UPDATE police SET case_assigned = CONCAT(if(case_assigned is null ,'"+case_id+"', '"+case_id+",')) WHERE ps_name='"+ps_name+"'";
		stmt = DBUtils.getStatement();
		int rows = 0;
		try {
			rows = stmt.executeUpdate(sql);

			if (rows > 0)
				statusUpdated = true;

			DBUtils.closeResources();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return statusUpdated;
	
	}
}