package Task_04;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class NoPositiveNumbersAllowed {
    public static void readNumbers(String filePath) throws Exception {
        File file = new File(filePath);
        Scanner scanner = new Scanner(file);
        while (scanner.hasNextInt()) {
            int num = scanner.nextInt();
            if (num > 0) {
                throw new Exception("Error: Positive number found (" + num + ").");
            }
        }
        System.out.println("All numbers are non-positive.");
        scanner.close();
    }

    public static void main(String[] args) {
        try {
            readNumbers("numbers.txt");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
