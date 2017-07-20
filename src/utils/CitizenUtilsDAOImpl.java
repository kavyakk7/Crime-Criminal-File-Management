package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import beans.Citizen;

public class CitizenUtilsDAOImpl implements CitizenUtilsDAO {
	Connection con = null;
	Statement stmt = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	ResultSet rs2 = null;

	@Override
	public boolean registerCitizen(Citizen citizen) {

		boolean isUserRegistered = false;
		con = DBUtils.getConnection("crime_info", "root", "");
		String sql = "insert into citizen(c_name,c_email,c_address,c_contact,c_password) values (?,?,?,?,?)";
		pst = DBUtils.getPreparedStatement(sql);

		try {
			pst.setString(1, citizen.getC_name());
			pst.setString(2, citizen.getC_email());
			pst.setString(3, citizen.getC_address());
			pst.setLong(4, citizen.getC_contact());
			pst.setString(5, citizen.getC_password());

			int rows = pst.executeUpdate();
			if (rows > 0)
				isUserRegistered = true;

			DBUtils.closeResources();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isUserRegistered;
	}

	@Override
	public Citizen login(String email, String pass) {
		Citizen citizen = null;
		con = DBUtils.getConnection("crime_info", "root", "");
		String sql = "select * from citizen where c_email = ? AND c_password = ?";
		pst = DBUtils.getPreparedStatement(sql);
		try {
			pst.setString(1, email);
			pst.setString(2, pass);
			rs = pst.executeQuery();
			if (rs.next()) {
				citizen = new Citizen();
				citizen.setC_id(rs.getInt("c_id"));
				citizen.setC_name(rs.getString("c_name"));
				citizen.setC_email(rs.getString("c_email"));
				citizen.setC_address(rs.getString("c_address"));
				citizen.setC_contact(rs.getLong("c_contact"));
				citizen.setC_password(rs.getString("c_password"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return citizen;
	}

}
