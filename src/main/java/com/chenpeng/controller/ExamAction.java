package com.chenpeng.controller;

import com.chenpeng.domain.Account;
import com.chenpeng.domain.TestPaper;
import com.chenpeng.service.IExamPaperService;
import com.chenpeng.view.ExamPaper;
import com.chenpeng.view.TestExamPaperView;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Map;

@Controller
@RequestMapping("/exam")
public class ExamAction {

    @Autowired
    private IExamPaperService examPaperService;

    /**
     * 添加题目
     *
     * @param param
     * @param session
     * @return
     */
    @RequestMapping("/addpaper")
    @ResponseBody
    public String addPaper(@RequestBody String param, HttpSession session) {
        Gson gson = new Gson();
        ExamPaper examPaper = gson.fromJson(param, ExamPaper.class);
        // 执行录入操作
        Account account = (Account) session.getAttribute("account");
        boolean flag = examPaperService.addExamPaper(examPaper, account);
        return flag ? "success" : "error";
    }

    /**
     * 查看已经添加的问卷 出题人->试卷列表
     */
    @RequestMapping("/added")
    public String addedPapers(@RequestParam(defaultValue = "1", name = "pageNo") int pageNo,
                              @RequestParam(defaultValue = "10", name = "pageSize") int pageSize,
                              HttpSession session, Model model) {
        try {
            // 查询已经添加过的试卷（功能，查看统计，做题）
            Account account = (Account) session.getAttribute("account");
            int suberid = account.getId();
            if(account.getType()==0){
                suberid = -1;
            }
            PageInfo<TestPaper> records = examPaperService.queryExams(suberid, pageNo, pageSize);
            model.addAttribute("pagedata", records);
        } catch (Exception e) {
            return "redirect: /user/test.do";
        }
        return "added";
    }

    /**
     * 统计问卷调查结果 试卷编号->统计
     *
     * @return
     */
    @RequestMapping("/tongji")
    public String tongji(int examid, Model model) {
        try {
            // 查询问卷调查的结果（统计结果）
            TestExamPaperView record = examPaperService.queryExamViews(examid);
            model.addAttribute("paper", record);
        } catch (Exception e) {
            return "redirect:/user/test.do";
        }
        return "tongji";
    }

    /**
     * 请求做试卷 试卷编号->试卷详细内容
     *
     * @return
     */
    @RequestMapping("/doexam")
    public String doexam(int examid, Model model) {
        try {
            // 查询问卷调查的结果（统计结果）
            TestExamPaperView record = examPaperService.queryExamViews(examid);
            model.addAttribute("paper", record);
        } catch (Exception e) {
            return "redirect:/user/test.do";
        }
        return "doexam";
    }

    /**
     * 提交问卷调查
     *
     * @return
     */
    @RequestMapping("/submitexam")
    @ResponseBody
    public String submitexam(@RequestBody String param) {
        System.out.println(param);
        Gson gson = new Gson();
        java.util.List<Map<String, String>> data =
                gson.fromJson(param, new ArrayList<Map<String, String>>().getClass());
        boolean flag = examPaperService.doExam(data);
        return flag ? "success" : "error";
    }

}
