package cn.cuit.wlgc.exampleserver.controller;

import java.io.IOException;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Node;

import cn.cuit.wlgc.exampleserver.interceptor.TeacherInterceptor;
import cn.cuit.wlgc.exampleserver.model.Profession;
import cn.cuit.wlgc.exampleserver.model.Teacher;
import cn.cuit.wlgc.exampleserver.tool.InputExcelData;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.core.JFinal;

public class BasicController extends Controller {

    public void info() {
        StringBuffer sb = new StringBuffer();
        for (String url : JFinal.me().getAllActionKeys()) {
            sb.append(url+"<br/>");
        }
        renderHtml(sb.toString());
    }

    public void register() {
        renderJsp("./register.jsp");
    }

    public void login() {
        renderJsp("./login.jsp");
    }

    public void forgot() {
        renderJsp("./forgotpass.jsp");
    }

    @Before(TeacherInterceptor.class)
    public void lessons() {
        String teacherId = getSessionAttr("teacherId");
        Teacher teacher = Teacher.DAO.loadModel(teacherId);
        List<Profession> professionList = Profession.DAO
                .loadProfessionList(teacher.getStr("teacherDemNum"));
        setAttr("professionList", professionList);
        render("./lesson.jsp?id=1");
    }

    @Before(TeacherInterceptor.class)
    public void getPro() {
        String teacherId = getSessionAttr("teacherId");
        Teacher teacher = Teacher.DAO.loadModel(teacherId);
        List<Profession> professionList = Profession.DAO
                .loadProfessionList(teacher.getStr("teacherDemNum"));
        setAttr("professionList", professionList);
        render("./selectlesson.jsp?id=1");
    }

    @Before(TeacherInterceptor.class)
    public void index() throws IOException {
        // this.getSession().removeAttribute("cuitInfo");
        if (null == getSessionAttr("cuitInfo")) {
            Document doc = Jsoup.connect("http://www.cuit.edu.cn").get();
            doc.baseUri();
            List<Node> nodeList = doc.getElementById("New1").childNodes();
            for (Node node : nodeList) {
                String url = node.childNodes().get(1).attr("href");
                node.childNodes().get(1)
                        .attr("href", doc.baseUri() + "/" + url);
                node.absUrl("cuit");
            }
            String info = nodeList.toString().substring(1,
                    nodeList.toString().length() - 2);
            setSessionAttr("cuitInfo", info);
        }
        renderJsp("./index.jsp");
    }

    @Before(TeacherInterceptor.class)
    public void account() {
        String teacherId = getSessionAttr("teacherId");
        Teacher teacher = Teacher.DAO.loadModel(teacherId);
        setAttr("teacher", teacher);
        renderJsp("./account.jsp");
    }

    public void jpush() {
        renderJsp("./jpush.jsp");
    }

    public void inputlesson() {
        String profession = getPara("profession");
        String proId = getPara("proId");
        InputExcelData.inputLesson(profession, proId);
        render("./login.jsp");
    }

    public void inputStudent() {
        String fileName = getPara("fileName");
        String professionId = getPara("professionId");
        String professionName = getPara("professionName");
        InputExcelData.inputStudent(fileName, professionName, professionId);
        render("./login.jsp");
    }
}
