package cn.cuit.wlgc.exampleserver.controller;

import cn.cuit.wlgc.exampleserver.model.Student;

import com.google.gson.JsonObject;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;

public class StudentController extends Controller {

    public void login() {
        Student model = getModel(Student.class);
        Student stu = model.login();
        JsonObject json = new JsonObject();
        String status = "";
        String stuInfo = "";
        String msg = "";
        if (null != stu) {
            status = "1";
            stuInfo = JsonKit.toJson(stu);
            msg = "success-登陆成功";
        } else {
            status = "0";
            msg = "error-登陆失败,用户名密码错误";
        }
        json.addProperty("status", status);
        json.addProperty("stuInfo", stuInfo);
        json.addProperty("msg", msg);
        renderJson(json.toString());
    }
}
