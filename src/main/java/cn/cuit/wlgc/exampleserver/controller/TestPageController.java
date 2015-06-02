package cn.cuit.wlgc.exampleserver.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.cuit.wlgc.exampleserver.model.TestModel;
import cn.cuit.wlgc.exampleserver.model.TestPage;

import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;

public class TestPageController extends Controller {

    public void downloadpage() {
        String pageId = getPara("pageId");
        TestPage testPageModel = TestPage.DAO.findById(pageId);
        String testStr = testPageModel.getStr("testStr");
        String[] testArray = testStr.split(";");
        Map<String, Object> testInfo = new HashMap<String, Object>();
        List<TestModel> testList = new ArrayList<TestModel>();
        for (String testId : testArray) {
            TestModel testModel = TestModel.DAO.findById(testId);
            testList.add(testModel);
        }
        String status = "F";
        String msg = "";
        if (testList.size() > 0) {
            status = "T";
            msg = testList.size() + "";
        } else {
            msg = "0";
        }
        testInfo.put("status", status);
        testInfo.put("msg", msg);
        testInfo.put("testInfo", testList);
        testInfo.put("testName", testPageModel.getStr("remark"));
        String jsonStr = JsonKit.toJson(testInfo);
        renderJson(jsonStr);
    }
}
