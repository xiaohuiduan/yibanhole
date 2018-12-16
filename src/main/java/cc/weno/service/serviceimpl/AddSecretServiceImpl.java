package cc.weno.service.serviceimpl;

import cc.weno.mapper.SecretMapper;
import cc.weno.pojo.YiBanUser;
import cc.weno.service.AddSecretService;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;


/**
 * @author xiaohiu
 */
@Service("addSecretService")
public class AddSecretServiceImpl implements AddSecretService {

    @Resource
    private SecretMapper secretMapper;
    @Override
    public void addSecret(String content, String yiBanId, String promulgator, String label, JSONObject analyse) {

        java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
        long secretId = System.currentTimeMillis();

        secretMapper.addSecret(secretId,content,promulgator,yiBanId,label,date,analyse.toString());

    }

    @Override
    public int addLike(String yibanId, String secretId) {

        int likeRe = secretMapper.addLike(yibanId,secretId);
        return likeRe;
    }

    @Override
    public int addComment(YiBanUser user, String secretId,String content) {

        Timestamp timestamp = new Timestamp(System.currentTimeMillis());

        int commentRe = secretMapper.addComment(user.getYiBanName(),secretId,content,timestamp);

        return commentRe;
    }
}
