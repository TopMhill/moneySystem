package person;
import java.sql.*;
import java.util.*;
import opendb.opendb;
public class person
{
	//int id;
	String name;
	String type;
	String mailing_address;
	String social_security_number;
	double standard_tax_deductions;
	double other_deductions;
	String phone_number;
	double hourly_rate,salary,commission_rate,hour_limit;
	String payment_method,state,vacation_time; 
	
	int id;
	String userType,maiadd;//该数据项其余人不需要处理
	
	public person(
			int id,
			String name,
			String type,
			String mailing_address,
			String social_security_number,
			double standard_tax_deductions,
			double other_deductions,
			String phone_number,
			double hourly_rate,
			double salary,
			double commission_rate,
			double hour_limit,
			String payment_method,
			String state,
			String vacation_time,
			String userType,
			String maiadd
			)
	{
		this.id=id;
		this.name=name;
		this.type=type;
		this.mailing_address=mailing_address;
		this.social_security_number=social_security_number;
		this.standard_tax_deductions=standard_tax_deductions;
		this.other_deductions=other_deductions;
		this.phone_number=phone_number;
		this.hourly_rate=hourly_rate;
		this.salary=salary;
		this.commission_rate=commission_rate;
		this.hour_limit=hour_limit;
		this.payment_method=payment_method;
		this.state=state;
		this.vacation_time=vacation_time;
		this.userType=userType;
		this.maiadd=maiadd;
		
	}
	public void renew() 
	{
		opendb workm=new opendb();
		String sql="select * from employee where name='"+name+"'";
		ResultSet rs=workm.executeQuery(sql);
		System.out.println(sql);
		try {
			rs.next();
			this.type=rs.getString("type");
		
		this.mailing_address=rs.getString("mailing_address");
		this.social_security_number=rs.getString("social_security_number");
		this.standard_tax_deductions=rs.getDouble("standard_tax_deductions");
		this.other_deductions=rs.getDouble("other_deductions");
		this.phone_number=rs.getString("phone_number");
		this.hourly_rate=rs.getDouble("hourly_rate");
		this.id=rs.getInt("id");
		this.salary=rs.getDouble("salary");
		this.commission_rate=rs.getDouble("commission_rate");
		this.payment_method=rs.getString("payment_method");
		this.hour_limit=rs.getDouble("hour_limit");
		this.state=rs.getString("state");
		this.vacation_time=rs.getString("vacation_time");
		rs.close();
		sql="select * from account_inf where account_number ='"+name+"'";
		rs=workm.executeQuery(sql);
		this.userType="employee";
		rs.next();
		this.maiadd=rs.getString("email_address");
		rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public person(int id,String name,String userType,String maiadd)
	{
		this.id=id;
		this.name=name;
		this.userType=userType;
		this.maiadd=maiadd;
	}
	public String getname()
	{
		return name;
	}
	public int getId()
	{
		return id;
	}
	public String gettype()
	{
		return type;
	}
	public String getuserType()
	{
		return userType;
	}
	public String getpayment_method()
	{
		return payment_method;
	}
	public String getphone()
	{
		return phone_number;
	}
	public String getvacation_time()
	{
		return vacation_time;
	}
	public double gettime_limit()
	{
		return hour_limit;
	}
};
