package cn.cuit.wlgc.exampleserver.model;

import java.util.List;

import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.IDataLoader;

@SuppressWarnings({ "rawtypes", "serial" })
public class Model<M extends com.jfinal.plugin.activerecord.Model> extends
        com.jfinal.plugin.activerecord.Model<M> {

    private String cacheNameForModel;
    private String tableName;

    public Model(String cacheNameForModel, String tableName) {
        this.cacheNameForModel = cacheNameForModel;
        this.tableName = tableName;
    }

    public Model(String tableName) {
        this.tableName = tableName;
    }

    @SuppressWarnings("unchecked")
    public M loadModel(String id) {
        final String ID = id;
        return (M) CacheKit.get(cacheNameForModel, ID, new IDataLoader() {
            public Object load() {
                return findById(ID);
            }
        });
    }

    @SuppressWarnings("unchecked")
    public List<M> loadCacheModelList() {
        final String sql = "select * from " + tableName;
        final String cacheName = cacheNameForModel;
        return (List<M>) CacheKit.get(cacheName, cacheName, new IDataLoader() {
            public List<M> load() {
                return findByCache(cacheName, cacheName, sql);
            }
        });
    }

    public List<M> loadModelList() {
        final String sql = "select * from " + tableName;
        return find(sql);
    }
}
