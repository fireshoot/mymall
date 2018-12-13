package com.iss.service;

import java.util.List;

import com.iss.pojo.Message;

public interface IMessageService {

	List<Message> getMessageByCid(int cid);

	boolean deleteById(String id);

	boolean upStateByKey(String id);

}
