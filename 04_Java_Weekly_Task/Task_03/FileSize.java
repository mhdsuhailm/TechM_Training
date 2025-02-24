package Task_03;

import java.io.File;

public class FileSize {
    public static void main(String[] args) {
        File file = new File("E:\\04_Java_Weekly_Task\\src\\Task_03\\CheckExistence.java");

        if (file.exists()) {
            long bytes = file.length();
            double kilobytes = bytes / 1024.0;
            double megabytes = kilobytes / 1024.0;

            System.out.println("File Size in Bytes: " + bytes);
            System.out.println("File Size in KB: " + kilobytes);
            System.out.println("File Size in MB: " + megabytes);
        } else {
            System.out.println("The Given File does not exist.");
        }
    }
}
