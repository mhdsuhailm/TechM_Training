package serialisation;

import java.io.*;

public class Ex2 {
    static void serialisation() throws IOException {
        try {
            //Creating the object
            Employee s1 = new Employee(211, "ravi","ravi@gmail.com");
            //Creating stream and writing the object
            FileOutputStream fout = new FileOutputStream("f1.txt");
            ObjectOutputStream out = new ObjectOutputStream(fout);
            out.writeObject(s1);
            out.flush();
            //closing the stream
            out.close();
            System.out.println("success");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    static void deserialise() throws IOException {
        try {
            //Creating stream to read the object
            ObjectInputStream in = new ObjectInputStream(new FileInputStream("f1.txt"));
            Employee s = (Employee) in.readObject();
            //printing the data of the serialized object
            System.out.println(s.rno + " " + s.name+" "+s.email);
            //closing the stream
            in.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) throws IOException {
        serialisation();
        deserialise();
    }
}
