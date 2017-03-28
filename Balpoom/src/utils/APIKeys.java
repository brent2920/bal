package utils;

import org.springframework.stereotype.Component;

@Component
public class APIKeys {
	//AIzaSyB7rPQITd2SVLFx6SiEhk8P_GPWxQN32Y0
	static String GOOGLE_MAP_KEY = "AIzaSyB7rPQITd2SVLFx6SiEhk8P_GPWxQN32Y0";

	public static String getGOOGLE_MAP_KEY() {
		return GOOGLE_MAP_KEY;
	}
}
