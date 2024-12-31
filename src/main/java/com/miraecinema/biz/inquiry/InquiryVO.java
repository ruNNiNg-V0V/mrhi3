package com.miraecinema.biz.inquiry;

import java.util.Date;

public class InquiryVO {
    private int seq;
    private String qid;
    private String title;
    private String category;
    private String content;
    private Date createdAt;
    private int cnt;

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getQid() {
        return qid;
    }

    public void setQid(String qid) {
        this.qid = qid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
    }

    @Override
    public String toString() {
        return "InquiryVO [seq=" + seq + ", qid=" + qid + ", title=" + title +
               ", category=" + category + ", content=" + content +
               ", createdAt=" + createdAt + ", cnt=" + cnt + "]";
    }
}
