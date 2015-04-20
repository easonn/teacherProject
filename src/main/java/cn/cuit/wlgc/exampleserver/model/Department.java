package cn.cuit.wlgc.exampleserver.model;

public class Department extends Model<Department> {
    private static final String TEACHER_CACHE = "department";

    private static final String TABLE_NAME = "t_department";

    public static final Department DAO = new Department();

    private static final long serialVersionUID = 1L;

    public Department() {
        super(TEACHER_CACHE, TABLE_NAME);
    }
    
}
