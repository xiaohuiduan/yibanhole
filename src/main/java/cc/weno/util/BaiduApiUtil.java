package cc.weno.util;

import cc.weno.staticMsg.BaiduApiMsg;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.annotation.JsonAlias;
import com.github.kevinsawicki.http.HttpRequest;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

/**
 * 获得百度token
 * @author xiaohiu
 */
public class BaiduApiUtil {

    /**
     * 获得百度Token
     * @return
     */
    public String getToken(){
        Map map = new HashMap(3);
        map.put("grant_type","client_credentials");
        map.put("client_id",BaiduApiMsg.API_KRY);
        map.put("client_secret",BaiduApiMsg.SECRET_KRY);
        HttpRequest request = HttpRequest.post(BaiduApiMsg.GET_TOKEN_URI,map,true);
        JSONObject jsonObject = JSONObject.parseObject(request.body());
        return jsonObject.getString("access_token");
    }


    /**
     * 获得数据
     * @param text
     * @return
     */
    public JSONObject getTextAnalyse(String text){

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("text",text);

        // 请求数据
        // BaiduApiMsg.TEXT_URI = https://aip.baidubce.com/rpc/2.0/nlp/v1/sentiment_classify?access_token=
        // BaiduApiMsg.BAIDU_TOKEN 就是token
        HttpRequest request = new HttpRequest(BaiduApiMsg.TEXT_URI+BaiduApiMsg.BAIDU_TOKEN,"POST");
        // 按照百度文档添加
        request.contentType("application/json", "GBK");
        // 发送数据
        request.send(jsonObject.toJSONString());
        String getResult = request.body();

        JSONObject preJson = JSONObject.parseObject(getResult);
        if(preJson.containsKey("error_code")){
            Integer erroCode = preJson.getInteger("error_code");
            if (erroCode==110 || erroCode== 111){
                BaiduApiMsg.BAIDU_TOKEN = getToken();
                return getTextAnalyse(text);
            }else {
                return null;
            }
        }else {
            JSONObject json = preJson.getJSONArray("items").getJSONObject(0);
            return json;
        }

    }

}
