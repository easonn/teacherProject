package cn.cuit.wlgc.exampleserver.controller;

import java.util.ArrayList;
import java.util.List;

import cn.cuit.wlgc.exampleserver.entity.Content;
import cn.cuit.wlgc.exampleserver.interceptor.TeacherInterceptor;
import cn.cuit.wlgc.exampleserver.model.Teacher;
import cn.cuit.wlgc.exampleserver.model.TestModel;
import cn.cuit.wlgc.exampleserver.model.TestPage;
import cn.cuit.wlgc.exampleserver.tool.BasicTools;
import cn.cuit.wlgc.exampleserver.tool.JPushTool;
import cn.cuit.wlgc.exampleserver.tool.StringRandom;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheName;
import com.jfinal.plugin.ehcache.EvictInterceptor;

@Before(TeacherInterceptor.class)
public class TestController extends Controller {

    public void save() {
        TestModel model = getModel(TestModel.class);
        String teacherId = getSessionAttr("teacherId");
        String teacherName = Teacher.DAO.loadModel(teacherId).getStr(
                "teacherName");
        model.set("teacherName", teacherName);
        model.set("teacherId", teacherId);
        model.set("testCheck", "T");
        model.save();
        redirect("/test/getLists");
    }

    @Before(EvictInterceptor.class)
    @CacheName("testModelList")
    public void del() {
        String testId = getPara("testId");
        boolean check = TestModel.DAO.deleteById(testId);
        if (check) {
            redirect("/test/getLists");
        }
    }

    @Before(EvictInterceptor.class)
    @CacheName("testModelList")
    public void getListsByLesson() {
        String lessonId = getPara("lessonId");
        List<TestModel> testList = TestModel.DAO
                .loadCacheTestListByLesson(lessonId);
        setAttr("testList", testList);
        setAttr("check", 1);
        renderJsp("../selectlesson.jsp");
    }

    @Before(EvictInterceptor.class)
    @CacheName("testModelList")
    public void getLists() {
        String teacherId = getSessionAttr("teacherId");
        List<TestModel> testList = TestModel.DAO.loadCacheTestList(teacherId);
        setAttr("testList", testList);
        renderJsp("../testmanage.jsp");
    }

    public void pushCloud() {
        Content content = null;
        String stuClass = getPara("stuClass");
        String lessonId = getPara("lessonId");
        List<TestModel> testList = getSessionAttr("testModelList");
        if (null == testList) {
            renderText("error");
            return;
        }
        if (testList.size() == 1) {
            content = new Content(testList.get(0), stuClass, lessonId);
        } else {
            StringBuffer testInfo = new StringBuffer();
            for (TestModel test : testList) {
                testInfo.append(test.getInt("testId") + ";");
            }
            String testInfoStr = testInfo.substring(0, testInfo.length() - 1);
            TestPage testpage = new TestPage();
            String date = BasicTools.getDate();
            testpage.set("pageId", date + StringRandom.getRandomString(3));
            testpage.set("teacherId", getSessionAttr("teacherId"));
            testpage.set("teacherName", getSessionAttr("teacherName"));
            testpage.set("cdatetime", BasicTools.getTime());
            testpage.set("testStr", testInfoStr);
            testpage.set("testCheck", "F");
            testpage.save();
            content = new Content(testpage, stuClass, lessonId);
        }
        JPushTool.sendMessage(content);
        getSession().removeAttribute("testModelList");
        redirect("/test/getLists");
    }

    public void get() {
        TestModel test = TestModel.DAO.findById(getPara("testId"));
        List<TestModel> testList = getSessionAttr("testModelList");
        if (null == testList) {
            testList = new ArrayList<TestModel>();
        }
        testList.add(test);
        setSessionAttr("testModelList", testList);
        setSessionAttr("test", test);
        redirect("/jpush");
    }
}
