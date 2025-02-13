package threadopp;

public class Ex1 {
    public static void main(String[] args) {//Thread 1
        System.out.println("From Main thread!");
        System.out.println("From Main thread!");
        System.out.println("From Main thread!");
        Mt1Thread1 t1 = new Mt1Thread1();
        t1.start();//calls run method-Thread 2
        System.out.println(t1.getName());
        //t1.run();
        Mt2Thread2 t2 = new Mt2Thread2();
        Thread tt2 = new Thread(t2);
        new Thread(t2).start();//Thread 3
        tt2.start();//Thread 4
        t2.run();

//        System.out.println(10 / 0);
    }}
        class Mt1Thread1 extends Thread {
            public void run() {
                System.out.println("From Mt1Thread1!" + this.getName());
                System.out.println("From Mt1Thread1!" + this.getName());
                System.out.println("From Mt1Thread1!" + this.getName());
                // System.out.println(10/0);
            }
        }
        class Mt2Thread2 implements Runnable {
            public void run() {
                System.out.println("From Mt1Thread2!");
//                System.out.println(10 / 0);
            }
        }
        class Thread3 extends Thread{
    public void run(){
        System.out.println("");
    }
        }


