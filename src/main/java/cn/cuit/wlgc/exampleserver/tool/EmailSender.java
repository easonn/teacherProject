package cn.cuit.wlgc.exampleserver.tool;

import java.util.Properties;//类似于hashmap，提供键值对的集合

import javax.mail.*;
import javax.mail.internet.*;

public class EmailSender {
    private static final String HOST = "121.195.178.51";
    private static final String FROM = "teacherproject@163.com";
    private static final String PASS = "ys201015";
    private static final String SUBJECT = "Teacher平台密码重置服务";
    private static String head = "亲爱的用户：\n您已向系统申请取回密码服务,通行证的新密码如下：\n";
    private static String foot = "\n请尽快到系统网站,进行密码修改服务。\n【注意】本邮件为系统自动发送的邮件，请不要回复本邮件。";
    
    public void sendMail(String toEmail, String pass)
            throws AddressException, MessagingException {
        // 创建session
        Properties pro = new Properties();
        pro.put("mail.smtp.host", HOST);// 指定邮件服务器的ip地址
        // 下面这个第二个参数必须用字符串来设置为true，否则会报错
        pro.put("mail.smtp.auth", "true");// 验证发件人是否合法用户
        // 第二个参数的作用是：当邮件服务器需要认证的时候，会自动调用Authenticator里的getPasswordAuthentication()方法来取得用户名、密码信息
        Session se = Session.getDefaultInstance(pro, new auth());
        // 创建邮件消息
        MimeMessage msg = new MimeMessage(se);
        // 发件人
        msg.setFrom(new InternetAddress(FROM));
        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
        msg.setSubject(SUBJECT);
        msg.setText(head+pass+foot);
        // 连接到邮件服务器，并发送邮件
        Transport tran = se.getTransport("smtp");
        tran.connect();// 连接

        tran.sendMessage(msg, msg.getAllRecipients());
        tran.close();// 关闭连接
    }

    // 邮箱服务器需要认证的时候，需要写个类继承Authenticator这个抽象类
    public class auth extends Authenticator {
        // Authenticator中的唯一一个方法，作用是返回用来认证的用户名和密码
        public PasswordAuthentication getPasswordAuthentication() {
            // 此处的username,password对应你163邮箱的账号名称和密码
            return new PasswordAuthentication(FROM, PASS);
        }
    }
}
