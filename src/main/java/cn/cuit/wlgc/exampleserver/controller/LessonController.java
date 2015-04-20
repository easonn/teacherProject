package cn.cuit.wlgc.exampleserver.controller;

import java.util.List;
import java.util.Map;

import cn.cuit.wlgc.exampleserver.interceptor.TeacherInterceptor;
import cn.cuit.wlgc.exampleserver.model.Lesson;
import cn.cuit.wlgc.exampleserver.tool.LessonTool;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;

public class LessonController extends Controller {

    
    @Before(TeacherInterceptor.class)
    public void getList() {
        List<Lesson> lessonList = Lesson.DAO
                .loadLessonList(getPara("professionId"));
        Map<Integer, List<Lesson>> map = LessonTool.getlessonList(lessonList);
        String json = JsonKit.toJson(map);
        renderJson(json);
    }

    @Before(TeacherInterceptor.class)
    public void get() {
        Lesson lesson = Lesson.DAO.findById(getPara("lessonId"));
        setAttr("profession",getPara("proName"));
        setAttr("lesson", lesson);
        renderJsp("../test.jsp");
    }

}
