package org.example.mira.service;


import org.example.mira.models.Role;
import org.example.mira.models.User;
import org.example.mira.repositories.UserRepository;
import org.example.mira.services.MailService;
import org.example.mira.services.UserService;
import org.hamcrest.CoreMatchers;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Collections;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserServiceTest {

    @Autowired
    private UserService userService;

    @MockBean
    private UserRepository userRepository;

    @MockBean
    private MailService mailService;

    @MockBean
    private PasswordEncoder passwordEncoder;

    @Test
    public void addUser() {

        User user = new User();
        user.setEmail("someemail@ukr.net");

        boolean isUserWasCreated = userService.addUser(user);

        Assert.assertTrue(isUserWasCreated);
        Assert.assertNotNull(user.getActivationCode());
        Assert.assertTrue(CoreMatchers.is(user.getRoles()).matches(Collections.singleton(Role.USER)));

        Mockito.verify(userRepository, Mockito.times(1)).save(user);
        Mockito.verify(mailService, Mockito.times(1))
                .sendFromMIRA(
                        ArgumentMatchers.eq(user.getEmail()),
                        ArgumentMatchers.eq("Activation code"),
                        ArgumentMatchers.contains("Welcome to MIRA.")
                );

        Mockito.verify(mailService, Mockito.times(1))
                .sendFromMIRA(
                        ArgumentMatchers.eq(user.getEmail()),
                        ArgumentMatchers.anyString(),
                        ArgumentMatchers.anyString()
                );

    }

    @Test
    public void addUserAlreadyRegistered() {
        User user = new User();
        user.setUsername("Unknown");

        Mockito.doReturn(new User())
                .when(userRepository)
                .findByUsername("Unknown");

        boolean isUserAlreadyRegistered = userService.addUser(user);

        Assert.assertFalse(isUserAlreadyRegistered);

        Mockito.verify(userRepository, Mockito.times(0)).save(ArgumentMatchers.any(User.class));
        Mockito.verify(mailService, Mockito.times(0))
                .sendFromMIRA(
                        ArgumentMatchers.anyString(),
                        ArgumentMatchers.anyString(),
                        ArgumentMatchers.anyString()
                );
    }

    @Test
    public void activateUser() {
        User user = new User();

        user.setActivationCode("Ok!");

        Mockito.doReturn(new User())
                .when(userRepository)
                .findByActivationCode("activateCode");

        boolean isUserActivated = userService.activateUser("activateCode");

        Assert.assertTrue(isUserActivated);
        Assert.assertNotNull(user.getActivationCode());

        Mockito.verify(userRepository, Mockito.times(1)).save(user);

    }

}