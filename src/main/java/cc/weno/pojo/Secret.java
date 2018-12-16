package cc.weno.pojo;


import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;

/**
 * 发表秘密的信息
 * @author xiaohiu
 */
public class Secret {

    /**
     * 发布内容的ID编号
     */
    private String secretId;

    /**
     * 评论
     */
    private ArrayList comments;
    /**
     * 秘密标签
     */
    private String label;

    /**
     * 发布的内容
     */
    private String secretContent;

    /**
     * 发布者的名字
     */
    private String promulgator;

    /**
     * 发布者的时间
     */
    private Date secretDate;

    /**
     * 发布者的易班Id
     */
    private String yibanId;

    /**
     * 赞的数量
     */
    private Integer likeNum;

    private String analyseMap;

    public String getAnalyseMap() {
        return analyseMap;
    }

    public void setAnalyseMap(String analyseMap) {
        this.analyseMap = analyseMap;
    }

    public Integer getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(Integer likeNum) {
        this.likeNum = likeNum;
    }

    public Date getSecretDate() {
        return secretDate;
    }

    public void setSecretDate(Date secretDate) {
        this.secretDate = secretDate;
    }

    public String getYibanId() {
        return yibanId;
    }

    public void setYibanId(String yibanId) {
        this.yibanId = yibanId;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getSecretId() {
        return secretId;
    }

    public void setSecretId(String secretId) {
        this.secretId = secretId;
    }

    public String getSecretContent() {
        return secretContent;
    }

    public void setSecretContent(String secretContent) {
        this.secretContent = secretContent;
    }

    public String getPromulgator() {
        return promulgator;
    }

    public void setPromulgator(String promulgator) {
        this.promulgator = promulgator;
    }

    public ArrayList getComments() {
        return comments;
    }

    public void setComments(ArrayList comments) {
        this.comments = comments;
    }

    @Override
    public String toString() {
        return "Secret{" +
                "secretId='" + secretId + '\'' +
                ", comments=" + comments +
                ", label='" + label + '\'' +
                ", secretContent='" + secretContent + '\'' +
                ", promulgator='" + promulgator + '\'' +
                ", secretDate=" + secretDate +
                ", yibanId='" + yibanId + '\'' +
                ", likeNum=" + likeNum +
                ", analyseMap=" + analyseMap +
                '}';
    }
}