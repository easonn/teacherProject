package cn.cuit.wlgc.exampleserver.common;

import cn.cuit.wlgc.exampleserver.controller.BasicController;
import cn.cuit.wlgc.exampleserver.controller.LessonController;
import cn.cuit.wlgc.exampleserver.controller.ScoreController;
import cn.cuit.wlgc.exampleserver.controller.TeacherController;
import cn.cuit.wlgc.exampleserver.controller.TestController;
import cn.cuit.wlgc.exampleserver.controller.TestPageController;
import cn.cuit.wlgc.exampleserver.model.Lesson;
import cn.cuit.wlgc.exampleserver.model.Profession;
import cn.cuit.wlgc.exampleserver.model.Score;
import cn.cuit.wlgc.exampleserver.model.Student;
import cn.cuit.wlgc.exampleserver.model.Teacher;
import cn.cuit.wlgc.exampleserver.model.TestModel;
import cn.cuit.wlgc.exampleserver.model.TestPage;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;

public class Config extends JFinalConfig {

    /**
     * 配置常量
     */
    public void configConstant(Constants me) {
        me.setError404View("./error/404.html");
        me.setError500View("./error/404.html");
        loadPropertyFile("mysqlConfig.properties");
        me.setDevMode(getPropertyToBoolean("devMode", true));
        me.setViewType(ViewType.JSP);
    }

    /**
     * 配置路由
     */
    public void configRoute(Routes me) {
        me.add("/teacher", TeacherController.class);
        me.add("lesson", LessonController.class);
        me.add("/test", TestController.class);
        me.add("/", BasicController.class);
        me.add("/testpage", TestPageController.class);
        me.add("/score", ScoreController.class);
    }

    public void configPlugin(Plugins me) {
        // 配置C3p0数据库连接池插件
        C3p0Plugin dsMysql = new C3p0Plugin(getProperty("jdbcUrl"),
                getProperty("user"), getProperty("password").trim());
        dsMysql.setMaxPoolSize(10);
        dsMysql.setInitialPoolSize(3);
        dsMysql.setMinPoolSize(3);
        me.add(dsMysql);
        // 配置ActiveRecord插件
        ActiveRecordPlugin arpMysql = new ActiveRecordPlugin(dsMysql);
        arpMysql.addMapping(Teacher.TABLE_NAME, "teacherId", Teacher.class);
        arpMysql.addMapping(Lesson.TABLE_NAME, "lessonId", Lesson.class);
        arpMysql.addMapping(Profession.TABLE_NAME, "professionId", Profession.class);
        arpMysql.addMapping(TestModel.TABLE_NAME, "testId", TestModel.class);
        arpMysql.addMapping(TestPage.TABLE_NAME, "pageId", TestPage.class);
        arpMysql.addMapping(Student.TABLE_NAME, "stuId", Student.class);
        arpMysql.addMapping(Score.TABLE_NAME, "scoreId", Score.class);
        arpMysql.setShowSql(true);
        me.add(arpMysql);
        // 缓存
        me.add(new EhCachePlugin());
    }

    /**
     * 配置全局拦截器
     */
    public void configInterceptor(Interceptors me) {

    }

    /**
     * 配置处理器
     */
    public void configHandler(Handlers me) {
        me.add(new ContextPathHandler("ctx_path"));
    }

    /**
     * 建议使用 JFinal 手册推荐的方式启动项目 运行此 main
     * 方法可以启动项目，此main方法可以放置在任意的Class类定义中，不一定要放于此
     */
    public static void main(String[] args) {
        JFinal.start("src/main/webapp", 80, "/", 5);

    }
}
