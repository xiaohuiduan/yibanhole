package cc.weno.service;


import cc.weno.pojo.YiBanUser;
import com.alibaba.fastjson.JSONObject;

import java.util.Map;

/**
 * @author xiaohiu
 */
public interface AddSecretService {


    /**
     * @param content     内容
     * @param yiBanId     易班ID
     * @param promulgator 发布者
     * @param label       标签
     * @param analyse     情感分析
     */
    void addSecret(String content, String yiBanId, String promulgator, String label, JSONObject analyse);

    /**
     * 添加一个赞
     *
     * @param yibanId
     * @param secretId
     * @return
     */
    int addLike(String yibanId, String secretId);


    /**
     * 添加评论id
     *
     * @param user
     * @param secretId
     * @return
     */
    int addComment(YiBanUser user, String secretId, String content);
}
