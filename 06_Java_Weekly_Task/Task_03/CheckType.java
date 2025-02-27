package Task_03;

import java.io.File;

public class CheckType {
    public static void main(String[] args) {
        File file = new File("E:\\04_Java_Weekly_Task\\src\\Task_03\\CheckExistence.java");

        if (file.isDirectory()) {
            System.out.println("It is a directory.");
        } else if (file.isFile()) {
            System.out.println("It is a file.");
        } else {
            System.out.println("File or Directory does not exist.");
        }
    }
}
