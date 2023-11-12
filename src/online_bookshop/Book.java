
package online_bookshop;
import java.sql.*;
import opendb.opendb;
public class Book
{
	String bookname;
	String author;
	String bookid;
	float price;
	int quantity;

	public Book(String proid)
	{
		opendb mydb=new opendb();
		String sql="select BookName,Author,Price from book where bookid='"+proid+"'";
		System.out.println(sql);
		ResultSet rs=mydb.executeQuery(sql);
		try
		{
			rs.next();
			bookname=rs.getString("BookName");
			System.out.println(bookname);
			bookid=proid;
			author=rs.getString("Author");
			System.out.println(author);
			price=new Float (Float.parseFloat(rs.getString("Price")));
			System.out.println(price);	
			quantity=1;
			rs.close();
		}
		catch (SQLException e)
		{
			System.out.println("Database Error!");
		}
	}

	public String getbookname()
	{
		return bookname;
	}

	public String getauthor()
	{
		return author;
	}

	public String getbookid()
	{
		return bookid;
	}

	public float getPrice()
	{
		return price;
	}

	public void setQuantity(int q)
	{
		quantity=q;
	}
	public int getQuantity()
	{
		return quantity;
	}
};
