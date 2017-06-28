import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import com.yst.security.Md5Encode;


public class Md5Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			String str = Md5Encode.EncoderByMd5("111111");
			System.out.println(str);
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
