package com.chenpeng.service.impl;

import com.chenpeng.dao.AccountMapper;
import com.chenpeng.domain.Account;
import com.chenpeng.service.IUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("userService")
public class UserService implements IUserService {

    /**
     * 账户的mapper
     */
    @Resource(name = "accountMapper")
    private AccountMapper accountMapper;


    @Override
    public Account login(Account account) {
        if(account != null&&
                StringUtils.isNotBlank(account.getUid())
                &&StringUtils.isNotBlank(account.getUpwd())
        ){
            return accountMapper.selectAccount(account);
        }
        return null;
    }

}
