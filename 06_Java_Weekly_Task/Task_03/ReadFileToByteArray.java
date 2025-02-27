package Task_03;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

public class ReadFileToByteArray {
    public static void main(String[] args) {
        File file = new File("E:\\04_Java_Weekly_Task\\src\\Task_03\\CheckExistence.java");

        try (FileInputStream fis = new FileInputStream(file)) {
            byte[] data = new byte[(int) file.length()];
            fis.read(data);
            System.out.println("File content (in bytes): " + new String(data));
        } catch (IOException e) {
            System.out.println("Error reading file.");
        }
    }
}
