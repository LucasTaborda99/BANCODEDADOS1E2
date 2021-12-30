package finalprogram;
public class FinalProgram {
    public static void main(String[] args) {
        Video v[] = new Video[5];
        v[0] = new Video("How to learn OOP?");
        v[1] = new Video("How to learn English?");
        v[2] = new Video("How to learn Java?");
        v[3] = new Video("How to learn algorithms?");
        v[4] = new Video("How to learn anything?");

        Viewers vi[] = new Viewers[3];
        vi[0] = new Viewers("Lucas", 22, "M", "luc");
        vi[1] = new Viewers ("Maria", 20, "F", "ma");
        vi[2] = new Viewers ("João", 19, "M", "jhon");

        System.out.println(v[0].toString());
        System.out.println(v[1].toString());
        System.out.println(v[2].toString());
        System.out.println(v[3].toString());
        System.out.println(v[4].toString());
        System.out.println("-----------------------------------------"
 + "-------------------------------------------------------------------");
        System.out.println(vi[0].toString());
        System.out.println(vi[1].toString());
        System.out.println(vi[2].toString());
    }
}
