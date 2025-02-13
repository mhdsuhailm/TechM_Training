package collection.map;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

public class Mapopp {
    public static void main(String[] args) {
        HashMap<Integer, String> hm = new HashMap<>();
        Hashtable<Integer, String> hm1 = new Hashtable<>();
        hm.put(1, "one");
        hm.put(2, "two");
        hm.put(3, "three");
        System.out.println("Initial HashMap hm1 are : "
                + hm);
        hm.put(2, "For");
        System.out.println("Updated Map " + hm);
        hm.remove(1);
        System.out.println("Mappings after removal are : "
                + hm);
        System.out.println("Map traversal:");

        for (Map.Entry<Integer, String> e : hm.entrySet())
            System.out.println("Key: " + e.getKey()
                    + " Value: " + e.getValue());


        hm1.put(1, "one");
        hm1.put(2, "two");
        hm1.put(3, "three");
        System.out.println("Initial HashMap hm1 are : "
                + hm1);
        hm1.put(2, "For");
        System.out.println("Updated Map " + hm1);
        hm1.remove(1);
        System.out.println("Mappings after removal are : "
                + hm1);
        System.out.println("Map traversal:");

        for (Map.Entry<Integer, String> e : hm1.entrySet())
            System.out.println("Key: " + e.getKey()
                    + " Value: " + e.getValue());
    }
}
