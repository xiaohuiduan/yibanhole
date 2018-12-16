package cc.weno.pojo;

/**
 * 易班用户的信息
 * @author xiaohiu
 */
public class YiBanUser {

    private String token;

    private String userID;

    private String yiBanName;

    public String getYiBanName() {
        return yiBanName;
    }

    public void setYiBanName(String yiBanName) {
        this.yiBanName = yiBanName;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }


}
