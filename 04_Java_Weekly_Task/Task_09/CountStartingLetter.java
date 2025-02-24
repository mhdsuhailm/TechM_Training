package Task_09;

import java.util.Arrays;
import java.util.List;

public class CountStartingLetter {
    public static void main(String[] args) {
        List<String> words = Arrays.asList("apple", "apricot", "banana", "avocado", "cherry");

        long count = words.stream().filter(word -> word.startsWith("a")).count();
        System.out.println("Number of words starting with 'a': " + count);
    }
}

