<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="../public/header_top.jsp" %>
<link href="../../ZUI/lib/datetimepicker/datetimepicker.min.css" rel="stylesheet">
<style>

    .m_a {
        text-decoration: none;
        color: white;
    }

    .m_a:hover {
        color: white;
        text-decoration: none;
    }

    .m_banner {
        height: 80px;
        background: #3280fc;
        font-size: 17px;
        color: white;
    }

    .logo {
        line-height: 80px;
        font-size: 19px;
    }

    .navfunc {
        line-height: 90px;
        font-size: 15px;
    }

</style>
<%@include file="../public/header_title.jsp" %>
<nav class="m_banner">
    <div class="container">
        <div class="logo pull-left">
            <i class="icon icon-group"></i>毕业问卷调查系统
        </div>
        <div class="pull-right navfunc">
            欢迎<span>${sessionScope.account.uname}</span>,
            <a href="/user/test.do" class="m_a">退出登录</a>
        </div>
    </div>
</nav>
<div class="container" style="margin-top:20px;">
    <div class="row">
        <div class="col-md-3">
             <%@include file="../public/navcommon.jsp" %>
        </div>
        <div class="col-md-9">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    出题
                </div>
                <div class="panel-body">
                    <form action="" class="form-horizontal">
                        <!-- ////////////////试卷主要信息部分///////////////// -->
                        <fieldset>
                            <legend class="text-primary" style="font-size: 13px;">试卷主要信息部分</legend>
                            <!-- 输入试卷标题 -->
                            <div class="form-group">
                                <label for="papertitle" class="col-sm-2">输入试卷标题</label>
                                <div class="col-md-7 col-sm-11">
                                    <input type="text" class="form-control" id="papertitle" placeholder="输入试卷标题">
                                </div>
                            </div>
                            <!-- 选择问卷调查开始/结束时间 -->
                            <div class="form-group">
                                <label class="col-sm-2">开始/结束时间</label>
                                <div class="col-md-3 col-sm-5">
                                    <input type="text" class="form-control form-date" id="starttime"
                                           placeholder="选择/输入开始时间">
                                </div>
                                <div class="col-md-1 col-sm-1" style="text-align: center;">
                                    <span>至</span>
                                </div>
                                <div class="col-md-3 col-sm-5">
                                    <input type="text" class="form-control form-date" id="endtime"
                                           placeholder="选择/输入结束时间">
                                </div>
                            </div>
                        </fieldset>

                        <!-- /////////////////试卷具体内容////////////////// -->
                        <fieldset style="min-height: 200px;">
                            <legend class="text-success" style="font-size: 13px;">试卷具体内容</legend>

                            <!-- ///////////////////////////已出题部分//////////////////////////// -->
                            <p>
                            <div class="container" id="my_question" style="font-size: 13px;font-weight: 700;">
                                <!-- 动态加载试题 -->
                                <div style="text-align: center;">
                                    <span class="text-blue">暂无题目</span>
                                </div>
                            </div>
                            </p>

                            <hr>

                            <!-- 选择题型 -->
                            <div class="form-group">
                                <label for="questiontype" class="col-sm-2">选择题型</label>
                                <div class="col-md-6 col-sm-10">
                                    <select class="form-control" id="questiontype">
                                        <option value="0">单选题</option>
                                        <option value="1">多选题</option>
                                        <option value="2">问答题</option>
                                    </select>
                                </div>
                            </div>

                            <!-- 填写题目内容 -->
                            <div class="main-content">
                                <div class="form-group">
                                    <label class="col-md-2">输入题干</label>
                                    <div class="col-md-6 col-sm-10">
                                        <input type="text" id="questioncontent" class="form-control" placeholder="输入题干">
                                    </div>
                                </div>

                                <!-- 选项内容 -->
                                <div class="container">
                                    <div class="col-md-1">
                                    </div>
                                    <div class="col-md-10">
                                        <ul style="list-style:none;" id="adding_selectitem">
                                            <!-- 动态添加内容 -->
                                        </ul>
                                    </div>
                                </div>

                                <!-- 单选题/多选题 -->
                                <div class="select-question" id="select_question_item">
                                    <div class="form-group">
                                        <label class="col-md-2">*选项</label>
                                        <div class="col-md-4 col-sm-10">
                                            <input id="selectItemContent" type="text" class="form-control"
                                                   placeholder="输入选项内容">
                                        </div>
                                        <div class="col-md-2">
                                            <button type="button" class="btn btn-circle" id="addSelectItem"><i
                                                    class="icon icon-plus"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </fieldset>


                        <div style="text-align: center;margin-top:20px;">
                            <button type="button" id="add_question_pap" class="btn btn-primary">添加问答</button>
                            <button type="button" id="clear_allquestion" class="btn btn-danger">清空出题</button>
                        </div>

                        <hr>

                        <div style="text-align: center;">
                            <button type="button" class="btn btn-warning" id="generate_paper">确定生成试卷</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../public/footer_foot.jsp" %>
<script src="../../ZUI/lib/datetimepicker/datetimepicker.min.js"></script>
<script src="../../static/js/common.js"></script>
<script>
    $(function () {

        // 定义问题列表
        var _questionlist = new Array();

        // 定义试卷的数据结构
        var testpaper = {
            title: "", // 试卷标题
            starttime: "", // 试卷开始时间
            endtime: "", // 试卷结束时间
            questions: _questionlist, // 试卷问题
        };

        // 定义问题对象
        function wjquestion(content, type, items) {
            this.content = content; // 题干
            this.type = type; // 题目类型:0:单选，1:多选，2:问答
            this.items = items; // 题目选项，如果为问答，则没有选项items.size == 0
        };

        // 定义当前编辑的对象
        var currentQues = new wjquestion('', '0', []);

        // 单选内容
        var danxuan = ["  <li class=\"container-fluid\"> ",
            "   <div class=\"col-md-5\"> ",
            "    <input type=\"radio\" name=\"wj_dax_item\" />",
            "    <span class=\"item_content\"></span> ",
            "    <a class=\"text-danger pull-right item_remove_btn\"><i class=\"icon icon-remove\"></i></a> ",
            "   </div> </li>"].join("");

        // 多选内容
        var duoxuan = ["<li class=\"container-fluid\">",
            "<div class=\"col-md-5\">",
            "<input type=\"checkbox\" name=\"wj_ms_item\"><span class=\"item_content\"></span>",
            "<a class=\"text-danger pull-right item_remove_btn\"><i class=\"icon icon-remove\"></i></a>",
            "</div>",
            "</li>"].join("");

        // 添加选项
        var $select_wrapper = $("#adding_selectitem");
        $("#addSelectItem").on("click", function () {
            addQuestion_selectitem();
        });

        $("#selectItemContent").bind('keydown', function (event) {
            if (event.keyCode == "13") {
                addQuestion_selectitem();
            }
        });

        function addQuestion_selectitem() {
            if ($("#selectItemContent").val().trim() != "") {
                var question = $("#selectItemContent").val().trim();
                // 追加内容
                if (currentQues.type == "0") { // 如果为单选
                    var $new = $(danxuan);
                    $new.find("span.item_content").html(question);
                    $select_wrapper.append($new);
                } else if (currentQues.type == "1") { // 如果为多选
                    var $new = $(duoxuan);
                    $new.find("span.item_content").html(question);
                    $select_wrapper.append($new);
                }
                // 绑定删除选项事件
                $("a.item_remove_btn").unbind().bind("click", function () {
                    $(this).parents("li.container-fluid").remove();
                });
            }
            $("#selectItemContent").val("");
        }


        // 仅选择日期
        $(".form-date").datetimepicker(
            {
                language: "zh-CN",
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                minView: 2,
                forceParse: 0,
                format: "yyyy-mm-dd"
            });

        // 监听选项变化
        $("#questiontype").on("change", function (e) {
            var target = e.target.value;
            // 标记当前出题的内容
            currentQues.type = target;
            // 情况选项
            $select_wrapper.empty();
            $("#questioncontent").val("");
            if (target == "0" || target == "1") { // 如果是选择题
                $("#select_question_item").show();
            } else if (target == "2") { // 如果是问答题
                $("#select_question_item").hide();
            }
        })

        // 添加问题
        $("#add_question_pap").on("click", function () {
            addQuestion();
        });

        function addQuestion() {
            var new_item = new wjquestion(
                $("#questioncontent").val().trim(),
                currentQues.type,
                []
            );
            var select_items = new Array();
            $("#adding_selectitem li").each(function () {
                select_items.push($(this).find("span.item_content").text());
            });
            new_item.items = select_items;
            // 添加到问题列表中
            _questionlist.push(new_item);
            $select_wrapper.empty();
            $("#questioncontent").val("");
            console.log(_questionlist);
            // 渲染实体
            showquestions(_questionlist);
        }

        // 清空问题
        $("#clear_allquestion").on("click", function () {
            $select_wrapper.empty();
            $("#questioncontent").val("");
        });

        // 渲染问题
        var $question_wrapper = $("#my_question");
        var exam_selecquestion = ["<div class=\"col-md-10\">",
            "                                    <div>",
            "                                        第<span class=\"exam_no\"></span>题",
            "                                        <span class=\"exam_content\">",
            "",
            "                                        </span>",
            "                                        <button type=\"button\" class=\"btn btn-danger pull-right del_exam_item\">删除",
            "                                        </button>",
            "                                    </div>",
            "                                    <div>",
            "                                        <ul style=\"list-style:none;\" class=\"exam_selectitem\">",
            "                                        </ul>",
            "                                    </div>",
            "                                </div>"].join("");

        var exam_danxuan = ["<li>",
            " <input type=\"radio\" name=\"exam_demodx_item\"> <span class=\"exam_selec_item\"> </span>",
            "</li>"].join("");

        var exam_duoxuan = ["<li>",
            " <input type=\"checkbox\" name=\"exam_demoms_item\"> <span class=\"exam_selec_item\"> </span>",
            "</li>"].join("");

        var exam_wenda = ["<div class=\"col-md-10\">",
            "                                    <div>",
            "                                        第<span class=\"exam_no\"></span>题",
            "                                        <span class=\"exam_content\"> ",
            "                                        </span>",
            "                                        <button type=\"button\" class=\"btn btn-danger pull-right del_exam_item\">删除",
            "                                        </button>",
            "                                    </div>",
            "                                    <div class=\"container\">",
            "                                        <textarea class=\"form-control\" name=\"ds\" id=\"\" cols=\"8\" rows=\"2\"></textarea>",
            "                                    </div>",
            "                                </div>"].join("");


        Array.prototype.indexOfQS = function (val) {
            for (var i = 0; i < this.length; i++) {
                if (this[i].content == val) return i;
            }
            return -1;
        };

        Array.prototype.removeQS = function (val) {
            var index = this.indexOfQS(val);
            if (index > -1) {
                this.splice(index, 1);
            }
        };

        function showquestions(questionlist) {
            if (questionlist instanceof Array) {
                $question_wrapper.empty();
                // 加载内容
                for (var i = 0; i < questionlist.length; i++) {
                    var _question = questionlist[i];
                    if (_question instanceof wjquestion) {
                        if (_question.type == "0") { // 如果是单选
                            var $new = $(exam_selecquestion);
                            // 试题编号
                            $new.find("span.exam_no").text((i + 1));
                            // 试题内容
                            $new.find("span.exam_content").text(_question.content);
                            // 选择题选项
                            var _items = _question.items;
                            for (var j = 0; j < _items.length; j++) {
                                var $_new_question_item = $(exam_danxuan);
                                $_new_question_item.find("span.exam_selec_item").text(_items[j]);
                                $_new_question_item.find("input").attr("name", "exam_demodx_item" + (i + 1));
                                // 加载选项
                                $new.find("ul.exam_selectitem").append($_new_question_item);
                            }
                            $question_wrapper.append($new);
                        } else if (_question.type == "1") { // 如果是多选
                            var $new = $(exam_selecquestion);
                            // 试题编号
                            $new.find("span.exam_no").text((i + 1));
                            // 试题内容
                            $new.find("span.exam_content").text(_question.content);
                            // 选择题选项
                            var _items = _question.items;
                            for (var j = 0; j < _items.length; j++) {
                                var $_new_question_item = $(exam_duoxuan);
                                $_new_question_item.find("span.exam_selec_item").text(_items[j]);
                                $_new_question_item.find("input").attr("name", "exam_demoms_item" + (i + 1));
                                // 加载选项
                                $new.find("ul.exam_selectitem").append($_new_question_item);
                            }
                            $question_wrapper.append($new);
                        } else if (_question.type == "2") { // 如果是问答
                            var $new = $(exam_wenda);
                            // 试题编号
                            $new.find("span.exam_no").text((i + 1));
                            // 试题内容
                            $new.find("span.exam_content").text(_question.content);
                            $question_wrapper.append($new);
                        }
                    }
                }
            }
            // 绑定事件
            $("button.del_exam_item").unbind().bind("click", function () {
                var text = $(this).parent().find("span.exam_content").text().trim();
                // 删除元素
                _questionlist.removeQS(text);
                // 重新渲染
                showquestions(_questionlist);
            });
        }

        // 生成试卷
        $("#generate_paper").on("click", function () {
            testpaper.title = $("#papertitle").val();
            testpaper.starttime = $("#starttime").val();
            testpaper.endtime = $("#endtime").val();
            $.ajax({
                url: "/exam/addpaper.do",
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                type: "post",
                data: JSON.stringify(testpaper)
            }).done(function (msg) {
                if (msg == "success") {
                    alert("插入成功!");
                    // 清空页面元素
                    $("#papertitle").val("");
                    $("#starttime").val("");
                    $("#endtime").val("");
                    $("#my_question").empty();
                    $("#clear_allquestion").click();
                    _questionlist=[];
                } else {
                    alert("操作失败！")
                }
            });
        });
    });
</script>
<%@include file="../public/footer_bottom.jsp" %>