package cn.cuit.wlgc.exampleserver.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Score extends Model<Score> {
    private static final String SCORE_CACHE = "scoreList";

    public static final String TABLE_NAME = "t_score";

    public static final Score DAO = new Score();

    private static final long serialVersionUID = 1L;

    public Score() {
        super(SCORE_CACHE, TABLE_NAME);
    }

    public Map<String, String> getAvg(String teacherId) {
        @SuppressWarnings("rawtypes")
        List<Score> scoreList = DAO
                .findByCache(
                        SCORE_CACHE,
                        SCORE_CACHE,
                        "select avg(score) as score,testName as stuName,count(score) as classId from t_score  WHERE teacherId = ? GROUP BY pageId ORDER BY date desc LIMIT 5 ",
                        teacherId);
        StringBuffer scoreAvg = new StringBuffer();
        StringBuffer scoreNumber = new StringBuffer();
        StringBuffer scoreName = new StringBuffer();
        for (Score model : scoreList) {
            // 保留2位小数
            float finalScore = (float) (Math.round(Float.parseFloat(model.get("score").toString())) * 100) / 100;
            scoreAvg.append(finalScore);
            scoreAvg.append(",");
            scoreNumber.append(Integer.parseInt(model.get("classId").toString()));
            scoreNumber.append(",");
            scoreName.append("'"+model.get("stuName", "课后练习").toString()+"'" + ",");
        }
        Map<String, String> scoreInfo = new HashMap<String, String>();
        scoreInfo.put("scoreAvg", scoreAvg.substring(0, scoreAvg.length() - 1));
        scoreInfo.put("scoreNumber",
                scoreNumber.substring(0, scoreNumber.length() - 1));
        scoreInfo.put("scoreName",
                scoreName.substring(0, scoreName.length() - 1));
        return scoreInfo;
    }
}
