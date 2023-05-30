package org.example.mira.dto;

import org.example.mira.models.Message;
import org.example.mira.models.User;
import org.example.mira.helpers.MessageHelper;

import java.sql.Timestamp;

public class MessageDto {
    private Long id;
    private String text;
    private String tag;
    private Timestamp date;
    private User author;
    private String filename;
    private Long likes;
    private Boolean toLiked;

    public MessageDto(Message message, Long likes, Boolean toLiked) {
        this.id = message.getId();
        this.text = message.getText();
        this.tag = message.getTag();
        this.date = message.getDate();
        this.author = message.getAuthor();
        this.filename = message.getFilename();
        this.likes = likes;
        this.toLiked = toLiked;
    }

    public String getAuthorName() {
        return MessageHelper.getAuthorName(author);
    }

    public Long getId() {
        return id;
    }

    public String getText() {
        return text;
    }

    public String getTag() {
        return tag;
    }

    public Timestamp getDate() {
        return date;
    }

    public User getAuthor() {
        return author;
    }

    public String getFilename() {
        return filename;
    }

    public Long getLikes() {
        return likes;
    }

    public Boolean getToLiked() {
        return toLiked;
    }

    @Override
    public String toString() {
        return "MessageDto{" +
                "id=" + id +
                ", author=" + author +
                ", likes=" + likes +
                ", toLiked=" + toLiked +
                '}';
    }
}
