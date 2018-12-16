package cc.weno.controller.hole;


import cc.weno.pojo.Secret;
import cc.weno.pojo.YiBanUser;
import cc.weno.service.GetSecretService;
import cc.weno.staticMsg.PageMsg;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;


/**
 * 展示页面
 *
 * @author xiaohiu
 */
@Controller
@RequestMapping("/page")
public class ShowPageController {

    @Resource
    private GetSecretService getSecretService;

    @RequestMapping(value = "/index")
    public String showIndex() {
        return "index";
    }

    @RequestMapping(value = "/publish")
    public String showPublish() {
        return "publish";
    }


    @RequestMapping(value = "/new")
    public String showNew(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Model model) {
        PageHelper.startPage(page, PageMsg.PAGE_NUM);
        Page<Secret> secrets = (Page<Secret>) getSecretService.getAllNewSecret();
        PageInfo<Secret> pageInfo = new PageInfo<>(secrets);
        model.addAttribute("newSecrets", secrets);
        model.addAttribute("page", pageInfo);
        return "newSecret";
    }

    @RequestMapping("/hot")
    public String showHot(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Model model) {
        // 使用分页
        PageHelper.startPage(page, PageMsg.PAGE_NUM);
        // 按照点赞数获得list
        ArrayList<Secret> secrets = getSecretService.getAllHotSecret();
        /**
         * page的信息，包括但是不限于：
         * 下一页，上一页，是否含有上下页
         */
        PageInfo pageInfo = new PageInfo(secrets);
        model.addAttribute("newSecrets", secrets);
        model.addAttribute("page", pageInfo);
        return "hotSecret";
    }

    /**
     * 展示我的页面
     *
     * @param page
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/my")
    public String showMy(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                         HttpServletRequest request, Model model) {
        PageHelper.startPage(page, PageMsg.PAGE_NUM);
        YiBanUser user = (YiBanUser) request.getSession().getAttribute("yibanUser");
        ArrayList<Secret> secrets = getSecretService.getMySecret(user.getUserID());
        PageInfo pageInfo = new PageInfo(secrets);
        model.addAttribute("newSecrets", secrets);
        model.addAttribute("page", pageInfo);
        return "mySecret";
    }


    /**
     * 公告页面
     *
     * @return
     */
    @RequestMapping("/notice")
    public String showNotice() {

        return "notice";
    }
}
