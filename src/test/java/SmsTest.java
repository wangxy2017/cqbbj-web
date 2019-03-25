import com.cqbbj.core.util.SmsUtils;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: SmsTest
 * @Description: 短信测试(这里用一句话描述这个类的作用)
 * @date 2019/2/28 18:43
 */
public class SmsTest {
    public static void main(String[] args) {
        SmsUtils.sendSms("18883669894", "验证码为654245");
    }

}
