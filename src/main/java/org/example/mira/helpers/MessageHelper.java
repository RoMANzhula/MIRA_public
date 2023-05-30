package org.example.mira.helpers;

import org.example.mira.models.User;


public abstract class MessageHelper {

    public static String getAuthorName(User author) {
        return author != null ? author.getUsername() : "<none>";
    }

}
