package serialisation;

import java.io.*;


public class Ex1 {
    public static void main(String[] args) throws IOException {
        serialisation();
        deserialise();
    }


    static void serialisation() throws IOException {
        try {
            //Creating the object
            Student s1 = new Student(211, "ravi");
            Student s2 = new Student(211, "ravi kumaar");
            //Creating stream and writing the object
            FileOutputStream fout = new FileOutputStream("f.txt");
            ObjectOutputStream out = new ObjectOutputStream(fout);
            out.writeObject(s1);
            out.writeObject(s2);


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
            ObjectInputStream in = new ObjectInputStream(new FileInputStream("f.txt"));
            Student s = (Student) in.readObject();
            Student s1 = (Student) in.readObject();
            //printing the data of the serialized object
            System.out.println(s.rno + " " + s.name);
            System.out.println(s1.rno + " " + s1.name);
            //closing the stream
            in.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}

