import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import org.junit.Test;

import cn.cuit.wlgc.exampleserver.model.Student;

public class BasicTest {

    @Test
    public void testDate() {
        String fprmatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
                .format(new Date());
        String date = DateFormat.getDateInstance().format(new Date());
        Calendar c = Calendar.getInstance();
        System.out.println(date);
        System.out.println(c.getTime());
        System.out.println(fprmatDate);
    }

    @Test
    public void testStrSub() {
        System.out.println("2011121072".substring(0, 7));
    }

    @Test
    public void inputStudent() {
        boolean check = true;
        try {
            String fileName = "F:\\cuitdata\\student\\xls\\wlgc2011.xls"; // Excel文件所在路径
            File file = new File(fileName); // 创建文件对象
            Workbook wb = Workbook.getWorkbook(file); // 从文件流中获取Excel工作区对象（WorkBook）
            Sheet sheet = wb.getSheet(0); // 从工作区中取得页（Sheet）
            for (int i = 0; i < sheet.getRows(); i++) { // 循环打印Excel表中的内容
                System.out.println("学号\t" + sheet.getCell(1, i).getContents()
                        + "\t姓名\t" + sheet.getCell(2, i).getContents());
                boolean t = Student.DAO
                        .set("stuId", sheet.getCell(1, i).getContents())
                        .set("stuName", sheet.getCell(2, i).getContents())
                        .set("professionId", "1028")
                        .set("professionName", "网络工程本科").save();
                check = check && t;
            }
        } catch (BiffException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
