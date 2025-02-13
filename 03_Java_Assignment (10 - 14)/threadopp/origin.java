package threadopp;

public class origin {
    public static void main(String[] args) {
        Mythread thread = new Mythread();
//        thread.start();
//        System.out.println(thread.isAlive());
        Thread myth = new Thread(thread);
        myth.start();

        System.out.println(myth.isAlive());
        System.out.println(myth.getName());
        Mythread1 thread1 = new Mythread1();
        thread1.start();
        Mythread1 thread2 = new Mythread1();
        thread2.start();
        System.out.println(thread1.isAlive());
        System.out.println(thread2.isAlive());
        System.out.println(thread1.getName());
        System.out.println(thread2.getName());
    }
}
