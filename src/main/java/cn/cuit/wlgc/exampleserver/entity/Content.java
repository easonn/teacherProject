package cn.cuit.wlgc.exampleserver.entity;

import cn.cuit.wlgc.exampleserver.model.TestModel;
import cn.cuit.wlgc.exampleserver.model.TestPage;

import com.jfinal.kit.JsonKit;

public class Content {
    private String message;
    private String title;
    private String[] tag;

    public Content(TestModel test, String stuClass, String lessonId) {
        String[] tags = { (stuClass != null) ? stuClass : "",
                (lessonId != null) ? lessonId : "" };
        this.tag = tags;
        this.title = "随堂测评";
        this.message = JsonKit.toJson(test);
    }

    public Content(TestPage test, String stuClass, String lessonId) {
        String[] tags = { (stuClass != null) ? stuClass : "",
                (lessonId != null) ? lessonId : "" };
        this.tag = tags;
        this.title = "课后作业";
        this.message = JsonKit.toJson(test);
    }
    

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String[] getTag() {
        return tag;
    }

    public void setTag(String[] tag) {
        this.tag = tag;
    }

}
