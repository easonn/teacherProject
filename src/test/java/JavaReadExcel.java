import java.io.File;
import java.io.IOException;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import org.junit.Test;

import cn.cuit.wlgc.exampleserver.model.Lesson;

public class JavaReadExcel {
    @Test
    public void test() {
        try {
            String fileName = "F:\\cuitdata\\xls\\wlgc.xls"; // Excel文件所在路径
            File file = new File(fileName); // 创建文件对象
            Workbook wb = Workbook.getWorkbook(file); // 从文件流中获取Excel工作区对象（WorkBook）
            Sheet sheet = wb.getSheet(0); // 从工作区中取得页（Sheet）
            int year = 0;
            for (int i = 0; i < sheet.getRows(); i++) { // 循环打印Excel表中的内容
                // for (int j = 0; j < sheet.getColumns(); j++) {
                if (sheet.getCell(1, i).getContents() == ""
                        && sheet.getCell(0, i).getContents() != "") {
                    year++;
                }
                if (sheet.getCell(1, i).getContents() != "") {
                    Cell cell = sheet.getCell(0, i);
                    Lesson lesson = new Lesson();
                    lesson.set("lessonName", cell.getContents());
                    lesson.set("lessonYear", year);
                    lesson.set("professionId", 1028);
                    lesson.save();
                    System.out.println(cell.getContents() + "\t" + year);
                }

            }
        } catch (BiffException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
