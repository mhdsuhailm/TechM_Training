package Fileread;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

public class aboutbufferreader {
    static void getInputUsingBufferedReaderClass() throws IOException {
        // Enter data using BufferReader
        BufferedReader r = new BufferedReader(new InputStreamReader(System.in));
        System.out.println("Enter the input:");
        // Reading data using readLine
        String s = r.readLine();

        // Printing the read line
        System.out.println("The given string input:" + s);

        int i = Integer.parseInt(r.readLine());
        System.out.println("the given int is:"+i);

        float f =Float.parseFloat(r.readLine());
        System.out.println("the given float input is:"+f);

    }

    public void getInputUsingScannerClass() {
        // Using Scanner for Getting Input from User
        Scanner s = new Scanner(System.in);
        System.out.println("Enter the input string :");
        String s1 = s.nextLine();
        System.out.println("You entered string " + s1);

        System.out.println("Enter the input integer :");
        int a = s.nextInt();
        System.out.println("You entered integer " + a);

        System.out.println("Enter the input float :");
        float b = s.nextFloat();
        System.out.println("You entered float " + b);
    }

    public static void main(String[] args) {

        try{
            aboutbufferreader.getInputUsingBufferedReaderClass();
        }catch (IOException e){
            System.out.println("the catch is"+e);
        }
        aboutbufferreader obj = new aboutbufferreader();
        obj.getInputUsingScannerClass();
    }
}
