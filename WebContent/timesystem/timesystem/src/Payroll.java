import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import static java.lang.Integer.parseInt;

public class Payroll
{
    Payroll()
    {
        mydb=new opendb();
    }
    private opendb mydb;
    public void delete_employee(String name)
    {
        String sql="update employee set state='finish' where name ='"+name+"'";
        mydb.executeUpdate(sql);
        mydb.close();
    }
    public double pay_employee(String name,DateInfo time) throws SQLException {
        String sql="select * from employee where name='"+name+"'";
        System.out.println(sql);
        ResultSet rs=mydb.executeQuery(sql);
        rs.next();
        if(rs.getString("state").equals("delete"))
        {
            delete_employee(name);
        }
        String type=rs.getString("type");
        String payment_method=rs.getString("payment_method");
        int state=0;
        if(payment_method.equals("bank"))
        {
            state=0;
        }
        else
        {
            state=1;
        }
        if(type.equals("salaried"))
        {
            double money=0;
            money=rs.getDouble("salary");
            System.out.println(money);
            double tax_rate=rs.getDouble("standard_tax_deductions");
            double other_money=rs.getDouble("other_deductions");
            money=money*(1-tax_rate)-other_money;
            if(money<0)money=0;
            sql="insert into payroll(employee_id,start_date,end_date,salary,state) values('"+rs.getInt("id")+
                    "','"+new DateInfo(time.get_lastmonthworkend()).calculatePreviousDate(-1).getString()+"','"+time.getString()+"','"+money+"','"+state+"'"+")";
            mydb.close();
            if(mydb.executeUpdate(sql))
            {
                mydb.close();
                return money;
            }
            else
            {
                mydb.close();
                return 0;
            }
        }
        else if(type.equals("hourly"))
        {
            double money=0;
            sql="select * from workcard_days a join worktimecard b on a.worktimecard_id=b.id "+
            "where b.employee_id='"+rs.getInt("id")
                    + "' and a.number_of_day>='"+time.get_lastweekend()+"' and a.number_of_day<'"+time.getString()+"'";
            ResultSet findrs=mydb.executeQuery(sql);
            //System.out.println(sql);
            double hours=0;
            Map<String,Double> dayofwork=new HashMap<String,Double>();
            while(findrs.next()) {
                double time_long = Double.parseDouble(findrs.getString("time_long"));
                String nowdate = findrs.getString("number_of_day");
                System.out.println(nowdate+" "+time_long);
                if (dayofwork.containsKey(nowdate)) {
                    double restime = dayofwork.get(nowdate);
                    time_long += restime;
                }
                dayofwork.remove(nowdate);
                dayofwork.put(nowdate, time_long);
            }
            for(Map.Entry<String,Double> awork:dayofwork.entrySet())
            {
                double allhour=awork.getValue();
                if(allhour>8)allhour=(allhour-8)*1.5+8;
                hours+=allhour;
            }
            //System.out.println(hours);
            double rate=rs.getDouble("hourly_rate");
            money=hours*rate;
            double tax_rate=rs.getDouble("standard_tax_deductions");
            double other_money=rs.getDouble("other_deductions");
            money=money*(1-tax_rate)-other_money;
            if(money<0)money=0;
            sql="insert into payroll(employee_id,start_date,end_date,salary,state) values('"+rs.getInt("id")+
                    "','"+time.get_lastweekend()+"','"+time.getString()+"','"+money+"','"+state+"')";
            mydb.close();
            if(mydb.executeUpdate(sql))
            {
                mydb.close();
                return money;
            }
            else
            {
                mydb.close();
                return 0;
            }

        }
        else if(type.equals("commissioned"))
        {
            double money=0;
            sql="select * from purchase_order where commissioned_employee_id='"+rs.getInt("id")+"'";
            ResultSet findrs=mydb.executeQuery(sql);
            double sum_money=0;
            while(findrs.next())
            {
                sum_money+=findrs.getDouble("money");
                sql="update purchase_order set state='submit' where id ='"+Integer.parseInt(findrs.getString("id"))+"'";
                System.out.println(sql);
                mydb.executeUpdate(sql);
                mydb.close();
            }
            money=sum_money*rs.getDouble("commission_rate");
            double tax_rate=rs.getDouble("standard_tax_deductions");
            double other_money=rs.getDouble("other_deductions");
            money=money*(1-tax_rate)-other_money;
            if(money<0)money=0;
            sql="insert into payroll(employee_id,start_date,end_date,salary,state) values('"+rs.getInt("id")+
                    "','"+new DateInfo(time.get_lastmonthworkend()).calculatePreviousDate(-1).getString()+"','"+time.getString()+"','"+money+"','"+state+"')";
            mydb.close();
            if(mydb.executeUpdate(sql))
            {
                mydb.close();
                return money;
            }
            else
            {
                mydb.close();
                return 0;
            }
        }
        return 0;
    }
    public void running(int type)  {

        String timeinput=MoneySystem.readTime();
        while(timeinput==null)
        {
            timeinput=MoneySystem.readTime();
        }
        DateInfo time=new DateInfo(timeinput);
        String thisday=time.getstr(8);
        for(int i=0;i<6;i++)thisday+="_";
        String sql=null;
        if(type==1) {
            sql = "select * from employee where (state = 'normal' or state ='delete' ) and (type='salaried' or type='commissioned') and id not in " +
                    "(select employee_id from payroll where end_date  like '" + thisday + "')";
        }
        else
        {
            sql = "select * from employee where (state='normal' or state='delete') and type='hourly' and id not in " +
                    "(select employee_id from payroll where end_date  like '" + thisday + "')";
        }
        ResultSet rs=mydb.executeQuery(sql);
        //System.out.println(sql);
        try {
            while (rs.next()) {
                String name = rs.getString("name");
                double money=pay_employee(name, time);
                if(money>0)
                {
                    String payment_method=rs.getString("payment_method");
                    if(payment_method.equals("bank"))
                    {
                        String bank_card=rs.getString("bank_id");
                        sql="select * from bank where bank_card='"+bank_card+"'";
                        ResultSet findrs=mydb.executeQuery(sql);
                        findrs.next();
                        double debitmoney=findrs.getDouble("money");
                        debitmoney+=money;
                        System.out.println(debitmoney);
                        mydb.close();
                        sql="update bank set money='"+debitmoney+"'where bank_card='"+bank_card+"'";
                        mydb.executeUpdate(sql);
                        mydb.close();
                    }
                }
            }
            rs.close();
        }
            catch (SQLException e) {
                throw new RuntimeException(e);
            }

        mydb.close();

    }
}
