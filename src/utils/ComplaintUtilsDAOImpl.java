package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Citizen;
import beans.Complaint;

public class ComplaintUtilsDAOImpl implements ComplaintUtilsDAO {
	Connection con = null;
	Statement st = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	int rowCounts = 0;

	@Override
	public boolean addComplaint(Complaint complaint) {
		boolean complaintAdded = false;
		con = DBUtils.getConnection("crime_info", "root", "");
		String sql = "insert into complaint (case_id,comp_name,comp_details,comp_c_id,comp_status,comp_area) values (?,?,?,?,'pending',?)";
		pst = DBUtils.getPreparedStatement(sql);
		try {
			pst.setString(1, complaint.getComp_caseid());
			pst.setString(2, complaint.getComp_name());
			pst.setString(3, complaint.getComp_details());
			pst.setInt(4, complaint.getCityzn().getC_id());
			pst.setString(5, complaint.getComp_area());
			// pst.setString(4, complaint.getComp_status());

			rowCounts = pst.executeUpdate();
			if (rowCounts > 0)
				complaintAdded = true;

			DBUtils.closeResources();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return complaintAdded;
	}

	@Override
	public String getStatus_of_Complaint(int comp_c_id) {
		Complaint complaint = null;
		String status = "";
		con = DBUtils.getConnection("crime_info", "root", "root");
		String sql = "select * from complaint WHERE comp_c_id=" + comp_c_id;
		st = DBUtils.getStatement();
		try {
			rs = st.executeQuery(sql);
			while (rs.next()) {

				status = rs.getString("comp_status");

			}

			DBUtils.closeResources();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
		// return null;
	}

	public List<Complaint> getAllComplaints() {
		List<Complaint> students = new ArrayList<Complaint>();
		Complaint student = null;
		con = DBUtils.getConnection("crime_info", "root", "root");
		String sql = "select * from complaint";
		st = DBUtils.getStatement();
		try {
			rs = st.executeQuery(sql);
			while (rs.next()) {
				student = new Complaint();
				student.setComp_id(rs.getInt("comp_id"));
				student.setComp_name(rs.getString("comp_name"));
				student.setComp_details(rs.getString("comp_details"));
				int comp_c_id = rs.getInt("comp_c_id");
				Citizen c = new Citizen();
				c.setC_id(comp_c_id);
				student.setCityzn(c);
				// student.setDate_of_admission(rs.getDate("date_of_admission"));
				student.setComp_status(rs.getString("comp_status"));
				student.setComp_area(rs.getString("comp_area"));
				students.add(student);
			}

			DBUtils.closeResources();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return students;
	}

	public List<Complaint> getAllComplaintsbyArea(String comp_area) {
		List<Complaint> students = new ArrayList<Complaint>();
		Complaint student = null;
		con = DBUtils.getConnection("crime_info", "root", "root");
		String sql = "select * from complaint WHERE comp_area='" + comp_area + "'";
		st = DBUtils.getStatement();
		try {
			rs = st.executeQuery(sql);
			while (rs.next()) {
				student = new Complaint();
				student.setComp_id(rs.getInt("comp_id"));
				student.setComp_name(rs.getString("comp_name"));
				student.setComp_details(rs.getString("comp_details"));
				int comp_c_id = rs.getInt("comp_c_id");
				Citizen c = new Citizen();
				c.setC_id(comp_c_id);
				student.setCityzn(c);
				// student.setDate_of_admission(rs.getDate("date_of_admission"));
				student.setComp_status(rs.getString("comp_status"));
				student.setComp_area(rs.getString("comp_area"));
				student.setComp_date(rs.getTimestamp("complaint_date"));
				students.add(student);
			}

			DBUtils.closeResources();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return students;
	}
	
	public List<Complaint> getAllComplaintsbyAreaForDCP(String comp_area) {
		List<Complaint> students = new ArrayList<Complaint>();
		Complaint student = null;
		con = DBUtils.getConnection("crime_info", "root", "root");
		String area = "(";
		String sql1 = "select area from state_and_area WHERE state='" + comp_area + "'";
		st = DBUtils.getStatement();
		try {
			rs = st.executeQuery(sql1);
			while (rs.next()) {
				area +="'"+rs.getString(1)+"',";
			}
			area = area.substring(0, area.length()-1);
			area+=")";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("areas:"+area);
		System.out.println("state:"+comp_area);
		String sql = "select * from complaint WHERE comp_area in "+area;
		st = DBUtils.getStatement();
		try {
			rs = st.executeQuery(sql);
			while (rs.next()) {
				student = new Complaint();
				student.setComp_id(rs.getInt("comp_id"));
				student.setComp_name(rs.getString("comp_name"));
				student.setComp_details(rs.getString("comp_details"));
				int comp_c_id = rs.getInt("comp_c_id");
				Citizen c = new Citizen();
				c.setC_id(comp_c_id);
				student.setCityzn(c);
				// student.setDate_of_admission(rs.getDate("date_of_admission"));
				student.setComp_status(rs.getString("comp_status"));
				student.setComp_area(rs.getString("comp_area"));
				student.setComp_date(rs.getTimestamp("complaint_date"));
				students.add(student);
			}

			DBUtils.closeResources();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return students;
	}

	public List<Complaint> getAllComplaintsbyCID(int comp_cid) {
		List<Complaint> students = new ArrayList<Complaint>();
		Complaint student = null;
		con = DBUtils.getConnection("crime_info", "root", "root");
		String sql = "select * from complaint WHERE comp_c_id=" + comp_cid;
		st = DBUtils.getStatement();
		try {
			rs = st.executeQuery(sql);
			while (rs.next()) {
				student = new Complaint();
				student.setComp_id(rs.getInt("comp_id"));
				student.setComp_name(rs.getString("comp_name"));
				student.setComp_details(rs.getString("comp_details"));
				int comp_c_id = rs.getInt("comp_c_id");
				Citizen c = new Citizen();
				c.setC_id(comp_c_id);
				student.setCityzn(c);
				// student.setDate_of_admission(rs.getDate("date_of_admission"));
				student.setComp_status(rs.getString("comp_status"));
				student.setComp_area(rs.getString("comp_area"));
				students.add(student);
			}

			DBUtils.closeResources();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return students;
	}
	


}
