package cn.cuit.wlgc.exampleserver.model;

import java.util.List;

import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.IDataLoader;

public class Lesson extends Model<Lesson> {
    private static final String LESSON_CACHE = "lessonList";

    public static final String TABLE_NAME = "t_lesson";

    public static final Lesson DAO = new Lesson();

    private static final long serialVersionUID = 1L;

    public Lesson() {
        super(LESSON_CACHE, TABLE_NAME);
    }

    @SuppressWarnings("unchecked")
    public List<Lesson> loadLessonList(final String professionId) {
        final String sql = "SELECT * FROM " + TABLE_NAME
                + " WHERE professionId = ?";
        final String cacheName = LESSON_CACHE;
        return (List<Lesson>) CacheKit.get(cacheName, professionId,
                new IDataLoader() {
                    public List<Lesson> load() {
                        return findByCache(cacheName, professionId, sql,
                                professionId);
                    }
                });
    }
}
