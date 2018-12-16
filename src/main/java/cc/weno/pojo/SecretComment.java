package cc.weno.pojo;

import java.sql.Timestamp;

/**
 * 秘密评论
 * @author xiaohiu
 */
public class SecretComment {

    private String commentName;
    private String commentContent;
    private String secretId;
    private Timestamp commentDate;

    @Override
    public String toString() {
        return "SecretComment{" +
                "commentName='" + commentName + '\'' +
                ", commentContent='" + commentContent + '\'' +
                ", secretId='" + secretId + '\'' +
                ", commentDate=" + commentDate +
                '}';
    }

    public Timestamp getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Timestamp commentDate) {
        this.commentDate = commentDate;
    }

    public String getCommentName() {
        return commentName;
    }

    public void setCommentName(String commentName) {
        this.commentName = commentName;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getSecretId() {
        return secretId;
    }

    public void setSecretId(String secretId) {
        this.secretId = secretId;
    }
}
