package Time;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class getTime 
{
	public getTime(){}
	public static String nowtime()
	{
		String filename=getTime.class.getClassLoader().getResource("../../time.txt").getPath();
		System.out.println(filename);
		filename="D:\\sts-workbench\\online_bookshop\\time.txt";
		String cdate=null;
		try (BufferedReader br = new BufferedReader(new FileReader(filename))) {
            String line;
            while ((line = br.readLine()) != null) {
                cdate = line;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
		return cdate;
	}
}
