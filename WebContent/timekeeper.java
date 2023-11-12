import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.io.FileWriter;
import java.io.IOException;


public class timekeeper {
    public static void main(String[] args) {
        String filename = "time.txt";//文件名

        while(true) {
            // 读取并打印初始系统时间
            LocalDateTime initialTime = LocalDateTime.now();

            try (FileWriter writer = new FileWriter(filename, false)) {
                writer.write(formatTime(initialTime));
                System.out.println("时间已成功写入文件！");
            } catch (IOException e) {
                System.out.println("时间写入文件时发生错误：" + e.getMessage());
            }

            // 1秒后更新系统时间
            try {
                Thread.sleep(1000); // 等待1秒
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            // 更新并打印当前系统时间
            LocalDateTime currentTime = LocalDateTime.now();

            try (FileWriter writer = new FileWriter(filename, false)) {
                writer.write(formatTime(initialTime));
                System.out.println("时间已成功写入文件！");
            } catch (IOException e) {
                System.out.println("时间写入文件时发生错误：" + e.getMessage());
            }

        }
    }

    // 格式化时间为字符串
    private static String formatTime(LocalDateTime time) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        return time.format(formatter);
    }
}