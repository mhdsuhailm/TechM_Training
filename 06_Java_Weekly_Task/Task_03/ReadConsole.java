package Task_03;

import java.util.Scanner;

public class ReadConsole {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter your name: ");
        String name = scanner.nextLine();

        System.out.println("Hello, " + name + "!");
        scanner.close();
    }
}

