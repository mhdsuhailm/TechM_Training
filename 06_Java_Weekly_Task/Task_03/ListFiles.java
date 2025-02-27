package Task_03;

import java.io.File;

public class ListFiles {
    public static void main(String[] args) {
        File folder = new File("E:\\04_Java_Weekly_Task");
        String[] files = folder.list();

        if (files != null) {
            for (String file : files) {
                System.out.println(file);
            }
        } else {
            System.out.println("The Given Directory does not exist or is empty.");
        }
    }
}
