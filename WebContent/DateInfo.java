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
        return calendar.get(Calendar.MONTH);
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
    public DateInfo calculatePreviousDate(int n) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_YEAR, -n);
        return new DateInfo(calendar.getTime());
        //return calendar.getTime();
    }

}
