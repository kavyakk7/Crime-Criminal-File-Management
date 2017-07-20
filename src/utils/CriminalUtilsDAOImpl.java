package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.Criminal;

public class CriminalUtilsDAOImpl implements CriminalUtilsDAO {
	Connection con = null;
	Statement stmt = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	@Override
	public List<Criminal> getMostWanted() {
		List<Criminal> users = new ArrayList<Criminal>();
		Criminal user = null;
		con = DBUtils.getConnection("crime_info", "root", "");
		String sql = "select * from criminal";
		stmt = DBUtils.getStatement();
		try {
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				user = new Criminal();
				user.setCm_id(rs.getInt("cm_id"));
				user.setCm_name(rs.getString("cm_name"));
				user.setCm_age(rs.getInt("cm_age"));
				user.setCm_address(rs.getString("cm_address"));
				user.setCm_marks(rs.getString("cm_marks"));
				user.setCm_crimedetails(rs.getString("cm_crimedetails"));
				users.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;

		// return null;
	}

	public boolean registerCriminal(Criminal criminal) {
		boolean isUserRegistered = false;
		con = DBUtils.getConnection("crime_info", "root", "root");
		String sql = "insert into criminal(cm_name,cm_age,cm_address,cm_marks,cm_crimedetails) values (?,?,?,?,?)";
		pst = DBUtils.getPreparedStatement(sql);

		try {
			pst.setString(1, criminal.getCm_name());
			pst.setInt(2, criminal.getCm_age());
			pst.setString(3, criminal.getCm_address());
			pst.setString(4, criminal.getCm_marks());
			pst.setString(5, criminal.getCm_crimedetails());

			int rows = pst.executeUpdate();
			if (rows > 0)
				isUserRegistered = true;

			DBUtils.closeResources();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isUserRegistered;
	}

}
