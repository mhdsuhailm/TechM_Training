package Fileread;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;

public class addingfile {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Choose an option:\n1. Create 3 files\n2. Create a directory with 3 files\n3. Create a directory with 4 files");
        int userChoice = scanner.nextInt();
        scanner.nextLine();

        switch (userChoice) {
            case 1:
                createFiles(".", 3);
                break;
            case 2:
                createDirectoryWithFiles("NewDir", 3);
                break;
            case 3:
                createDirectoryWithFiles("NewWorkspace", 4);
                break;
            default:
                System.out.println("Invalid choice!");
        }
        scanner.close();
    }

    public static void createFiles(String directoryPath, int numberOfFiles) {
        for (int i = 1; i <= numberOfFiles; i++) {
            File newFile = new File(directoryPath, "Document" + i + ".txt");
            try {
                if (newFile.createNewFile()) {
                    System.out.println("File created: " + newFile.getAbsolutePath());
                } else {
                    System.out.println("File already exists: " + newFile.getAbsolutePath());
                }
            } catch (IOException e) {
                System.out.println("Error while creating file: " + e.getMessage());
            }
        }
    }

    public static void createDirectoryWithFiles(String directoryName, int numberOfFiles) {
        File directory = new File(directoryName);
        if (!directory.exists()) {
            if (directory.mkdir()) {
                System.out.println("Directory created: " + directory.getAbsolutePath());
            } else {
                System.out.println("Failed to create directory.");
                return;
            }
        } else {
            System.out.println("Directory already exists: " + directory.getAbsolutePath());
        }
        createFiles(directoryName, numberOfFiles);
    }
}

