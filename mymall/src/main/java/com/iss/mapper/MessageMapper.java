package com.iss.mapper;

import java.util.List;

import com.iss.pojo.Message;

public interface MessageMapper {
    int deleteByPrimaryKey(Integer msgId);

    int insert(Message record);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Integer msgId);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(Message record);
    
    List<Message> selectByCidKey(int cid);
}