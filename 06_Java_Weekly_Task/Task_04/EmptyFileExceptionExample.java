package Task_04;

import java.io.File;
import java.io.FileNotFoundException;

public class EmptyFileExceptionExample {
    public static void checkFileEmpty(String filePath) throws Exception {
        File file = new File(filePath);
        if (!file.exists()) {
            throw new FileNotFoundException("Error: File does not exist.");
        }
        if (file.length() == 0) {
            throw new Exception("Error: File is empty.");
        }
        System.out.println("File is not empty.");
    }

    public static void main(String[] args) {
        try {
//            checkFileEmpty("empty.txt");
            checkFileEmpty("E:\\04_Java_Weekly_Task\\src\\Task_04\\EmptyFileExceptionExample.java");

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
