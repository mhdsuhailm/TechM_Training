package collection.List;

import java.util.*;

public class Ex1 {
    public static void main(String[] args) {
        Arraylistthread arraylist = new Arraylistthread();
        Linkedlistthread linkedlist = new Linkedlistthread();
        Vectorthread vectorthread = new Vectorthread();
        Stackthread stackthread = new Stackthread();

        arraylist.start();
        linkedlist.start();
        vectorthread.start();
        stackthread.start();

    }
}
class Arraylistthread extends Thread{
    public void run(){
            List<Integer> list1 = new ArrayList<>();
            //System.out.println("Is list1 empty? "+list1.isEmpty());
            list1.add(1);
            list1.add(2);
            list1.add(3);
            list1.add(4);
            list1.add(5);
            list1.add(6);
            list1.add(49);
            list1.add(49);
            System.out.println("Is list1 empty? "+list1.isEmpty());
              System.out.println("The given list is:"+list1);
            System.out.println("Number of elements in the list: "+list1.size());
            //Adding one element
            list1.add(12);
            System.out.println("After adding one element:");
            System.out.println("The given list is :"+list1);
            System.out.println("The number of elements in the list: "+list1.size());
//Checking for an element
            System.out.println("Is 566 available in the list:"+list1.contains(566));
            System.out.println("The given list before removing elements is :"+list1);
    }
}
class Linkedlistthread extends Thread{
    public void run(){
        List<Integer> list1 = new LinkedList<>();
        //System.out.println("Is list1 empty? "+list1.isEmpty());
        list1.add(7);
        list1.add(8);
        list1.add(9);
        list1.add(10);
        list1.add(11);
        list1.add(12);
        list1.add(13);
        list1.add(49);
        list1.add(49);
        System.out.println("Is list1 empty? "+list1.isEmpty());
          System.out.println("The given list is:"+list1);
        System.out.println("Number of elements in the list: "+list1.size());
        //Adding one element
        list1.add(12);
        System.out.println("After adding one element:");
        System.out.println("The given list is :"+list1);
        System.out.println("The number of elements in the list: "+list1.size());
//Checking for an element
        System.out.println("Is 566 available in the list:"+list1.contains(566));
        System.out.println("The given list before removing elements is :"+list1);
    }
}
class Vectorthread extends Thread{
    public void run(){
        List<Integer> list1 = new Vector<>();
        //System.out.println("Is list1 empty? "+list1.isEmpty());
        list1.add(14);
        list1.add(15);
        list1.add(16);
        list1.add(17);
        list1.add(18);
        list1.add(19);
        list1.add(49);
        list1.add(49);
        System.out.println("Is list1 empty? "+list1.isEmpty());
          System.out.println("The given list is:"+list1);
        System.out.println("Number of elements in the list: "+list1.size());
        //Adding one element
        list1.add(12);
        System.out.println("After adding one element:");
        System.out.println("The given list is :"+list1);
        System.out.println("The number of elements in the list: "+list1.size());
//Checking for an element
        System.out.println("Is 566 available in the list:"+list1.contains(566));
        System.out.println("The given list before removing elements is :"+list1);
    }
}
class Stackthread extends Thread{
    public void run(){
        List<Integer> list1 = new Stack<>();
        //System.out.println("Is list1 empty? "+list1.isEmpty());
        list1.add(35);
        list1.add(23);
        list1.add(67);
        list1.add(82);
        list1.add(56);
        list1.add(49);
        list1.add(49);
        list1.add(49);
        //System.out.println("Is list1 empty? "+list1.isEmpty());
        //  System.out.println("The given list is:"+list1);
        System.out.println("Number of elements in the list: "+list1.size());
        //Adding one element
        list1.add(12);
        System.out.println("After adding one element:");
        System.out.println("The given list is :"+list1);
        System.out.println("The number of elements in the list: "+list1.size());
//Checking for an element
        System.out.println("Is 566 available in the list:"+list1.contains(566));
        System.out.println("The given list before removing elements is :"+list1);
    }
}
