package com.chenpeng.dao;

import com.chenpeng.domain.Account;

public interface AccountMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Account record);

    int insertSelective(Account record);

    Account selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Account record);

    int updateByPrimaryKey(Account record);

    /**
     * 查询账户信息
     * @param record
     * @return
     */
    Account selectAccount(Account record);
}