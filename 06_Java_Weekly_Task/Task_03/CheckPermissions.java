package Task_03;

import java.io.File;

public class CheckPermissions {
    public static void main(String[] args) {
        File file = new File("E:\\04_Java_Weekly_Task\\src\\Task_03\\CheckExistence.java");

        System.out.println("Readable: " + file.canRead());
        System.out.println("Writable: " + file.canWrite());
    }
}
