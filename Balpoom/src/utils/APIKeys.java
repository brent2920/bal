package utils;

import org.springframework.stereotype.Component;

@Component
public class APIKeys {
	static String GOOGLE_MAP_KEY = "AIzaSyCjJDAVTrB1J5P1OllkHC07cmjfJbb52vg";

	public static String getGOOGLE_MAP_KEY() {
		return GOOGLE_MAP_KEY;
	}
}
