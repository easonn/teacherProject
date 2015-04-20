package cn.cuit.wlgc.exampleserver.model;

import java.util.List;

import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.IDataLoader;

public class Profession extends Model<Profession> {
    private static final String PROFESSION_CACHE = "profession";

    public static final String TABLE_NAME = "t_profession";

    public static final Profession DAO = new Profession();

    private static final long serialVersionUID = 1L;

    public Profession() {
        super(PROFESSION_CACHE, TABLE_NAME);
    }

    @SuppressWarnings("unchecked")
    public List<Profession> loadProfessionList(final String depId) {
        final String sql = "SELECT * FROM " + TABLE_NAME +" WHERE departmentId = ?";
        final String cacheName = PROFESSION_CACHE;
        try{
            return (List<Profession>) CacheKit.get(cacheName, depId, new IDataLoader() {
                public List<Profession> load() {
                    return findByCache(cacheName, depId, sql,depId);
                }
            });
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            return null;
        }

    }

    
}