import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

public class MoneySystem
{

    public static String readTime()
    {
        String filePath = "time.txt";
        filePath="..\\..\\..\\time.txt";
        try {
            // 创建文件读取器
            FileReader fileReader = new FileReader(filePath);
            BufferedReader bufferedReader = new BufferedReader(fileReader);

            // 读取文件中的时间字符串
            String timeString = bufferedReader.readLine();
            while(timeString==null)
            {
                timeString=bufferedReader.readLine();
            }
            // 关闭文件读取器
            bufferedReader.close();

            // 输出读取到的时间字符串
            System.out.println("从文件中读取的时间字符串: " + timeString);

            return timeString;
        }
        catch (IOException e)
        {
           e.printStackTrace();
        }
        return null;
    }
    public static void main(String[]args)  {
        while (true)
        {
            String timestr=readTime();
            if(timestr==null)
            {
                System.out.println("Unknow Error!");
                continue;
            }
            //System.out.println(timestr);
            DateInfo time=new DateInfo(timestr);
            //System.out.println(time.getDayOfWeek());
            if(!time.is_monthend()&&!time.is_weekend())
            {
                continue;
            }
            else
            {
                if(time.is_monthend())
                    new Payroll().running(1);
                if(time.is_weekend())
                    new Payroll().running(2);
            }
        }
    }
}
