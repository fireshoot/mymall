package com.iss.mapper;

import java.util.List;

import com.iss.pojo.Cart;
import com.iss.vo.CidAndBid;

public interface CartMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Cart record);

    int insertSelective(Cart record);

    Cart selectByPrimaryKey(Integer id);
    
    List<Cart> selectByCid(Integer cid);
    

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);
    
    Cart selectByCidAndBid(CidAndBid c);
}