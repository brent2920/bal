package utils;

import org.springframework.stereotype.Component;

@Component
public class APIKeys {
	static String GOOGLE_MAP_KEY = "AIzaSyBgNeKcqCZgxXpAgv62ZsFg1VKPNFkJsGA";

	public static String getGOOGLE_MAP_KEY() {
		return GOOGLE_MAP_KEY;
	}
}
