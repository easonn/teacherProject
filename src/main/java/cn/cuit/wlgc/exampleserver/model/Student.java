package cn.cuit.wlgc.exampleserver.model;

public class Student extends Model<Student> {
    private static final String STUDENT_CACHE = "student";

    public static final String TABLE_NAME = "t_student";

    public static final Student DAO = new Student();

    private static final long serialVersionUID = 1L;

    public Student() {
        super(STUDENT_CACHE, TABLE_NAME);
    }

    public Student login() {
        String sql = "SELECT * FROM " + TABLE_NAME
                + " WHERE stuPass = ? AND stuId = ?";
        return this
                .findFirst(sql, this.getStr("stuPass"), this.getStr("stuId"));
    }
}
