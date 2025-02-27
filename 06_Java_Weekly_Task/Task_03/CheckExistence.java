package Task_03;

import java.io.File;

public class CheckExistence {
    public static void main(String[] args) {
        File file = new File("E:\\04_Java_Weekly_Task\\src\\Task_03\\CheckExistence.java");

        if (file.exists()) {
            System.out.println("The Given File/Directory exists.");
        } else {
            System.out.println("The Given File/Directory does not exist.");
        }
    }
}

