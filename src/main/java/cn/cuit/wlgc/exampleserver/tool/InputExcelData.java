package cn.cuit.wlgc.exampleserver.tool;

import java.io.File;
import java.io.IOException;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import cn.cuit.wlgc.exampleserver.model.Lesson;
import cn.cuit.wlgc.exampleserver.model.Student;

public class InputExcelData {
    public static boolean inputLesson(String profession, String proId) {
        boolean check = true;
        try {
            String fileName = "F:\\cuitdata\\lesson\\xls\\" + profession
                    + ".xls"; // Excel文件所在路径
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
                    lesson.set("professionId", proId);
                    boolean t = lesson.save();
                    check = check && t;
                    System.out.println(cell.getContents() + "\t" + year);
                }

            }
        } catch (BiffException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return check;
    }

    public static boolean inputStudent(String fileName, String professionName,
            String professionId) {
        boolean check = true;
        try {
            String fileNames = "F:\\cuitdata\\student\\xls\\" + fileName
                    + ".xls"; // Excel文件所在路径
            File file = new File(fileNames); // 创建文件对象
            Workbook wb = Workbook.getWorkbook(file); // 从文件流中获取Excel工作区对象（WorkBook）
            Sheet sheet = wb.getSheet(0); // 从工作区中取得页（Sheet）
            for (int i = 0; i < sheet.getRows(); i++) { // 循环打印Excel表中的内容
                System.out.println("学号\t" + sheet.getCell(1, i).getContents()
                        + "\t姓名\t" + sheet.getCell(2, i).getContents());
                boolean t = Student.DAO
                        .set("stuId", sheet.getCell(1, i).getContents())
                        .set("stuName", sheet.getCell(2, i).getContents())
                        .set("professionId", professionId)
                        .set("professionName", professionName).save();
                check = check && t;
            }
        } catch (BiffException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return check;
    }

}
