package com.iss.utils;

import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

import com.iss.pojo.Customer;

/**
 * 用户密码的加密
 */
public class EncryptUtil {

    private static final String ALGORITHMNAME = "md5";
    private static final int HASHITERATIONS = 2;

    public static synchronized void encryptPassword(Customer customer) {
    	if(customer.getSalt() == null ){
    		String salt = new SecureRandomNumberGenerator().nextBytes().toHex();
        	customer.setSalt(salt);
    	} 
        String newPassword = new SimpleHash(
                ALGORITHMNAME,
                customer.getPassword(),
                ByteSource.Util.bytes(customer.getCname()+customer.getSalt()),
                HASHITERATIONS).toHex();

        customer.setPassword(newPassword);
    }
}