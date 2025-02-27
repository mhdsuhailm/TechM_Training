package Task_03;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.io.IOException;

public class ReadPlainTextFile {
    public static void main(String[] args) {
        try {
            String content = new String(Files.readAllBytes(Paths.get("E:\\04_Java_Weekly_Task\\src\\Task_03\\CheckExistence.java")));
            System.out.println(content);
        } catch (IOException e) {
            System.out.println("Error reading file.");
        }
    }
}
