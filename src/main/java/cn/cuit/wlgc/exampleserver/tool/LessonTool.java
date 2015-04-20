package cn.cuit.wlgc.exampleserver.tool;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.cuit.wlgc.exampleserver.model.Lesson;

public class LessonTool {

    public static Map<Integer, List<Lesson>> getlessonList(
            List<Lesson> lessonList) {
        Map<Integer, List<Lesson>> map = new HashMap<Integer, List<Lesson>>();
        List<Lesson> list = new ArrayList<Lesson>();
        for (int i = 0; i < lessonList.size(); i++) {
            if (i + 1 < lessonList.size()) {
                if (lessonList.get(i).getInt("lessonYear") != lessonList.get(
                        i + 1).getInt("lessonYear")) {
                    List<Lesson> listt = new ArrayList<Lesson>(list);
                    // remove会使listt数据丢失
                    // List<Lesson> listt = list; 引用list地址，list
                    map.put(lessonList.get(i).getInt("lessonYear"), listt);
                    list.removeAll(list);
                } else {
                    list.add(lessonList.get(i));
                }

            } else {
                if (lessonList.get(i).getInt("lessonYear") != lessonList.get(
                        i - 1).getInt("lessonYear")) {
                    list.removeAll(list);
                    list.add(lessonList.get(i));
                    map.put(lessonList.get(i).getInt("lessonYear"), list);
                } else {
                    list.add(lessonList.get(i));
                    map.put(lessonList.get(i).getInt("lessonYear"), list);
                }
            }

        }
        return map;
    }
}
