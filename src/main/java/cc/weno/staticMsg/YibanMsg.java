package cc.weno.staticMsg;

/**
 * 易班的静态信息
 * @author xiaohiu
 */
public class YibanMsg {

    /**
     * 不允许出现魔法值
     */
    public static final String ACCESS_TOKEN = "access_token";


    /**
     * 易班AppID 在官方文档中代表appkey巨坑 凸(艹皿艹 )
     */
    public static final String APP_ID = "";

    /**
     * 易班AppSecret
     */
    public static final String APP_SECRET = "";

    /**
     * 回调地址
     */
    public static final String BACK_URL = "";
    /**
     * 使用GET重定向获得易班令牌code
     */
    public static final String GET_CODE_URL = "https://openapi.yiban.cn/oauth/authorize";

    /**
     * 获得易班token的URL
     */
    public static final String GET_TOKEN_URL = "https://openapi.yiban.cn/oauth/access_token";


    /**
     * 获得易班的信息
     */
    public static final String INFO_URL = "https://openapi.yiban.cn/user/me";


}
