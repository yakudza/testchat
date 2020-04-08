package com.example.controller;

import com.example.domain.Message;
import com.example.domain.User;
import com.example.repos.MessageRepo;
import com.example.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
public class MessageController {
    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private UserRepo userRepo;

    @GetMapping("/main")
    public String main(@AuthenticationPrincipal User user, Model model) {
        user.setOnline(true);
        userRepo.save(user);
        Iterable<Message> messages = messageRepo.findAll();
        Iterable<User> users = userRepo.findAll();
        model.addAttribute("messages", messages);
        model.addAttribute("users", users);
        return "main";
    }

    @PostMapping("/main")
    public String addMessage(@AuthenticationPrincipal User user, @RequestParam String text){
        Message newMessage = new Message(user, text, new Date());
        messageRepo.save(newMessage);
        return "redirect:/main";
    }


}
