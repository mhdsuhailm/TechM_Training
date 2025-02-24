package Task_03;

import java.io.File;
import java.util.Date;

public class LastModifiedDate {
    public static void main(String[] args) {
        File file = new File("E:\\04_Java_Weekly_Task\\src\\Task_03\\CheckExistence.java");

        if (file.exists()) {
            System.out.println("Last Modified Date: " + new Date(file.lastModified()));
        } else {
            System.out.println("File does not exist.");
        }
    }
}
