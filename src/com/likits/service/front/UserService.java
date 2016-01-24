package com.likits.service.front;

import java.text.ParseException;

import com.likits.model.front.UserJson;

public interface UserService {
	
	UserJson register(String senderEmail,String senderPassword,String sernderHost,String registerEmail,String registerPassword) throws ParseException;
	UserJson updateUserActivate(String registerId,String registerEmail);
	UserJson findUser(String email, String password);
	
}
