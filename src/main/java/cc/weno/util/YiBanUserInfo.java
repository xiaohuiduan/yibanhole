package cc.weno.util;

import cc.weno.pojo.YiBanUser;
import cc.weno.staticMsg.YibanMsg;
import com.alibaba.fastjson.JSONObject;
import com.github.kevinsawicki.http.HttpRequest;

import java.util.HashMap;
import java.util.Map;

/**
 * 获取易班信息
 * @author xiaohiu
 */
public class YiBanUserInfo {

    /**
     * 获得易班的nickName
     * @param token
     * @return
     */
    public String getMyName(String token){

        Map map = new HashMap();
        map.put("access_token",token);

        HttpRequest request = HttpRequest.get(YibanMsg.INFO_URL,map,true);
        JSONObject jsonObject = (JSONObject) JSONObject.parse(request.body());
        return jsonObject.getJSONObject("info").getString("yb_usernick");
    }
}
