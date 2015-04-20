package cn.cuit.wlgc.exampleserver.controller;

import java.util.UUID;

import cn.cuit.wlgc.exampleserver.common.Constant;
import cn.cuit.wlgc.exampleserver.interceptor.TeacherInterceptor;
import cn.cuit.wlgc.exampleserver.model.Teacher;
import cn.cuit.wlgc.exampleserver.tool.StringMD5;
import cn.cuit.wlgc.exampleserver.tool.StringRandom;

import com.jfinal.plugin.ehcache.EvictInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.render.CaptchaRender;
import com.jfinal.plugin.ehcache.CacheName;

public class TeacherController extends Controller {

    private static final String RANDOM_CODE_KEY = "1";

    @Before(TeacherInterceptor.class)
    public void index() {
        renderText("test");
    }

    @Before(EvictInterceptor.class)
    @CacheName("testModelList")
    public void edit() {
        Teacher model = getModel(Teacher.class);
        Teacher teacher = model.load();
        boolean check = (null != teacher);
        String msg = "修改成功";
        String color = Constant.TCOLOR;
        model.remove("teacherPaassword");
        if (!check && !model.update()) {
            msg = "修改失败,密码错误";
            model = Teacher.DAO.loadModel(getSessionAttr("teacherId"));
            color = Constant.FCOLOR;
        }
        setAttr("msg", msg);
        setAttr("color", color);
        setAttr("teacher", model);
        renderJsp("../account.jsp");
    }

    public void save() {
        Teacher model = getModel(Teacher.class);
        boolean checkAccount = model.checkAccount();
        if (checkAccount) {
            String msg = "用户名已存在错误";
            setAttr("msg", msg);
            renderJsp("../register.jsp");
        }
        String[] teacherDem = model.getStr("teacherDem").split(":");
        model.set("teacherDemNum", teacherDem[0]);
        model.set("teacherDem", teacherDem[1]);
        String id = UUID.randomUUID().toString();
        model.set("teacherId", id);
        boolean check = model.set("teacherPaassword",
                StringMD5.getMD5(model.getStr("teacherPaassword").getBytes()))
                .save();
        if (check) {
            setSessionAttr("teacherId", model.getStr("teacherId"));
            redirect("/index");
        } else {
            String msg = "未知错误";
            setAttr("msg", msg);
            renderJsp("../register.jsp");
        }
    }

    public void editpass() {
        Teacher model = getModel(Teacher.class);
        boolean check = null != model.load();
        String msg = "修改成功";
        String color = Constant.TCOLOR;
        if (check) {
            model.set("teacherPaassword",
                    StringMD5.getMD5(getPara("pwd1").getBytes())).update();
        } else {
            msg = "修改失败,密码错误";
            color = Constant.FCOLOR;
        }
        setAttr("teacher", Teacher.DAO.loadModel(getSessionAttr("teacherId")));
        setAttr("msg", msg);
        setAttr("color", color);
        renderJsp("../account.jsp");

    }

    public void img() {
        CaptchaRender img = new CaptchaRender(RANDOM_CODE_KEY);
        render(img);
    }

    public void login() {
        String inputRandomCode = getPara("inputRandomCode");
        boolean loginSuccess = CaptchaRender.validate(this, inputRandomCode,
                RANDOM_CODE_KEY);
        if (!loginSuccess) {
            String msg = "验证码错误，请注意大小写";
            setAttr("msg", msg);
            renderJsp("../login.jsp");
        } else {
            Teacher model = getModel(Teacher.class);
            Teacher teacher = model.login();
            boolean check = null != teacher;
            if (check) {
                setSessionAttr("teacherName", teacher.getStr("teacherName"));
                setSessionAttr("teacherDem", teacher.getStr("teacherDem"));
                setSessionAttr("teacherId", teacher.getStr("teacherId"));
                setAttr("teacher", teacher);
                redirect("/index");
            } else {
                String msg = "账户名密码错误";
                setAttr("msg", msg);
                renderJsp("../login.jsp");
            }
        }
    }

    public void forgotpass() {
        Teacher model = getModel(Teacher.class);
        Teacher teacher = model.loadByEmail();
        boolean check = null != teacher;
        String msg = "用户名和注册邮箱不对应";
        String color = Constant.FCOLOR;
        if (check) {
            String passwd = StringRandom.getRandomString(8);
            try {
                new cn.cuit.wlgc.exampleserver.tool.EmailSender().sendMail(
                        teacher.getStr("teacherEmail"), passwd);
                teacher.set("teacherPaassword",
                        StringMD5.getMD5(passwd.getBytes()));
                teacher.update();
                msg = "密码重置邮件已发送,请注意查收,如没收到请检查您邮件的垃圾箱,请勿重复操作";
                color = Constant.TCOLOR;
            } catch (Exception ex) {
                msg = "邮件服务器异常,请联系管理员(18200390581)";
                System.out.println(ex.getMessage());
            }
        }
        setAttr("msg", msg);
        setAttr("color", color);
        renderJsp("../forgotpass.jsp");
    }
}
