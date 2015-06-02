package cn.cuit.wlgc.exampleserver.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import cn.cuit.wlgc.exampleserver.model.Score;
import cn.cuit.wlgc.exampleserver.model.Student;

import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;

/**
 * @author Yin.Sheng yinsheng92@hotmail.com
 * @ClassName: ScoreController
 * @date 2015年4月15日 下午5:18:05
 *
 */
public class ScoreController extends Controller {

    public void shangchuan() {
        String stuId = getPara("stuId");
        double score = Double.parseDouble(getPara("score"));
        String pageId = getPara("pageId");
        String teacherId = getPara("teacherId");
        String testName = getPara("testName");
        Student stu = Student.DAO.findById(stuId);
        boolean check = Score.DAO.set("scoreId", UUID.randomUUID().toString())
                .set("score", score).set("teacherId", teacherId)
                .set("date", pageId.substring(0, 10)).set("testName", testName)
                .set("classId", stu.getStr("stuId").substring(0, 7))
                .set("stuId", stu.getStr("stuId"))
                .set("stuName", stu.getStr("stuName")).set("pageId", pageId)
                .set("professionId", stu.getStr("professionId"))
                .set("professionName", stu.getStr("professionName")).save();
        Map<String, Object> info = new HashMap<String, Object>();
        String msg = "提交成功";
        if (!check) {
            msg = "提交失败";
        }
        info.put("check", check);
        info.put("msg", msg);
        renderJson(JsonKit.toJson(info));
    }
}
