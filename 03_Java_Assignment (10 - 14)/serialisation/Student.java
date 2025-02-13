package serialisation;

import java.io.Serializable;

class Student implements Serializable {
    Student(int rno, String name) {
        this.rno = rno;
        this.name = name;
    }

    int rno;
    String name;
}
