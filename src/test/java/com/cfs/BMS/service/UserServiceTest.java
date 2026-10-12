package com.cfs.BMS.service;

import com.cfs.BMS.dto.LoginRequest;
import com.cfs.BMS.dto.UserRequest;
import com.cfs.BMS.entity.User;
import com.cfs.BMS.repository.UserRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class UserServiceTest {

    @Mock
    private UserRepository userRepository;

    @InjectMocks
    private UserService userService;

    @Test
    void registerRejectsExistingEmailRegardlessOfCaseOrWhitespace() {
        when(userRepository.existsByEmail("user@example.com")).thenReturn(true);

        ResponseStatusException exception = assertThrows(
                ResponseStatusException.class,
                () -> userService.register(new UserRequest("User", " User@Example.com ", "pass", null))
        );

        assertEquals(HttpStatus.CONFLICT, exception.getStatusCode());
    }

    @Test
    void registerStoresNormalizedEmail() {
        when(userRepository.existsByEmail("user@example.com")).thenReturn(false);
        when(userRepository.save(any(User.class))).thenAnswer(invocation -> invocation.getArgument(0));

        User registered = userService.register(new UserRequest(" User ", " User@Example.com ", "pass", null));

        assertEquals("User", registered.getName());
        assertEquals("user@example.com", registered.getEmail());
    }

    @Test
    void loginUsesNormalizedEmailAndReturnsUnauthorizedForUnknownAccount() {
        when(userRepository.findByEmail("user@example.com")).thenReturn(Optional.empty());

        ResponseStatusException exception = assertThrows(
                ResponseStatusException.class,
                () -> userService.login(new LoginRequest(" User@Example.com ", "pass"))
        );

        assertEquals(HttpStatus.UNAUTHORIZED, exception.getStatusCode());
        verify(userRepository).findByEmail("user@example.com");
    }
}
