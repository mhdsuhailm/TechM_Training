package Task_10;

class BankAccount {
    private int balance = 0;

    public synchronized void deposit(int amount) {
        balance += amount;
        System.out.println("Deposited: " + amount);
        notify();
    }

    public synchronized void withdraw(int amount) {
        while (balance < amount) {
            try {
                System.out.println("Waiting for deposit....!");
                wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        balance -= amount;
        System.out.println("Withdrawn: " + amount);
    }
}

public class InterThreadCommunication {
    public static void main(String[] args) {
        BankAccount account = new BankAccount();

        new Thread(() -> account.withdraw(1000)).start();
        new Thread(() -> account.deposit(1500)).start();
    }
}
