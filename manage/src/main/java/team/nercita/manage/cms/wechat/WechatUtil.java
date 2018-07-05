/*
 * WechatUtil.java
 * 创建者：L
 * 创建日期：2017年12月4日 上午9:38:28
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.wechat;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.util.Properties;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;

import team.nercita.manage.cms.wechat.vo.AccessToken;
import team.nercita.manage.cms.wechat.vo.MyX509TrustManager;

/**
 * 
 * @author L
 * @date： 2017年12月4日 上午9:38:28
 */
public class WechatUtil {
	
	private static String APPID;
	private static String APPSECRETID;
	
	static  {    
        Properties prop =  new  Properties();    
        InputStream in = WechatUtil.class.getResourceAsStream( "/config.properties" );    
         try {  
            prop.load(in);    
            APPID = prop.getProperty( "appid" ).trim();    
            APPSECRETID = prop.getProperty( "appsecretid" ).trim();    
        } catch (IOException e) {    
            e.printStackTrace();    
        }    
    }
	
	public static final String oauth_access_token_url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=APPSECRET&code=OPEN_CODE&grant_type=authorization_code";
	
	public static AccessToken geOuthAccessToken(String code) {
		AccessToken accessToken = null;
		String requestUrl = oauth_access_token_url.replace("APPID", APPID).replace("APPSECRET", APPSECRETID);
		requestUrl = requestUrl.replace("OPEN_CODE", "code");
		JSONObject jsonObject = httpRequest(requestUrl, "GET", null);
		if (null != jsonObject) {
			try {
				accessToken = new AccessToken();
				accessToken.setToken(jsonObject.getString("access_token"));
				accessToken.setExpiresIn(jsonObject.getIntValue("expires_in"));
				accessToken.setOpenId(jsonObject.getString("openid"));
				accessToken.setRefresh_token(jsonObject
						.getString("refresh_token"));
				accessToken.setScope(jsonObject.getString("scope"));
			} catch (JSONException e) {
				accessToken = null;
				e.printStackTrace();
			}
		}
		return accessToken;
	}
	
	public static JSONObject httpRequest(String requestUrl,
			String requestMethod, String outputStr) {
		JSONObject jsonObject = null;
		StringBuffer buffer = new StringBuffer();
		try {
			TrustManager[] tm = { new MyX509TrustManager() };
			SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
			sslContext.init(null, tm, new java.security.SecureRandom());
			SSLSocketFactory ssf = sslContext.getSocketFactory();

			URL url = new URL(requestUrl);
			HttpsURLConnection httpUrlConn = (HttpsURLConnection) url
					.openConnection();
			httpUrlConn.setSSLSocketFactory(ssf);

			httpUrlConn.setDoOutput(true);
			httpUrlConn.setDoInput(true);
			httpUrlConn.setUseCaches(false);
			httpUrlConn.setRequestMethod(requestMethod);

			if ("GET".equalsIgnoreCase(requestMethod))
				httpUrlConn.connect();
			if (null != outputStr) {
				OutputStream outputStream = httpUrlConn.getOutputStream();
				outputStream.write(outputStr.getBytes("UTF-8"));
				outputStream.close();
			}

			InputStream inputStream = httpUrlConn.getInputStream();
			InputStreamReader inputStreamReader = new InputStreamReader(
					inputStream, "utf-8");
			BufferedReader bufferedReader = new BufferedReader(
					inputStreamReader);

			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
			bufferedReader.close();
			inputStreamReader.close();
			inputStream.close();
			inputStream = null;
			httpUrlConn.disconnect();
			jsonObject = JSONObject.parseObject(buffer.toString());
		} catch (Exception e) {
		    e.printStackTrace();
		}
		return jsonObject;
	}
}
