package org.baseball.kia.taejeong.service;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailService {

	@Autowired
	JavaMailSender mailSender;

	public boolean sendTestMail(String target) {
		// SimpleMessage : text
		SimpleMailMessage message = new SimpleMailMessage();
		message.setSubject("[테스트] 테스트메일입니다.");
		message.setText("테스트 메일입니다.\n하하하하..");
		message.setTo(target);
		try {
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean sendTestHTMLMail(String target) {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		try {
			helper.setSubject("[테스트] 테스트");
			String text = "<h1>환영메일</h1><hr/>반갑습니다.";
			helper.setText(text, true);
			helper.setTo(target);

			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	/* 이메일 인증키 전송 */
	public Map<String, Object> sendAuthMailTo(String email) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		
		SimpleMailMessage message = new SimpleMailMessage();
		
		String raw = UUID.randomUUID().toString();
		String[] uuids = raw.split("-");
		String authKey = uuids[4];
		message.setSubject("KiaBaseballTeam | 요청하신 인증키 입니다.");
		String text = "인증키값은 " + authKey +" 입니다.\n";
			text += "이 인증키값은 일시적인 것으로 로그아웃 전에 입력해주세요.";
			
		message.setText(text);
		message.setTo(email);
		try {
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("rst" , false);
			return map;
		}
		
		map.put("rst", true);
		map.put("authKey", authKey);

		return map;
	}

}






