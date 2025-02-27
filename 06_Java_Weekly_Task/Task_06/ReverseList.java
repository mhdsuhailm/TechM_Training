package Task_06;

import java.util.List;
import java.util.Collections;
import java.util.ArrayList;

class ReverseList {
    public static <T> List<T> reverseList(List<T> list) {
        List<T> reversed = new ArrayList<>(list);
        Collections.reverse(reversed);
        return reversed;
    }

    public static void main(String[] args) {
        List<Integer> numbers = List.of(1, 2, 3, 4);
        System.out.println("Reversed list: " + reverseList(numbers));
    }
}
