package cc.weno.util;

import cc.weno.pojo.Secret;

import java.util.Comparator;

/**
 * 比较类
 * @author xiaohiu
 */
public class SortByLikeNum implements Comparator {
    @Override
    public int compare(Object o1, Object o2) {
        Secret s1 = (Secret) o1;
        Secret s2 = (Secret) o2;
        if (s1.getLikeNum()>s2.getLikeNum()){
            return -1;
        }else {
            return 1;
        }
    }
}
