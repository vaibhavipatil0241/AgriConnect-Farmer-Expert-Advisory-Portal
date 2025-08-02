package r3sys.com;

public class ExpertGetSet {
    private static int e_id;

    public static int getId() {
        return e_id;
    }

    public static void setEid(int e_id) {
        ExpertGetSet.e_id = e_id;
    }
}

