package cc.weno.controller.user;

import cc.weno.pojo.YiBanUser;

import cc.weno.staticMsg.YibanMsg;

import cc.weno.util.YiBanUserInfo;
import com.alibaba.fastjson.JSONObject;
import com.github.kevinsawicki.http.HttpRequest;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.Map;

/**
 * 用户进行登录的类
 *
 * @author xiaohiu
 */
@Controller
@SessionAttributes("yibanUser")
public class UserController {


    /**
     * 进行重定向
     *
     * @param attributes 添加的参数
     * @return 重定向到易班认证网址
     */

    @RequestMapping(value = "/yibanlogin")
    public String index(RedirectAttributes attributes) {

        // 重定向添加参数
        attributes.addAttribute("client_id", YibanMsg.APP_ID);
        attributes.addAttribute("redirect_uri", YibanMsg.BACK_URL);
        return "redirect:" + YibanMsg.GET_CODE_URL;
    }

    /**
     * 获得token值state
     *
     * @param code
     * @return 登录成功的页面
     */
    @RequestMapping(value = "/yibanindex")
    public String login(String code, Model model) {
        Map<String, String> map = new HashMap<>(4);

        map.put("client_id", YibanMsg.APP_ID);
        map.put("client_secret", YibanMsg.APP_SECRET);
        map.put("code", code);
        map.put("redirect_uri", YibanMsg.BACK_URL);
        HttpRequest request = HttpRequest.post(YibanMsg.GET_TOKEN_URL)
                .form(map);
        // 得到返回的json数据，并json化
        JSONObject jsonObject = JSONObject.parseObject(request.body());

        // 是否获得了token值
        if (jsonObject.containsKey(YibanMsg.ACCESS_TOKEN)) {

            String token =jsonObject.getString("access_token");
            String yibanId =  jsonObject.getString("userid");

            YiBanUser user = new YiBanUser();
            user.setToken(token);
            user.setUserID(yibanId);
            YiBanUserInfo yiBanUserInfo = new YiBanUserInfo();
            user.setYiBanName(yiBanUserInfo.getMyName(token));

            //  将信息id,token和名字信息设置到session中
            model.addAttribute("yibanUser", user);
            // 返回树洞首页
            return "redirect:/page/new";
        } else {
            //  登录失败
            return "redirect:/yibanlogin";
        }
    }
}
