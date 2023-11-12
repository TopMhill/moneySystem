import java.sql.*;

public class opendb
{
private String DbName = "pubdb";
private String pass = "123456";
private String url = "";
private Connection con = null;
private Statement stmt = null;
private ResultSet rs = null;

public opendb()
{
//	BulidCon();
}

public void setDbName (String name)
{
this.DbName = name;
}
public void setPass (String pass)
{
this.pass = pass;
}

public void BulidCon()
{
try
{
    //Class.forName("com.mysql.jdbc.Driver");//����MySQL JDBC��������
    //Class.forName("org.git.mm.mysql.Driver");
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
url ="jdbc:mysql://hillweb.cn/"+DbName+"?user=user&password="+pass+"&useUnicode=true&characterEncoding=gb2312"+"&serverTimezone=UTC" +"&useSSL=false";
con= DriverManager.getConnection(url);
stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
}
catch (Exception e)
{

System.out.println(e.toString());
	System.out.println("ERROR0!!!!!");
}
}

public ResultSet executeQuery(String sql)
{
try
{
BulidCon();
rs = stmt.executeQuery(sql);
}
catch(Exception e)
{

	System.out.println("ERROR1!!!!!");
System.out.println(e.toString());
}
return rs;
}


public boolean executeUpdate(String sql)
{
try
{
BulidCon();
stmt.executeUpdate(sql);
//con.commit();
return true;
//con.commit();
}
catch (Exception e)
{

	System.out.println("ERROR2!!!!!"+sql);
	e.printStackTrace();
	return false;
}
}

public void close()
{
try
{
con.close();
stmt.close();
}
catch (SQLException e)
{

	System.out.println("ERROR3!!!!!");

}
}

}