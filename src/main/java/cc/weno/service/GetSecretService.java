package cc.weno.service;

import cc.weno.pojo.Secret;

import java.awt.*;
import java.util.ArrayList;

/**
 * @author xiaohiu
 */
public interface GetSecretService {

    /**
     * 通过id获得数据
     * @param id
     * @return
     */
    Secret getSecretById(String id);

    ArrayList<Secret> getAllNewSecret();

    ArrayList<Secret> getAllHotSecret();

    ArrayList<Secret> getMySecret(String yibanId);




}
