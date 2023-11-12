import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

public class DateInfo {
    private Date date;
    private String dayOfWeek;
    private Calendar calendar;
    public DateInfo(String input) {
        try {
            SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
            this.date = inputDateFormat.parse(input);

            SimpleDateFormat dayFormat = new SimpleDateFormat("EEEE");
            this.dayOfWeek = dayFormat.format(date);

            calendar = Calendar.getInstance();
            calendar.setTime(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }
    public DateInfo(Date date)
    {
        SimpleDateFormat dayFormat = new SimpleDateFormat("EEEE");
        String dayOfWeek = dayFormat.format(date);
        this.date=date;
        this.dayOfWeek=dayOfWeek;
        this.calendar=Calendar.getInstance();
        calendar.setTime(date);
    }
    public DateInfo(Date date, String dayOfWeek) {
        this.date = date;
        this.dayOfWeek = dayOfWeek;
        calendar = Calendar.getInstance();
        calendar.setTime(date);
    }
    public static String formatDate(Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        return formatter.format(date);
    }
    public String getString()
    {
        return formatDate(this.date);
    }
    public Date getDate() {
        return date;
    }

    public String getDayOfWeek() {
        return dayOfWeek;
    }
    public int getYear()
    {
        return calendar.get(Calendar.YEAR);
    }
    public int getMonth()
    {
        return calendar.get(Calendar.MONTH)+1;
    }
    public int getDay()
    {
        return calendar.get(Calendar.DAY_OF_MONTH);
    }
    public int getHour()
    {
        return calendar.get(Calendar.HOUR_OF_DAY);
    }
    public int getMinute()
    {
        return calendar.get(Calendar.MINUTE);
    }
    public int getdayofweek()
    {
        return calendar.get(Calendar.DAY_OF_WEEK);
    }
    public DateInfo calculatePreviousDate(int n) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_YEAR, -n);
        return new DateInfo(calendar.getTime());
        //return calendar.getTime();
    }
    public String getstr(int num)
    {
        return getString().substring(0,num);
    }
    public boolean is_weekend()
    {
        if(true)return true;
        int day=calendar.get(Calendar.DAY_OF_WEEK);
        if(day==Calendar.FRIDAY)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public boolean is_monthend()
    {
        if(true)
        return true;
        int day1=this.getMonth();//=calendar.get(Calendar.DAY_OF_MONTH);
        DateInfo nextd=calculatePreviousDate(-1);
        int day2=nextd.getMonth();
        if(day1!=day2)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public boolean is_monthend(int value)
    {
        int day1=this.getMonth();//=calendar.get(Calendar.DAY_OF_MONTH);
        DateInfo nextd=calculatePreviousDate(-1);
        int day2=nextd.getMonth();
        if(day1!=day2)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public boolean is_monthworkend()
    {
        String nowdate=get_lastweekend();
        if(new DateInfo(nowdate).getString().equals(getString()))
        {
            return true;
        }
        else return false;
    }
    public String get_lastweekend()
    {
        String ans=calculatePreviousDate(7).getString();
        return ans;
    }
    public String get_lastmonthend()
    {
        DateInfo nowdate = calculatePreviousDate(31);
        while(nowdate.calculatePreviousDate(-1).getMonth()==nowdate.getMonth())
        {
            nowdate=nowdate.calculatePreviousDate(-1);
        }
        return nowdate.getString();
    }
    public String get_lastmonthworkend()
    {
        DateInfo nowdate=calculatePreviousDate(31);
        while(!nowdate.is_monthend(0)) {
            nowdate = nowdate.calculatePreviousDate(-1);
        }
        while(nowdate.getdayofweek()>Calendar.FRIDAY)
        {
            //System.out.println(nowdate.getdayofweek());
            nowdate=nowdate.calculatePreviousDate(1);
        }
        return nowdate.getString();
    }

    public static void main(String[] argc)
    {
        String timeinput=MoneySystem.readTime();
        DateInfo nowdate=new DateInfo(timeinput);
        System.out.println(nowdate.getDay());
        System.out.println(nowdate.is_monthend());
        System.out.println(nowdate.get_lastmonthworkend());
    }
}
