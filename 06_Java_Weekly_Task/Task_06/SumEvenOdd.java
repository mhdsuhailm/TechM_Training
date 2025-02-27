package Task_06;

import java.util.List;

class SumEvenOdd {
    public static <T extends Number> int sumEvenNumbers(List<T> numbers) {
        return numbers.stream().mapToInt(Number::intValue).filter(n -> n % 2 == 0).sum();
    }

    public static <T extends Number> int sumOddNumbers(List<T> numbers) {
        return numbers.stream().mapToInt(Number::intValue).filter(n -> n % 2 != 0).sum();
    }

    public static void main(String[] args) {
        List<Integer> numbers = List.of(1, 2, 3, 4, 5, 6);
        System.out.println("Sum of even numbers: " + sumEvenNumbers(numbers));
        System.out.println("Sum of odd numbers: " + sumOddNumbers(numbers));
    }
}
