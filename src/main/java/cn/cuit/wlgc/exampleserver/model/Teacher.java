package cn.cuit.wlgc.exampleserver.model;

import cn.cuit.wlgc.exampleserver.tool.StringMD5;

public class Teacher extends Model<Teacher> {
    private static final String TEACHER_CACHE = "teacher";

    public static final String TABLE_NAME = "t_teacher";

    public static final Teacher DAO = new Teacher();

    private static final long serialVersionUID = 1L;

    public Teacher() {
        super(TEACHER_CACHE, TABLE_NAME);
    }

    public Teacher login() {
        return this.findFirst("SELECT teacherId,teacherName,teacherEmail,teacherDem FROM "
                + TABLE_NAME
                + " WHERE  teacherAccount = ? AND teacherPaassword = ? ",
                getStr("teacherAccount"),
                StringMD5.getMD5(getStr("teacherPaassword").getBytes()));
    }
    public Teacher load() {
        return this.findFirst("SELECT teacherName,teacherId,teacherName,teacherEmail FROM "
                + TABLE_NAME
                + " WHERE  teacherId = ? AND teacherPaassword = ? ",
                getStr("teacherId"),
                StringMD5.getMD5(getStr("teacherPaassword").getBytes()));
    }

    public boolean checkAccount() {
        return null != findFirst(
                "SELECT teacherId FROM t_teacher WHERE teacherAccount = ?",
                getStr("teacherAccount"));
    }

    public Teacher loadByEmail() {
        return this.findFirst("SELECT * FROM " + TABLE_NAME
                + " WHERE  teacherEmail = ? AND teacherName = ? ",
                getStr("teacherEmail"), getStr("teacherName"));
    }
}
