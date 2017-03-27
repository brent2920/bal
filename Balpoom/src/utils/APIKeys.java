package utils;

import org.springframework.stereotype.Component;

@Component
public class APIKeys {
	static String GOOGLE_MAP_KEY = "AIzaSyAV0hrFki3nk6LZ9sv5xiwIOGigo-w9TCw";

	public static String getGOOGLE_MAP_KEY() {
		return GOOGLE_MAP_KEY;
	}
}
