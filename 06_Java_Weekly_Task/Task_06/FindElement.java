package Task_06;

import java.util.List;

class FindElement {
    public static <T> int findFirstIndex(List<T> list, T target) {
        return list.indexOf(target);
    }

    public static void main(String[] args) {
        List<String> names = List.of("Alice", "Bob", "Charlie", "Alice");
        System.out.println("Index of 'Alice': " + findFirstIndex(names, "Alice"));
        System.out.println("Index of 'Dave': " + findFirstIndex(names, "Dave"));
    }
}

