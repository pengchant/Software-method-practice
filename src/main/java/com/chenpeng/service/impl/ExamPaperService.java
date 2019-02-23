package com.chenpeng.service.impl;

import com.chenpeng.dao.AnsweritemMapper;
import com.chenpeng.dao.QuestionMapper;
import com.chenpeng.dao.QuitemMapper;
import com.chenpeng.dao.TestPaperMapper;
import com.chenpeng.domain.*;
import com.chenpeng.service.IExamPaperService;
import com.chenpeng.utils.UtilTools;
import com.chenpeng.view.ExamPaper;
import com.chenpeng.view.QuestionView;
import com.chenpeng.view.TestExamPaperView;
import com.chenpeng.view.WJQuestion;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service("examPaperService")
public class ExamPaperService implements IExamPaperService {


    // 试卷操作接口
    @Resource
    private TestPaperMapper testPaperMapper;

    // 问题接口
    @Resource
    private QuestionMapper questionMapper;

    // 问题选项接口
    @Resource
    private QuitemMapper quitemMapper;

    // 问答数据操作接口
    @Resource
    private AnsweritemMapper answeritemMapper;


    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public Boolean addExamPaper(ExamPaper paper, Account account) {
        if (paper != null && account != null) {
            // 标记试卷编号
            int testPaperId = -1;
            // 标记试题编号
            int questionId = -1;
            try {
                // 添加试卷信息
                TestPaper testPaper = new TestPaper();
                testPaper.setTitle(paper.getTitle());
                testPaper.setStarttime(UtilTools.parseString(paper.getStarttime()));
                testPaper.setEndtime(UtilTools.parseString(paper.getEndtime()));
                testPaper.setSuber(account.getId());
                testPaper.setHastested(0);
                // 1.执行录入试卷操作
                testPaperMapper.insertSelective(testPaper);
                testPaperId = testPaper.getId();
                // 添加题目(添加试题选项)
                if (testPaperId > 0) {
                    List<WJQuestion> wjQuestions = paper.getQuestions();
                    if (wjQuestions != null && wjQuestions.size() > 0) {
                        for (WJQuestion q : wjQuestions) {
                            // 新增题目
                            Question question = new Question();
                            question.setPaperid(testPaperId);// 设置试卷编号
                            question.setContent(q.getContent());// 题目题干
                            question.setType(Short.valueOf(q.getType())); // 设置试卷类型
                            // 2.执行录入题目操作
                            questionMapper.insertSelective(question);
                            questionId = question.getId();

                            // 录入题目选项
                            List<String> items = q.getItems();
                            if (items != null && items.size() > 0) {
                                for (int i = 0; i < items.size(); i++) {
                                    Quitem quitem = new Quitem();
                                    quitem.setQuestionid(questionId); // 设置题目编号
                                    quitem.setContent(items.get(i));
                                    quitem.setCounter(0);
                                    quitem.setNum((i + 1));
                                    // 3.执行录入选项操作
                                    quitemMapper.insertSelective(quitem);
                                }
                            }
                        }
                        return true;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    /**
     * 查询已经添加的问卷
     *
     * @param suberid
     * @param pageNo
     * @param pageSize
     * @return
     */
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public PageInfo<TestPaper> queryExams(int suberid, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        PageInfo<TestPaper> testPaperPageInfo = new PageInfo<>(testPaperMapper.selectAddedPaper(suberid));
        return testPaperPageInfo;
    }

    /**
     * 查询试卷内容
     *
     * @param paperid
     * @return
     */
    @Override
    public TestExamPaperView queryExamViews(int paperid) {
        TestExamPaperView _record = null;
        // 查询试卷
        TestPaper paper = testPaperMapper.selectByPrimaryKey(paperid);
        if (paper != null) {
            _record = new TestExamPaperView();
            _record.setTestPaper(paper);
            // 查询题目
            List<Question> questions = questionMapper.selecExamQuestions(paperid);
            if (questions != null & questions.size() > 0) {
                List<QuestionView> _questionViews = new ArrayList<>();
                // 遍历问题
                for (Question q : questions) {
                    QuestionView _question = new QuestionView();
                    _question.setQuestion(q);
                    // 加载选项
                    List<Quitem> quitems = quitemMapper.selectQuestionItems(q.getId());
                    // 加载问答内容
                    List<Answeritem> answeritems = answeritemMapper.selectAnswers(q.getId());
                    _question.setAnsweritems(answeritems);
                    _question.setSelectItemList(quitems);
                    _questionViews.add(_question);
                }
                _record.setQuestionListdata(_questionViews);
            }
        }
        return _record;
    }

    /**
     * 做题
     *
     * @param data
     * @return
     */
    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public boolean doExam(List<Map<String, String>> data) {
        try {
            if (data != null) {
                for (Map<String, String> e : data) {
                    String key = e.get("name");
                    if (StringUtils.equals(key, "paperid")) {// 如果是试卷的编号
                        // 1.更新试卷答题人数
                        int paperid = Integer.valueOf(e.get("value"));
                        TestPaper paper = testPaperMapper.selectByPrimaryKey(paperid);
                        paper.setHastested(paper.getHastested() + 1);
                        testPaperMapper.updateByPrimaryKeySelective(paper);
                    } else if (StringUtils.contains(key, "ss_")
                            || StringUtils.contains(key, "ms_")) { // 如果是单选/多选
                        // 2.更新单选选项答题人数
                        int quitemid = Integer.valueOf(e.get("value"));
                        Quitem quitem = quitemMapper.selectByPrimaryKey(quitemid);
                        quitem.setCounter(quitem.getCounter() + 1);
                        quitemMapper.updateByPrimaryKeySelective(quitem);
                    } else if (StringUtils.contains(key, "wd_")) { // 如果是问答
                        // 3.添加问答内容
                        int questionid = Integer.valueOf(e.get("name").split("_")[1]);
                        Answeritem answeritem = new Answeritem();
                        answeritem.setQuestionid(questionid);
                        answeritem.setContent(e.get("value"));
                        answeritemMapper.insert(answeritem);
                    }
                }
                return true;
            }
        } catch (Exception e) {
            return false;
        }
        return false;
    }

}
