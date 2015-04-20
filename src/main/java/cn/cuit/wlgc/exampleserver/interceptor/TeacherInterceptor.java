package cn.cuit.wlgc.exampleserver.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import com.jfinal.kit.StrKit;

/**
 * @author Yin.Sheng yinsheng92@hotmail.com
 * @ClassName: TeacherInterceptor
 * @date 2015年3月29日 下午8:18:30
 *
 */
public class TeacherInterceptor implements Interceptor {
    public void intercept(ActionInvocation ai) {
        Controller controller = ai.getController();
        String check = controller.getSessionAttr("teacherId");
        if (StrKit.notBlank(check)) {
            ai.invoke();
        } else {
            controller.setAttr("msg", "需要登陆");
            controller.render("login.jsp");
        }
    }
}
