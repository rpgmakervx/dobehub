<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>DobeHub</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel='stylesheet' href='<%=basePath%>assets/css/bootstrap.min.css' />
  <link rel='stylesheet' href='<%=basePath%>assets/css/font-awesome.min.css' />
  <link rel='stylesheet' href='<%=basePath%>assets/css/style.css' />
  <link rel='stylesheet' href='<%=basePath%>assets/css/chat.css' />
  <script type="text/javascript" src="<%=basePath%>assets/js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>assets/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>assets/js/posfixed.js"></script>
  <script type="text/javascript" src="<%=basePath%>assets/js/global.js"></script>
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
          <li id="action" class="items">
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
              <span class="icon-coffee"></span>&nbsp;每日一逗
            </a>
          </li>
          <li id="chat" class="items active">
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
                  <p>搜点儿大众化的，否则没结果啊</p>
                  <p id="syn-content"></p>
                  <ul class="dropdown-list">
                    <li class="result"><a>求一名Java开发者</a></li>
                    <li class="result"><a>求一名Java开发者</a></li>
                    <li class="result"><a>求一名Java开发者</a></li>
                    <li class="result"><a>求一名Java开发者</a></li>
                  </ul>
                </div>
                <div class="mod-foot">
                  <p>若没搜到结果，怪我咯？去&nbsp<a href="#">问答</a>&nbsp版块问！</p>
                </div>
              </div>
            </form>
          </li>
          <!-- 搜索框列-->
          <!-- 头像列-->
          <li id="userimg-li">
            <a href="#" id="img-link">
              <img class="user-img" id="nav-user-img" src="<%=basePath%>assets/images/caty.jpg" />
            </a>
          </li>
          <!-- 头像列-->
          <!-- 打卡签到-->
          <li id="sign-in-li">
            <button class="btn sign-in-btn btn-background-yellow">
              <i id="sign-in-icon" class="glyphicon glyphicon-pencil btn-icon"></i>
              <span id="sign-in-txt" class="btn-txt">签到</span>
            </button>
          </li>
        </ul>
      </div>
      <!-- 右侧辅助功能导航头-->
    </div>
  </nav>
  <div class="content-body " id="chatroom">
    <div class="container chatroom-body">
      <div class="col-sm-9 blackboard content-board" id="talk-board">
        <div class="board-descripter" id="chat-board-descripter">
                      <span class="description" id="chat-descript-txt">
                          逗比竞技场
                      </span>
        </div>
        <div class="content-msg" id="users-msgs">
          <div class="list-board">
            <ul class="message-list">
              <li class="message">
                <div class="msg-body">
                  <div class="img-block" id="img-block">
                    <img class="user-img other-message-img" src="<%=basePath%>assets/images/caty.jpg" />
                  </div>
                  <div class="message-block other-message-block">
                    <div class="arrow  other-chat-arrow"></div>
                                          <span class="msg-entity">
                                              你是猴子请来的逗比吗？
                                              你是猴子请来的逗比吗？
                                              你是猴子请来的逗比吗？
                                              你是猴子请来的逗比吗？
                                              你是猴子请来的逗比吗？
                                              你是猴子请来的逗比吗？
                                              你是猴子请来的逗比吗？
                                              你是猴子请来的逗比吗？
                                          </span>
                  </div>
                </div>
              </li>
              <li class="message">
                <div class="msg-body">
                  <div class="img-block my-img-block" >
                    <img class="user-img" src="<%=basePath%>assets/images/caty.jpg" />
                  </div>
                  <div class="message-block my-message-block">
                    <div class="arrow my-chat-arrow" ></div>
                                          <span class="msg-entity">
                                              然并卵
                                              然并卵
                                              然并卵
                                              然并卵
                                              然并卵
                                              然并卵
                                              然并卵
                                              然并卵
                                              然并卵
                                          </span>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-sm-3 online content-board" id="online-board">
        <div class="board-descripter" id="online-board-descripter">
                      <span class="description" id="chat-online-txt">
                          在线逗比
                      </span>
        </div>
        <div class="online-user-board" id="online-user-board">
          <ul class="online-list" id="online-list">
            <li class="online-dobe">
              <img class="user-img" id="message-img" src="<%=basePath%>assets/images/caty.jpg" />
              <span class="username-lab">你爸爸</span>
            </li>
            <li class="online-dobe">
              <img class="user-img" id="message-img" src="<%=basePath%>assets/images/caty.jpg" />
              <span class="username-lab">尼达液</span>
            </li>
            <li class="online-dobe">
              <img class="user-img" id="message-img" src="<%=basePath%>assets/images/caty.jpg" />
              <span class="username-lab">草泥马</span>
            </li>
            <li class="online-dobe">
              <img class="user-img" id="message-img" src="<%=basePath%>assets/images/caty.jpg" />
              <span class="username-lab">汉尼拔</span>
            </li>
            <li class="online-dobe">
              <img class="user-img" id="message-img" src="<%=basePath%>assets/images/caty.jpg" />
              <span class="username-lab">汉尼拔</span>
            </li>
            <li class="online-dobe">
              <img class="user-img" id="message-img" src="<%=basePath%>assets/images/caty.jpg" />
              <span class="username-lab">汉尼拔</span>
            </li>

          </ul>
        </div>
      </div>
    </div>
    <input type="text" placeholder="what are you 弄啥嘞？" id="send-input"/>
  </div>
  </div>
</body>
</html>

