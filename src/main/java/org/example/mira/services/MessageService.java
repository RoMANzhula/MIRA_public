package org.example.mira.services;

import org.example.mira.dto.MessageDto;
import org.example.mira.models.User;
import org.example.mira.repositories.MessageRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class MessageService {

    private final MessageRepository messageRepository;

    public MessageService(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

    public Page<MessageDto> messageList(Pageable pageable, String filter, User user) {
        if (filter != null && !filter.isEmpty()) {
            return messageRepository.findByTag(filter, pageable, user);
        } else {
            return messageRepository.findAll(pageable, user);
        }
    }

    public Page<MessageDto> messageListForUser(Pageable pageable, User currentUser, User author) {
        if (currentUser.equals(author)) {
            return messageRepository.findByUser(pageable, author);
        } else {
            return messageRepository.findByUser(pageable, author, currentUser);
        }
    }
}
