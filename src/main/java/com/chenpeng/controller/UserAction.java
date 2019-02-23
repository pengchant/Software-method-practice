package com.chenpeng.controller;

import com.chenpeng.domain.Account;
import com.chenpeng.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * 用户控制器类
 */
@Controller
@RequestMapping("user")
public class UserAction {

    @Resource
    private IUserService userService;


    @RequestMapping("/test")
    public String main(){
        return "test";
    }


    /**
     * 登录
     * @param session
     * @param account
     * @param password
     * @return
     */
    @PostMapping("/login")
    public String login(HttpSession session, String account, String password){
        Account param = new Account();
        param.setUid(account);
        param.setUpwd(password);
        Account record = userService.login(param);
        if(record!=null){
            session.setAttribute("account", record);
            if(record.getType()==1){// 教师
                return "redirect:teacher.do";
            } else if(record.getType()==0){// 学生
                return "redirect:/exam/added.do";
            }
        }
        return "test";
    }

    @RequestMapping("/teacher")
    public String teacher(){
        return "teacher";
    }

}
