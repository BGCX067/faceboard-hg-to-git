package main

import java.security.MessageDigest

class SecurityUtils {

	def hashWithMd5(password){
		MessageDigest md = MessageDigest.getInstance("MD5")
		md.update(password.getBytes())

		byte[] byteData = md.digest()

		StringBuffer sb = new StringBuffer()
		for (int i = 0; i < byteData.length; i++) {
			sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		}
		sb.toString()
	}
}
