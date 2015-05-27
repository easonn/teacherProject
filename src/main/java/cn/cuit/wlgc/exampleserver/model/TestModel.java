package cn.cuit.wlgc.exampleserver.model;

import java.util.List;

import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.IDataLoader;

public class TestModel extends Model<TestModel> {
    private static final String TESTMODEL_CACHE = "testModelList";

    public static final String TABLE_NAME = "t_test";

    public static final TestModel DAO = new TestModel();

    private static final long serialVersionUID = 1L;

    public TestModel() {
        super(TESTMODEL_CACHE, TABLE_NAME);
    }

    @SuppressWarnings("unchecked")
    public List<TestModel> loadCacheTestList(final String teacherId) {
        final String sql = "SELECT * FROM " + TABLE_NAME
                + " WHERE teacherId = ?";
        final String cacheName = TESTMODEL_CACHE;
        return (List<TestModel>) CacheKit.get(cacheName, teacherId,
                new IDataLoader() {
                    public List<TestModel> load() {
                        return findByCache(cacheName, cacheName, sql, teacherId);
                    }
                });
    }

    @SuppressWarnings("unchecked")
    public List<TestModel> loadCacheTestListByLesson(final String lessonId) {
        final String sql = "SELECT * FROM " + TABLE_NAME
                + " WHERE lessonId = ?";
        final String cacheName = TESTMODEL_CACHE;
        return (List<TestModel>) CacheKit.get(cacheName, lessonId,
                new IDataLoader() {
                    public List<TestModel> load() {
                        return findByCache(cacheName, cacheName, sql, lessonId);
                    }
                });
    }

    public TestModel findInfoById(String testId) {
        String sql = "SELECT testTitle,testInfo,optionA,optionB,optionC,optionD,teacherName,testType,lessonName,lessonId,testCheck FROM "
                + TABLE_NAME + " WHERE testId = ?";
        return findFirst(sql, testId);
    }
}
