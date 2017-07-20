package utils;
import java.util.List;

import beans.Citizen;
import beans.Criminal;
public interface CriminalUtilsDAO {
	public List<Criminal> getMostWanted();
	public boolean registerCriminal(Criminal criminal);
}
