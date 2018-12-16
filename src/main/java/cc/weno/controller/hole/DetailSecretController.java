package cc.weno.controller.hole;

import cc.weno.pojo.Secret;
import cc.weno.pojo.SecretComment;
import cc.weno.pojo.YiBanUser;
import cc.weno.service.AddSecretService;
import cc.weno.service.GetSecretService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 详细秘密信息
 *
 * @author xiaohiu
 */
@Controller
@RequestMapping("/secret")
public class DetailSecretController {

    @Resource
    private GetSecretService getSecretService;

    @Resource
    private AddSecretService addSecretService;

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detailSecret(@RequestParam("id") String id, Model model) {
        Secret secret = getSecretService.getSecretById(id);
        model.addAttribute("secret", secret);
        return "detailSecret";
    }

    @RequestMapping("/like")
    @ResponseBody
    public String like(@RequestParam("id") String id, HttpServletRequest request) {

        YiBanUser user = (YiBanUser) request.getSession().getAttribute("yibanUser");
        int likeRe = addSecretService.addLike(user.getUserID(), id);
        if (likeRe == 1) {
            // 赞成功
            return "true";
        } else if (likeRe == 0) {
            // 已经赞过了
            return "false_1";
        }
        return "false";
    }

    @RequestMapping("/comment")
    @ResponseBody
    public String comment(@RequestParam("id") String id,@RequestParam("review_text")String content, HttpServletRequest request) {
        YiBanUser user = (YiBanUser) request.getSession().getAttribute("yibanUser");
        int re = addSecretService.addComment(user,id,content);
        if (re == 1){
            return "true";
        }else{
            return "false";
        }
    }
}
