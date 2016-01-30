<%--
  Copyright 2014-2015 the original BZTWT
  Created by QianLong
  User: QianLong
  Date: 2016/1/12
  Time: 15:50
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <title>，欢迎光临DobeHub</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=0,user-scalable=0">
  <link rel='stylesheet' href='assets/css/bootstrap.min.css' />
  <link rel='stylesheet' href='assets/css/font-awesome.min.css' />
  <link rel='stylesheet' href='assets/css/style.css' />
  <link rel='stylesheet' href='assets/css/index.css' />
  <script type="text/javascript" src="assets/js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="assets/js/jquery.form.js"></script>
  <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="assets/js/posfixed.js"></script>
  <script type="text/javascript" src="assets/js/global.js"></script>
  <script type="text/javascript" src="assets/js/redefine.js"></script>
  <script type="text/javascript" src="assets/js/index.js"></script>
</head>
<body>
<nav class="navbar navbar-default nav_body container" role="navigation">
  <div class="container">
    <!-- 导航头-->
    <div class="navbar-header">
      <a class="navbar-brand" href="#">DobeHub</a>
    </div>
    <!-- 导航头-->
    <!-- 左侧功能导航头-->
    <div class="pull-left">
      <ul class="nav navbar-nav navleft">
        <li id="action" class="items active">
          <a href="javascript:flush('index')">
            <span class="icon-star"></span>&nbsp;动态
          </a>
        </li>
        <li id="ask" class="items">
          <a href="javascript:flush('ask')">
            <span class="icon-quote-left"></span>&nbsp;问答
          </a>
        </li>
        <li id="dayly" class="items">
          <a href="javascript:flush('dayly')">
            <span class="icon-coffee"></span>&nbsp;圈子
          </a>
        </li>
        <li id="chat" class="items">
          <a href="javascript:flush('chat')">
            <span class="icon-comments"></span>&nbsp;群逗竞技场
          </a>
        </li>
        <li id="notify" class="items">
          <a href="javascript:flush('notify')">
            <span class="icon-bell-alt"></span>&nbsp;提醒
          </a>
        </li>
      </ul>
    </div>
    <!-- 左侧主功能导航头-->
    <!-- 右侧辅助功能导航头-->
    <div class="navbar-right search-nav">
      <ul class="nav navbar-nav">
        <!-- 搜索框列-->
        <li id="search-li">
          <form class="navbar-form navbar-left " action="search" role="search">
            <div class="search-box">
              <input type="text" class="form-control input-txt" placeholder="搜一切。。。" />
              <span class="search-icon">
                  <i class="glyphicon glyphicon-search"></i>
              </span>
            </div>
            <div id="dropdown-mod">
              <div class="mod-body">
               <p id="">搜点儿大众化的，否则没结果啊</p>
                <p id="syn-content"></p>
                <ul class="dropdown-list">
                  <li class="result"><a>求一名Java开发者</a></li>
                  <li class="result"><a>求一名Java开发者</a></li>
                  <li class="result"><a>求一名Java开发者</a></li>
                  <li class="result"><a>求一名Java开发者</a></li>
                </ul>
              </div>
              <div class="mod-foot">
                <p>若没搜到结果，怪我咯？去&nbsp<a href="#"><b>问答</b></a>&nbsp版块问！</p>
              </div>
            </div>
          </form>
        </li>
        <!-- 搜索框列-->
        <!-- 头像列-->
        <li id="userimg-li">
          <a href="#" id="img-link">
            <img class="user-img-circle" id="nav-user-img" src="assets/images/caty.jpg" />
          </a>
        </li>
        <!-- 头像列-->
        <!-- 打卡签到-->
        <li id="sign-in-li">
          <button class="btn sign-in-btn btn-yellow">
            <i id="sign-in-icon" class="glyphicon glyphicon-pencil btn-icon"></i>
            <span id="sign-in-txt" class="btn-txt">签到</span>
          </button>
        </li>
      </ul>
    </div>
    <!-- 右侧辅助功能导航头-->
  </div>
</nav>
<div class="content-body">
  <div class="container">
    <div class="row left-board space-9">
      <div class="contents">
        <div id="trend-message-input" class="blackboard">
            <div id="notice-space">
                <span class="notice-txt">今天你遇到什么逗比的事儿了吗~~</span>
            </div>
            <!--表单信息-->
            <textarea id="trend-message-body" name="content" class="message-board"></textarea>
            <div class="utilbar" id="utilbar">
            <span class="img-icon">
                <i class="glyphicon glyphicon-camera icon" id="camera-chooser"></i>
            </span>
                <div class="image-board" id="image-board">
                    <div class="arrow" id="image-arrow"></div>
                    <div class="alert-bar" id="img-alert-bar">
                        <span class="upload-nav">上传照片</span>
                        <span class="glyphicon glyphicon-remove icon close-icon remove" id="img-close-icon"></span>
                    </div>
                    <div class="file-upload-board">
                        <!--表单信息-->
                        <input type="file" id="picture" name="picture"/>
                    </div>
                    <div id="warning-space">
                        <span class="notice-txt" id="file-size-warning">请选择图片文件，2M是最大的限制了~~</span>
                    </div>
                    <!-- 显示上传图片内容 的 面板 -->
                    <div class="show-picture" id="show-picture">
                        <img src="" id='upload-image' class='upload-image'/>
                        <span id='img-remove-icon' class='glyphicon glyphicon-remove icon remove-icon'></span>
                    </div>
                </div>
                <button class="btn sign-in-btn btn-yellow" type="button" onclick="submitAction()" id="publish-btn">
                    <i class="glyphicon glyphicon-file btn-icon"></i>
                    <span id="publish-txt" class="btn-txt">发表</span>
                </button>
            </div>
        </div>
        <div class="modal fade" id="addModal" tabindex="-1" role="dialog"
           aria-labelledby="ModalLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close"
                              data-dismiss="modal" aria-hidden="true">
                          &times;
                      </button>
                      <div align="center" class="modal-title" id="ModalLabel">
                          <h3 >^_^ 您已成功发表一条动态</h3>
                      </div>
                  </div>
              </div><!-- /.modal-content -->
          </div>
        </div> <!-- /.modal -->
      </div>
      <div class="contents">
        <ul class="choose-bar" id="choose-bar">
          <li class="item-box strategy-selected" id="item-box1">
            <a href="#"><span class="item-txt">最新发布</span></a>
          </li>
          <li class="item-box" id="item-box2">
            <a href="#"><span class="item-txt">最高评价</span></a>
          </li>
          <li class="item-box" id="item-box3">
            <a href="#"><span class="item-txt">最多互动</span></a>
          </li>
        </ul>
        <!--2016-01-19日 动态页面 开工  -->
        <div class="contents-body" id="contents-body">
        </div>
      </div>
    </div>

    <div class="row right-board space-3">
      <div class="notice-board" id="announce-board">
        <div class="broadcast-board" id="broadcast-board">
          <div class="board-content">
            <span class="glyphicon glyphicon-remove icon remove" id="announce-remove"></span>
            <P class="content-p"><strong class="btn-txt-yellow">这个真的是公告栏！</strong></P>
            <P class="content-p">1.请大家文明发言，逗比可以，不能人身攻击和发布不良信息哦！详见  <a href="#"><b>违规处理</b></a></P>
            <P class="content-p">2.招募义务管理员，求合伙儿~~</P>
            <P class="content-p">
              <span class="glyphicon glyphicon-comment icon btn-txt-yellow"></span>
              <strong class="btn-txt-yellow advice">我要提建议</strong>
            </P>
            <P class="content-p">
              <span class="icon-group icon btn-txt-yellow"></span>
              <strong class="btn-txt-yellow advice">邀请朋友参观DobeHub</strong>
            </P>
          </div>
        </div>
      </div>
      <div id="recommend-board" class="board">
        <div class="mod-head">
          <h4>逗比排行榜</h4>
        </div>
        <div class="mod-body">
          <dl>
            <dt class="pull-left"><img class="user-img-circle"  src="assets/images/caty.jpg" /></dt>
            <dd class="pull-left">
              <a href="#" class="username-lab15">code4j</a>
              <p>
                <b>100</b>点活跃度，<b>50</b>个逗币
              </p>
            </dd>
          </dl>
          <dl>
            <dt class="pull-left"><img class="user-img-circle"  src="assets/images/caty.jpg" /></dt>
            <dd class="pull-left">
              <a href="#" class="username-lab15">大逗逼</a>
              <p>
                <b>300</b>点活跃度，<b>500</b>个逗币
              </p>
            </dd>
          </dl>
          <dl>
            <dt class="pull-left"><img class="user-img-circle"  src="assets/images/caty.jpg" /></dt>
            <dd class="pull-left">
              <a href="#" class="username-lab15">国际鉴黄师</a>
              <p>
                <b>30</b>点活跃度，<b>12</b>个逗币
              </p>
            </dd>
          </dl>
          <dl>
            <dt class="pull-left"><img class="user-img-circle"  src="assets/images/caty.jpg" /></dt>
            <dd class="pull-left">
              <a href="#" class="username-lab15">国际鉴黄师</a>
              <p>
                <b>30</b>点活跃度，<b>12</b>个逗币
              </p>
            </dd>
          </dl>
          <dl>
            <dt class="pull-left"><img class="user-img-circle"  src="assets/images/caty.jpg" /></dt>
            <dd class="pull-left">
              <a href="#" class="username-lab15">国际鉴黄师</a>
              <p>
                <b>30</b>点活跃度，<b>12</b>个逗币
              </p>
            </dd>
          </dl>
        </div>
        <a href="#" class="interest-more">查看更多>></a>
      </div>
      <div id="hottopic-board" class="board">
        <div class="mod-head">
          <h5 class="circles">热门圈子</h5>
        </div>
        <div class="mod-body">
          <dl>
            <dd class="pull-left">
              <a href="#" class="username-lab15">逗比</a>
              <p>
                <b>103</b>关注，<b>130</b>个互动
              </p>
            </dd>
          </dl>
          <dl>
            <dd class="pull-left">
              <a href="#" class="username-lab15">逗比</a>
              <p>
                <b>103</b>关注，<b>130</b>个互动
              </p>
            </dd>
          </dl>
          <dl>
            <dd class="pull-left">
              <a href="#" class="username-lab15">逗比</a>
              <p>
                <b>103</b>关注，<b>130</b>个互动
              </p>
            </dd>
          </dl>
        </div>
        <a href="#" class="interest-more">查看更多>></a>
      </div>
    </div>
  </div>
</div>
</body>
</html>