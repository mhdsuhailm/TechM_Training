package Fileread;

public class Fileopp {
    static void forSoprint() {
        System.out.print("hii ");
        System.out.print("i'm print ");

    }
    static void forsoprintln(){
        System.out.println("hii ");
        System.out.println("i'm println ");
    }
    public void forsoerr(){
        System.out.println("hii ");
        System.err.println("i'm error");
    }

    public static void main(String[] args) {
        forSoprint();
        forsoprintln();
        Fileopp obj = new Fileopp();
        obj.forsoerr();
    }
}
