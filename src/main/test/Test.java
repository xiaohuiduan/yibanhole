import cc.weno.staticMsg.BaiduApiMsg;
import cc.weno.staticMsg.YibanMsg;
import cc.weno.util.BaiduApiUtil;
import com.alibaba.fastjson.JSONObject;
import com.baidu.aip.nlp.AipNlp;
import com.github.kevinsawicki.http.HttpRequest;

import java.sql.Date;
import java.util.*;

public class Test {

    @org.junit.Test
    public void m01() {
        List<String> list = new ArrayList<>();
        list.add("你好1");
        list.add("你好2");
        list.add("你好3");
        String strList = list.toString();
        System.out.println(strList);

        char[] list1 = strList.toCharArray();
        System.out.println(list1.getClass());
    }

    @org.junit.Test
    public void m02() {


        Map map = new HashMap();
        map.put("access_token", "5f096c159f7946845cfd2005b80a4148449523eb");

        HttpRequest request = HttpRequest.get(YibanMsg.INFO_URL, map, true);
        JSONObject jsonObject = (JSONObject) JSONObject.parse(request.body());
        System.out.println(jsonObject);
        System.out.println(jsonObject.getJSONObject("info").getString("yb_usernick"));
//        return (String) ;
    }

    @org.junit.Test
    public void m03() {
        BaiduApiUtil baiduApiUtil = new BaiduApiUtil();
        String token = baiduApiUtil.getToken();
        String text = "我的世界";
        JSONObject json = baiduApiUtil.getTextAnalyse(text);
        Map map = new HashMap(4);
        map.put("sentiment",json.getString("sentiment"));
        map.put("confidence",json.getString("confidence"));
        map.put("positive_prob",json.getString("positive_prob"));
        map.put("negative_prob",json.getString("negative_prob"));
        System.out.println(map);
    }

    @org.junit.Test
    public void m04() {
        Map map = new HashMap();
        map.put("A","1");
        map.put("B","2");
        map.put("C","3");
        String s = "{A=1, B=2, C=3}";
        System.out.println(map.toString());
//        Map map1 = s;
    }

    @org.junit.Test
    public void m05() {
        String text = "苹果是一家伟大的公司";
        AipNlp client = new AipNlp(BaiduApiMsg.APP_ID, BaiduApiMsg.API_KRY, BaiduApiMsg.SECRET_KRY);
        // 传入可选参数调用接口
        HashMap<String, Object> options = new HashMap<String, Object>();

        // 情感倾向分析
        org.json.JSONObject res = client.sentimentClassify(text, options);
        System.out.println(res.toString(2));
    }

}
