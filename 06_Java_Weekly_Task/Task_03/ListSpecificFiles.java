package Task_03;

import java.io.File;
import java.io.FilenameFilter;

public class ListSpecificFiles {
    public static void main(String[] args) {
        File folder = new File("E:\\04_Java_Weekly_Task\\src\\Task_03");

        if (!folder.exists() || !folder.isDirectory()) {
            System.out.println("Directory does not exist or is not a valid directory.");
            return;
        }

        String extension = ".java";

        FilenameFilter filter = new FilenameFilter() {
            public boolean accept(File dir, String name) {
                return name.toLowerCase().endsWith(extension);
            }
        };

        File[] files = folder.listFiles(filter);

        if (files != null && files.length > 0) {
            System.out.println("Files with " + extension + " extension:");
            for (File file : files) {
                System.out.println(file.getName());
            }
        } else {
            System.out.println("No matching files found.");
        }
    }
}
