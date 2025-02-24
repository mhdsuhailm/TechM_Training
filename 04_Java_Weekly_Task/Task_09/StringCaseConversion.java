package Task_09;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class StringCaseConversion {
    public static void main(String[] args) {
        List<String> names = Arrays.asList("apple", "banana", "cherry");

        List<String> upperCaseNames = names.stream().map(String::toUpperCase).collect(Collectors.toList());
        System.out.println("Uppercase: " + upperCaseNames);

        List<String> lowerCaseNames = names.stream().map(String::toLowerCase).collect(Collectors.toList());
        System.out.println("Lowercase: " + lowerCaseNames);
    }
}
