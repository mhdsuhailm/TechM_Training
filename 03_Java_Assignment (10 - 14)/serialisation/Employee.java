package serialisation;

import java.io.Serializable;

public class Employee implements Serializable {
    Employee(int rno, String name,String email) {
        this.rno = rno;
        this.name = name;
        this.email= email;
    }

    int rno;
    String name;
    transient String email;
}
