package Task_04;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class FileNotFoundExample {
    public static void readFile(String filePath) throws FileNotFoundException {
        File file = new File(filePath);
        Scanner scanner = new Scanner(file);
        System.out.println("File found and opened successfully.");
        scanner.close();
    }

    public static void main(String[] args) {
        try {
            readFile("E:\\04_Java_Weekly_Task\\src\\Task_04\\ExceptionExample.java");
        } catch (FileNotFoundException e) {
            System.out.println("Error: File not found.");
        }
    }
}
