package Task_07;

import java.util.LinkedList;

public class FirstLastOccurrence {
    public static void main(String[] args) {
        LinkedList<String> words = new LinkedList<>();
        words.add("Java");
        words.add("Python");
        words.add("Java");
        words.add("C++");
        words.add("Python");

        System.out.println("LinkedList: " + words);

        System.out.println("First occurrence of 'Java': " + words.indexOf("Java"));
        System.out.println("Last occurrence of 'Python': " + words.lastIndexOf("Python"));
    }
}

