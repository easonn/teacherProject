package cn.cuit.wlgc.exampleserver.enumModel;

public enum PageEnum {
    login("login"), index("index"), ;
    private final String value;
    PageEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
