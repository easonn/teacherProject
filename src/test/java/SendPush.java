import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SendPush extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int ret = 0;
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String title = request.getParameter("title");
        String msg = request.getParameter("msg");
        String major = request.getParameter("majorName");
        String stuClass = request.getParameter("className");
        String alias = request.getParameter("selStuNos");
        JPushTest push = new JPushTest(msg, title);
        long msgId = 0;
        if (alias != null && !alias.equals("")) {
            String[] aliasArr = alias.split(",");
            Set<String> aliasSet = new HashSet<String>();
            for (String item : aliasArr) {
                aliasSet.add(item);
            }
            msgId = push.sendPushAlias(aliasSet);
        } else if (stuClass != null && !stuClass.equals("")) {
            msgId = push.sendPushTag(stuClass);
        } else if (major != null && !major.equals("")) {
            msgId = push.sendPushTag(major);
        } else {
            msgId = push.sendPushAll();
        }
        request.getRequestDispatcher("/push.jsp").forward(request, response);
    }
}