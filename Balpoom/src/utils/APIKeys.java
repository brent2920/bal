package utils;

import org.springframework.stereotype.Component;

@Component
public class APIKeys {
	//AIzaSyB7rPQITd2SVLFx6SiEhk8P_GPWxQN32Y0
	//AIzaSyAAE5JejbaQYPmos43wLK3mBPVlkonWUOE
	//AIzaSyAkcL0U9iE0uwxqFMSvh7nhM6cFRmyynzk
	//AIzaSyD4vzBQiYomL-S8Fwvp1649W56W_9SmDE4

	static String GOOGLE_MAP_KEY = "AIzaSyAAE5JejbaQYPmos43wLK3mBPVlkonWUOE";

	public static String getGOOGLE_MAP_KEY() {
		return GOOGLE_MAP_KEY;
	}
}