package cn.cuit.wlgc.exampleserver.model;


public class TestPage extends Model<TestPage> {
    private static final String TESTPAGE_CACHE = "testPage";

    public static final String TABLE_NAME = "t_testpage";

    public static final TestPage DAO = new TestPage();

    private static final long serialVersionUID = 1L;

    public TestPage() {
        super(TESTPAGE_CACHE, TABLE_NAME);
    }

}