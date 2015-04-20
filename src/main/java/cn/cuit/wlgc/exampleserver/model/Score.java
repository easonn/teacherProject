package cn.cuit.wlgc.exampleserver.model;

public class Score extends Model<Score> {
    private static final String SCORE_CACHE = "score";

    public static final String TABLE_NAME = "t_score";

    public static final Score DAO = new Score();

    private static final long serialVersionUID = 1L;

    public Score() {
        super(SCORE_CACHE, TABLE_NAME);
    }
}
