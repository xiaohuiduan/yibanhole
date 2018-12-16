package cc.weno.mapper;

import cc.weno.pojo.Secret;
import cc.weno.pojo.SecretComment;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * @author xiaohiu
 */
public interface SecretMapper {

    /**
     * 添加一个秘密
     *
     * @param content     秘密内容
     * @param promulgator 秘密发布者的名字，匿名或者是易班的名字
     * @param yibanId     易班的ID
     * @param secretId    数据库的主键名字
     * @param label       标签
     * @param date        时间
     */
    void addSecret(@Param("secretId") long secretId, @Param("content") String content, @Param("promulgator") String promulgator,
                   @Param("yibanId") String yibanId, @Param("label") String label, @Param("date") Date date,@Param("contentAnalyse")String analyse);

    /**
     * @param id 秘密的ID
     * @return 返回
     */
    Secret getSecretById(@Param("id") String id);


    /**
     * 添加一个赞
     *
     * @param yibanId  易班的Id
     * @param secretId 秘密的ID
     * @return
     */
    int addLike(@Param("yibanId") String yibanId, @Param("secretId") String secretId);

    /**
     * 添加一个评论
     *
     * @param name
     * @param secretId
     * @param content
     * @return
     */
    int addComment(@Param("name") String name, @Param("secret_id") String secretId, @Param("content") String content, @Param("time") Timestamp timestamp);

    /**
     * 获赞数量
     *
     * @param secretId
     * @return
     */
    int getLikeNum(@Param("secretId") String secretId);


    ArrayList<SecretComment> getComments(@Param("secretId") String secretId);

    /**
     * 获得所有数据
     *
     * @return
     */
    ArrayList<Secret> getAllNewSecret();


    /**
     * 获得我自己的秘密
     *
     * @param yibanId 易班的账号id
     * @return 返回队列
     */
    ArrayList<Secret> getMySecret(@Param("yibanId") String yibanId);
}