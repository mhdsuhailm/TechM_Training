package Task_06;

import java.util.List;
import java.util.ArrayList;

class MergeLists {
    public static <T> List<T> mergeAlternating(List<T> list1, List<T> list2) {
        List<T> merged = new ArrayList<>();
        int size = Math.max(list1.size(), list2.size());

        for (int i = 0; i < size; i++) {
            if (i < list1.size()) merged.add(list1.get(i));
            if (i < list2.size()) merged.add(list2.get(i));
        }

        return merged;
    }

    public static void main(String[] args) {
        List<String> list1 = List.of("A", "B", "C");
        List<String> list2 = List.of("1", "2", "3", "4");

        System.out.println("Merged List: " + mergeAlternating(list1, list2));

    }
}
