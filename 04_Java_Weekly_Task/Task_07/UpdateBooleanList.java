package Task_07;

import java.util.ArrayList;

public class UpdateBooleanList {
    public static void main(String[] args) {
        ArrayList<Boolean> flags = new ArrayList<>();
        flags.add(true);
        flags.add(false);
        flags.add(true);
        flags.add(false);

        System.out.println("Before Update: " + flags);

        flags.set(2, false);
        System.out.println("After Update: " + flags);
    }
}
