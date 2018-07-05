package team.nercita.manage.cms.wechat.vo;

public class AccessToken {  
    private String token;  
    private int expiresIn;  
    private String refresh_token;
    private String openId;
    private String scope;
    private long expiresMSecond;
    
    public String getRefresh_token() {
		return refresh_token;
	}

	public void setRefresh_token(String refresh_token) {
		this.refresh_token = refresh_token;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getScope() {
		return scope;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}

	public String getToken() {  
        return token;  
    }  
  
    public void setToken(String token) {  
        this.token = token;  
    }  
  
    public int getExpiresIn() {  
        return expiresIn;  
    }  
  
    public void setExpiresIn(int expiresIn) {  
        this.expiresIn = expiresIn;  
        this.expiresMSecond = System.currentTimeMillis() + expiresIn*1000;
    }  
    
    /**
     * 在多少秒之内将会过期
     * @param seconds
     * @return
     */
    public boolean isExpiresInSeconds(int seconds){
    	return (System.currentTimeMillis() + seconds*1000) >= this.expiresMSecond;
    }
    
}  
