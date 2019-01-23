package bean;
import java.sql.Connection;
import java.sql.DriverManager;

public class Dbcon {
	private static final String DRIVER_CLASS = "com.mysql.jdbc.Driver";
	private static final String DATABASE_URL =
		"jdbc:mysql://localhost:3306/chatroomdb?useUnicode=true&characterEncoding=UTF-8";
	private static final String DATABASE_USRE = "root";
	private static final String DATABASE_PASSWORD = "123456";
	// ∑µªÿ¡¨Ω”
	public static Connection getConnction() {
		Connection dbCon= null;
		try {
			Class.forName(DRIVER_CLASS);
			dbCon= DriverManager.getConnection(DATABASE_URL,
					DATABASE_USRE, DATABASE_PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dbCon;
	}
}
