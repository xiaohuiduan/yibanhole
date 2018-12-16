package cc.weno.service.serviceimpl;

import cc.weno.mapper.SecretMapper;
import cc.weno.pojo.Secret;
import cc.weno.service.GetSecretService;
import cc.weno.util.SortByLikeNum;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;

/**
 * 秘密信息的获取
 * @author xiaohiu
 */
@Service("getSecretService")
public class GetSecretServiceImpl implements GetSecretService {

    @Resource
    private SecretMapper secretMapper;
    @Override
    public Secret getSecretById(String id) {
        Secret secret = secretMapper.getSecretById(id);
        return secret;
    }

    @Override
    public ArrayList<Secret> getAllNewSecret() {

        return secretMapper.getAllNewSecret();
    }

    @Override
    public ArrayList<Secret> getAllHotSecret() {
        ArrayList<Secret> secrets = secretMapper.getAllNewSecret();
        // 按照点赞数进行排序
        Collections.sort(secrets,new SortByLikeNum());
        return secrets;
    }

    @Override
    public ArrayList<Secret> getMySecret(String yibanId) {
        ArrayList<Secret> secrets = secretMapper.getMySecret(yibanId);
        return secrets;
    }


}
