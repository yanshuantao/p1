import java.sql.DriverManager;

import java.sql.Connection;


public class DbTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        try {
            Connection con = null; //定义一个MYSQL链接对象
            Class.forName("com.mysql.jdbc.Driver").newInstance(); //MYSQL驱动
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test", "test", "test"); //链接本地MYSQL
            System.out.print("yes");
        } catch (Exception e) {
            System.out.print("MYSQL ERROR:" + e.getMessage());
        }

	}

}
