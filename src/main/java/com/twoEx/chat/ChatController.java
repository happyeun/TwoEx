package com.twoEx.chat;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.twoEx.bean.ClassroomBean;
import com.twoEx.bean.CurriculumBean;
import com.twoEx.utils.ProjectUtils;

@Controller
public class ChatController {
	/*
	@MessageMapping("/chat.register")
	@SendTo("/topic/public")
	public Chat register(@Payload Chat chatMessage, SimpMessageHeaderAccessor headerAccessor) {
		headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
		return chatMessage;
	}

	@MessageMapping("/chat.send")
	@SendTo("/topic/public")
	public Chat sendMessage(@Payload Chat chatMessage) {
		return chatMessage;
	}
	 */

	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private ProjectUtils pu;

	@MessageMapping("/chat/{room}/{name}")
	public void chat(
			@DestinationVariable("room") String room,
			@DestinationVariable("name") String name, 
			//@DestinationVariable("profile") String profile, 
			String content
			) throws Exception {
		simpMessagingTemplate.convertAndSend("/topic/" + room , new Chat(name, content));
	}	
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chat() {
		return "chat";
	}

	@PostMapping("/moveChat")
	public ModelAndView moveChat (ModelAndView mav, @ModelAttribute ClassroomBean cb) {

		String accessInfo = null;
		String buyCode=null;
		String selCode=null;
		String userType=null;

		try {
			accessInfo=(String)this.pu.getAttribute("accessInfo");
			JsonParser parser = new JsonParser();
			JsonElement bean = parser.parse(accessInfo);
			userType = bean.getAsJsonObject().get("userType").getAsString();
			mav.addObject("userType", userType);
			if(userType.equals("buyer")) {buyCode=bean.getAsJsonObject().get("buyCode").getAsString();
			mav.addObject("buyCode", buyCode);
			}
			else {selCode=bean.getAsJsonObject().get("selCode").getAsString();
			mav.addObject("selCode", selCode);}
		} catch (Exception e) {
			e.printStackTrace();	
			mav.setViewName("mainPage");
		}	

		mav.setViewName("classroom/chat");

		String json = new Gson().toJson(cb);
		mav.addObject("classInfo", json);

		List<CurriculumBean> cbl = this.session.selectList("getCurriculumInfo", cb);
		String json2 = new Gson().toJson(cbl);
		mav.addObject("curriculumInfo", json2);	

		return mav;
	}	
}