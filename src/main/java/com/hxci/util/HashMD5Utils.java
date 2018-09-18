package com.hxci.util;

import java.nio.charset.Charset;


import com.google.common.hash.HashCode;
import com.google.common.hash.HashFunction;
import com.google.common.hash.Hashing;


/**
 * 密码加盐  ， 防止明文在数据库出现
 * @author xuning
 */
public class HashMD5Utils {

	static final private HashFunction FUNCTION = Hashing.md5();
	
	/**
	 * 默认 或者重置 使用 ， 不建议写死 ， 后期修改
	 */
	static final public String teacherDefault = "b35a49ee48883a176be00f00558e1830";
	
	static final public String studentDefault = "caa93c50fc6d74feea79e0b6aee45235";
	
	
	private HashMD5Utils() {
		
	}
	
	/*
	 * 加盐字符串 防止破解
	 */
	private static final String SALT = "xuning2911";
	
	/**
	 * 用户密钥
	 */
	private String USER_KEY ;
	
	/**
	 * 默认密码加密
	 * @param password
	 * @return
	 */
	public static String encryPassword(String password)
	{
		HashCode hashCode = FUNCTION.hashString(password+SALT , Charset.forName("UTF-8"));
		return hashCode.toString();
	}
	
	/**
	 * 修改密码加密
	 * @param password
	 * @param key
	 * @return
	 */
	@Deprecated
	static public String encryPassword (String password , String key) {
		HashCode hashCode = FUNCTION.hashString(password+key , Charset.forName("UTF-8"));
		return hashCode.toString();
	}


    
    public void setUSER_KEY(String uSER_KEY) {
		USER_KEY = uSER_KEY;
	}
    
    public String getUSER_KEY() {
		return USER_KEY;
	}
	
    
    
	
	public static void main(String[] args) {
		//test 密码加密 
		
		
		//f2b1096df00ecdc67f822bb42b7cee51
		
		//System.out.println(HashMD5Utils.encryPassword("941227")); 
		
		//System.out.println(encryPassword("xu","1123123"));
		
		//b35a49ee48883a176be00f00558e1830   -----  教师默认密码  1234
		//caa93c50fc6d74feea79e0b6aee45235   -----  学生默认密码  888888
		
		
		//System.err.println(encryPassword("888888"));
		
		//  明码 加密 eHVuaW5nMjkxMQ==
		//System.out.println(encodeStr("xuning2911"));
		
		//  密文 解密 xuning941227
        //System.out.println(decodeStr("eHVuaW5nMjkxMQ=="));
        
	}
	
	
	
}
