package tools;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {
	public static String encryption(String str) {
		   byte[] defaultBytes = str.getBytes();
		   try {
		       MessageDigest algorithm = MessageDigest.getInstance("MD5");
		       algorithm.reset();
		       algorithm.update(defaultBytes);
		       byte messageDigest[] = algorithm.digest();
		       StringBuffer hexString = new StringBuffer();
		       for (int i = 0; i < messageDigest.length; i++) {
		          String hex = Integer.toHexString(0xFF & messageDigest[i]);
		          if (hex.length() == 1) {
		              hexString.append('0');
		          }
		          hexString.append(hex);
		      }
		      str = hexString + "";
		   } catch (NoSuchAlgorithmException e) {
		      e.printStackTrace();
		   }
		   return str;
		}
	/*public static void main(String[] args) {
		System.out.println(encryption("123"));
	}*/
}
