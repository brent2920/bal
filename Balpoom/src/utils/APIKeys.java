package utils;

import org.springframework.stereotype.Component;

@Component
public class APIKeys {
	static String GOOGLE_MAP_KEY = "AIzaSyDK5grkR5Wb-aNVCKk_lc0ck05m88dHMTY";

	public static String getGOOGLE_MAP_KEY() {
		return GOOGLE_MAP_KEY;
	}
}
