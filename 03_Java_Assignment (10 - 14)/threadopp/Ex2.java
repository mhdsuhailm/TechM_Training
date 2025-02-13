package threadopp;

public class Ex2 {
    public static void main(String[] args) {
        MT2Threadtwo myth2 = new MT2Threadtwo();
        Thread thread= new Thread(myth2);
        Thread thread1= new Thread(myth2);

        thread.start();
        thread1.start();

        myth2.run();
        Mt3 obj = new Mt3();
        obj.start();

    }
}
class MT2Threadtwo implements Runnable{
    public void run(){
        System.out.println("from thread2");
        System.out.println("from thread2");
//        System.out.println(10/0);

    }
}
class Mt3 extends Thread{
    public void run(){
        System.out.println("thread 0");
    }
}
