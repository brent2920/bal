package utils;

import org.springframework.stereotype.Component;

@Component
public class APIKeys {
	//AIzaSyB7rPQITd2SVLFx6SiEhk8P_GPWxQN32Y0
	//AIzaSyAAE5JejbaQYPmos43wLK3mBPVlkonWUOE
	//AIzaSyAkcL0U9iE0uwxqFMSvh7nhM6cFRmyynzk
	static String GOOGLE_MAP_KEY = "AIzaSyBlWaY_-56IshnaXXMDrXmJnhehWtbidBQ";

	public static String getGOOGLE_MAP_KEY() {
		return GOOGLE_MAP_KEY;
	}
}
