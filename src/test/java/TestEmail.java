import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import cn.cuit.wlgc.exampleserver.tool.EmailSender;


public class TestEmail {

    public static void main(String[] args) {
        String host = "121.195.178.51";
        String from = "teacherproject@163.com";
        String to = "378935681@qq.com";//收件人必须是服务器里存在的帐户
        String subject = "密码找回";
        String content = "测试一下~";
        EmailSender sender = new EmailSender();
        
        try {
             sender.sendMail(to,content);
        } catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
