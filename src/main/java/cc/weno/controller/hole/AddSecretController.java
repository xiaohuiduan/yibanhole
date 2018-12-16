package cc.weno.controller.hole;

import cc.weno.pojo.YiBanUser;
import cc.weno.service.AddSecretService;
import cc.weno.util.BaiduApiUtil;
import cc.weno.util.YiBanUserInfo;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @author xiaohiu
 */
@Controller
@RequestMapping("/secret")
public class AddSecretController {


    @Resource
    private AddSecretService addSecretService;
    /**
     * @param content 秘密内容
     * @param label   标签
     * @param hide    是否隐藏
     * @param request
     */

    @RequestMapping(value = "/addSecret", method = RequestMethod.POST)
    public String addSecret(@RequestParam("content") String content, @RequestParam("content_bq") String label,
                          @RequestParam(value = "hide", required = false, defaultValue = "0") Integer hide, HttpServletRequest request) {

        YiBanUser yiBanUser = (YiBanUser) request.getSession().getAttribute("yibanUser");

        String promulgator;
        // 表示匿名
        if (hide == 1) {
            promulgator = "匿名";
        } else {
            promulgator = yiBanUser.getYiBanName();
        }
        BaiduApiUtil util = new BaiduApiUtil();
        JSONObject json = util.getTextAnalyse(content);
        addSecretService.addSecret(content, yiBanUser.getUserID(), promulgator,label,json);
        return "redirect:/page/new";
    }

}
