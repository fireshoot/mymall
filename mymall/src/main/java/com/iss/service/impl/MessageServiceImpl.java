package com.iss.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iss.mapper.CustomerMapper;
import com.iss.mapper.MessageMapper;
import com.iss.pojo.Message;
import com.iss.pojo.Order;
import com.iss.service.IMessageService;
import com.iss.service.IOrderService;

@Service
public class MessageServiceImpl implements IMessageService {

	@Autowired
	private MessageMapper messageMapper;

	@Override
	public List<Message> getMessageByCid(int cid) {

		return (List<Message>) messageMapper.selectByCidKey(cid);

	}

	public boolean deleteById(String id) {

		int kid = Integer.parseInt(id);
		int a = messageMapper.deleteByPrimaryKey(kid);
		if (a > 0)
			return true;
		else
			return false;
	}
	
	public boolean upStateByKey(String id) {
		
		int kid = Integer.parseInt(id);
		Message record=new Message();
		record.setMsgId(kid);
		record.setMsgState("1");
		int a = messageMapper.updateByPrimaryKeySelective(record);
		if (a > 0)
			return true;
		else
			return false;
		
	}

}
