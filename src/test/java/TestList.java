import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

public class TestList {
    @Test
    public void testList() {
        List<Integer> list = new ArrayList<Integer>();
        list.add(1);
        list.add(1);
        list.add(1);
        list.add(1);
        list.add(1);
        list.add(1);
        list.removeAll(list);
        for (Integer i : list) {
            System.out.println(i);
        }
    }
}
