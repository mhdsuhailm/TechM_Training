package Task_04;

public class OddNumberExceptionExample {
    public static void checkEven(int num) throws Exception {
        if (num % 2 != 0) {
            throw new Exception("Error: Odd numbers are not allowed!");
        }
        System.out.println("Valid number: " + num);
    }
    public static void main(String[] args) {
        try {
            checkEven(7);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
