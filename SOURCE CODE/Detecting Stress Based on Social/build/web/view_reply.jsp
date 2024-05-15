<%@page import="SourceCode.DbConnection"%>
<%@page import="java.sql.*"%>
<%
    String email = (String) session.getAttribute("semail");
    String name = null, id = null, country = null;
    Connection con = DbConnection.getConnection();
    Statement st = con.createStatement();
    try {
        ResultSet rs = st.executeQuery("select * from register where email='" + email + "'");
        if (rs.next()) {
            name = rs.getString("username");
            id = rs.getString("id");
            country = rs.getString("country");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Detection of suicide-related posts in Twitter data streams </title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <link href="plugins/morris/morris.css" rel="stylesheet" type="text/css" />
        <link href="plugins/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <link href="plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
        <link href="dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
        <style>
            .container .box{
                width: 100px;
                float: left; 
                margin: 2px;
                padding: 5px;
                border: 1px solid #ccc;
                text-align: center;
            }

            /*Fade all the DIV when user hovers on any div*/
            .container:hover .box{
                zoom: 1;
                filter: alpha(opacity=45);
                opacity: 0.45;
                -webkit-transition: opacity .5s ease-in-out;
                -moz-transition: opacity .5s ease-in-out;
                -ms-transition: opacity .5s ease-in-out;
                -o-transition: opacity .5s ease-in-out;
                transition: opacity .5s ease-in-out;
            }

            /*Fade out the particular DIV when user hover on that DIV*/
            .container .box:hover{
                box-shadow: 3px 3px 15px #666;
                border-color:#C76C0C;
                background: #C76C0C;
                color: #fff;
                cursor: pointer;

                /*Opacity*/
                zoom: 1;
                filter: alpha(opacity=100);
                opacity: 1;
            }
        </style>
        <style>
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }
            .modal-content {
                background-color: #fefefe;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 30%;
            }
            .close {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
            #aaa:hover
            {
                color: red;
            }
            #bb:hover{
                color: #7ed321;
            }
            #ccc:hover{
                color: #00abf0;
            }

        </style>

        <style>
            .modal1 {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }
            .modal-content1 {
                background-color: #fefefe;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 30%;
            }
            .close1 {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close1:hover,
            .close1:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
        <style>
            .modal2 {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }
            .modal-content2 {
                background-color: #fefefe;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 30%;
            }
            .close2 {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close2:hover,
            .close2:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
        <script>
            function countChar(val) {
                var len = val.value.length;
                if (len >= 140) {
                    val.value = val.value.substring(0, 140);
                } else {
                    $('#charNum').text(140 - len);
                }
            };
        </script>
    </head>
    <body class="skin-blue">
        <div class="wrapper">
            <header class="main-header">
                <a href="index2.html" class="logo"><img src="img\icon.png" width="64" height="64"></a>
                <nav class="navbar navbar-static-top" role="navigation">
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                    </a>
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <li style="font-size: 26px; font-family: serif ; color: white">Detection of suicide-related posts in Twitter data streams in Social Networks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                            <li class="dropdown messages-menu">
                                <a href="view_reply.jsp" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-envelope-o"></i>
                                    <span class="label label-success">444</span>
                                </a>

                            </li>

                            <!-- Tasks: style can be found in dropdown.lesssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss -->
                            <li class="dropdown tasks-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img width="30" id="myBtn" height="25" src="img\tweets.png">
                                </a>

                            </li>
                            <!-- User Account: style can be found in dropdown.less -->
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="view_img.jsp?id=<%=id%>" class="user-image" alt="User Image"/>
                                    <span class="hidden-xs"><%=name%></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="view_img.jsp?id=<%=id%>" class="img-circle" alt="User Image" />
                                        <p>
                                            <%=name%>
                                            <small><%=country%></small>
                                        </p>
                                    </li>
                                    <!-- Menu Body -->
                                    <li class="user-body">
                                        <div class="col-xs-4 text-center">
                                            <a href="#">Followers</a>
                                        </div>
                                        <div class="col-xs-4 text-center">
                                            <a href="#">Following</a>
                                        </div>
                                        <div class="col-xs-4 text-center">
                                            <a href="#">Friends</a>
                                        </div>
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-left">
                                            <a href="#" class="btn btn-default btn-flat">Profile</a>
                                        </div>
                                        <div class="pull-right">
                                            <a href="index.jsp" class="btn btn-default btn-flat">Sign out</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel" style="width: 400px">
                        <div class="pull-left image">
                            <img src="view_img.jsp?id=<%=id%>" class="img-circle"  alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p><%=name%></p>

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <center><div>
                            <h3 class="service3"></h3>

                            <font style="font-family: cursive; color: #269abc "><strong><font size="5">View all Friends</font></strong></font><br><br>

                            <%

                                int fid = 0;

                                Connection con2 = null;
                                Statement st2 = null;
                                ResultSet rs2 = null;

                                String sql = "select * from register where email!='" + email + "'";
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/interaction", "root", "root");
                                    st2 = con2.createStatement();
                                    rs2 = st2.executeQuery(sql);
                                    while (rs2.next()) {
                                        fid = rs2.getInt("id");
                                        String fname = rs2.getString("username");
                                        String rid = id + "," + name + "," + Integer.toString(fid) + "," + fname;
                                        Connection con3 = null;
                                        Statement st3 = null;
                                        ResultSet rs3 = null;

                                        String sql3 = "select * from follow where uid='" + id + "' and fid='" + fid + "'";
                                        try//try2
                                        {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/interaction", "root", "root");;
                                            st3 = con3.createStatement();
                                            rs3 = st3.executeQuery(sql3);

                                            if (rs3.next()) {%>
                            <p><font style="font-family: cursive; font-size: 16px; color: white"><%=fname%></p>
                            <img src="view_img_fri.jsp?id=<%=fid%>" width="120" height="120" ><br>
                            <font style="color: #00e765" size="3"><strong><%=rs3.getString("status")%></strong></font>
                            <%} else {%>
                            <p><font style="font-family: cursive; font-size: 16px; color: white"><%=fname%></font></p>
                            <img src="view_img_fri.jsp?id=<%=fid%>" alt="" width="120" height="120" /> <br>
                            <a href="request.jsp?id=<%=rid%>"><font style="color: #5bc0de"  size="3"><strong>Follow</strong></font></a>

                            <%}

                                        } //end try2
                                        catch (Exception e3) {
                                            System.out.println(e3);
                                        }

                                    }

                                } catch (Exception ex) {
                                    System.out.println(ex);
                                } finally {
                                    con2.close();
                                    st2.close();
                                }

                            %>

                        </div></center>
                </section>
            </aside>
            <div class="content-wrapper">
                <!------------------------------------------------------ Content Header (Page header) ------------------------>
                <div style="width:100%;" align="center" class="container">
                    <div style="float:left; width:30%; background-color: #ccc; " >
                        <div style="background-color: #fefefe">
                            <font style="font-family: cursive; color: #269abc "><strong><font size="5">Trends for you</font></strong></font><br>
                            <table align="center" height="174">
                                <%

                                    Connection con11 = null;
                                    Statement st11 = null;
                                    ResultSet rs11 = null;
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        con11 = DriverManager.getConnection("jdbc:mysql://localhost:3306/interaction", "root", "root");
                                        st11 = con11.createStatement();
                                        String sql3 = "SELECT count(msg) as cnt,msg FROM `tweet` group by msg order by cnt DESC";

                                        rs11 = st11.executeQuery(sql3);
                                        while (rs11.next()) {
                                            //rs.getString
                                %>
                                <tr>
                                    <td>
                                        <strong>Message: </strong><p><textarea readonly="" style="width: 300px; height: 80px; border-color: white; color: #6A6CB0"><%=rs11.getString("msg")%></textarea></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br><font style="color: #C76C0C">-----------------------------------------------</font>
                                    </td>
                                </tr>

                                <%}
                                    } catch (Exception e3) {
                                        System.out.println(e3);
                                    }
                                    //}
                                %>
                            </table>
                        </div>
                    </div>
                    <div  style="float:left; width:40%; background-color: #ccc; margin-left: 100px">
                        <center>
                            <div style="background-color: #fefefe">
                                <font style="font-family: cursive; color: #269abc "><strong><font size="5">Public Tweets</font></strong></font><br>
                                <table align="center" height="174">


                                    <%
                                        //while(rs2.next()){
                                        //fid=rs2.getInt("fid");
                                        //fname=rs2.getString("fname");
                                        //System.out.println("friend id"+fid);
                                        Connection con1 = null;
                                        Statement st1 = null;
                                        ResultSet rs1 = null;
                                        String statusb = "Allow";
                                        String setting = "public";
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/interaction", "root", "root");
                                            st1 = con1.createStatement();
                                            String sql3 = "SELECT * FROM tweet ORDER BY `tweet`.`tid` DESC";

                                            rs1 = st1.executeQuery(sql3);
                                            while (rs1.next()) {
                                                //rs.getString
                                    %>

                                    <tr>
                                        <td>
                                            &nbsp;<img src="viewimag.jsp?id=<%=rs1.getInt("uid")%>" alt="" width="50" height="50" />&nbsp;&nbsp; 
                                            <font style="color: #044"><%=rs1.getString("username")%><font>&nbsp;&nbsp; <font style="color: #C76C0C">@<%=rs1.getString("username")%></font>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Message: </strong><p><textarea readonly="" style="width: 400px; height: 90px; border-color: white; color: black"><%=rs1.getString("msg")%></textarea></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src="viewimages.jsp?id=<%=rs1.getInt("tid")%>" alt="" width="400" height="300" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                           
                                            <!-- Modal content Retweet -->
                                            <div id="TweetModal" class="modal1" >
                                                <div class="modal-content1" style="background-color: #5bc0de">
                                                    <span class="close1">&times;</span>
                                                    <div class="form1" style="background-color: #5bc0de">
                                                        <h2 style="font-family: sans-serif; font-size: 16px"><center>Retweet this to your Followers?</center></h2>
                                                        <form action="Tweet" method="post"  enctype="multipart/form-data"><br>
                                                            <center>
                                                                <textarea name="msg" onkeyup="countChar(this)" required="" style="width: 360px; height: 100px; border-bottom-color: #00abf0; color: black"></textarea><br>
                                                                <div id="charNum"></div><br>
                                                                <textarea name="msg" readonly="" style="width: 360px; height: 100px; border-bottom-color: white; color: black;"><%=rs1.getString("username")%> @<%=rs1.getString("username")%><%=rs1.getString("msg")%></textarea><br>
                                                                <input type="file" name="file" /><br>
                                                                <button style="background-color: skyblue">Retweet</button><br>
                                                            </center>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <a href="#" id="Retweet" id="bb"><img height="40" width="40" src="img/retweet.png" onmouseover="this.src='img/retweeted.png';" onmouseout="this.src='img/retweet.png';"/>&nbsp;&nbsp;&nbsp;<%=rs1.getInt("retweet")%></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <a href="likecheck.jsp?id=<%=rs1.getInt("tid")%>" id="aaa" ><img height="40" width="40" src="img/like.PNG" onmouseover="this.src='img/like1.gif';" onmouseout="this.src='img/like.PNG';"/>&nbsp;&nbsp;&nbsp;<%=rs1.getInt("likes")%></a>
                                    <br><font style="color: #C76C0C"><center>----------------------------------------------------------------</center></font>
                                    </td>
                                    </tr>
                                    <%
                                            }
                                        } catch (Exception e3) {
                                            System.out.println(e3);
                                        }

                                    %>
                                </table>
                                <div class="btn_more"><a href="#"></a></div>
                            </div>
                        </center>
                    </div>
                </div>
            </div>
            <!------------------------------------------------------ Content Header (Page header) ------------------------>
        </div><!-- /.content-wrapper -->
        <!-- Modal content -->
        <div id="myModal" class="modal" >
            <div class="modal-content" style="background-color: #5bc0de">
                <span class="close">&times;</span>
                <div class="form" style="background-color: #5bc0de">
                    <h2 style="font-family: sans-serif"><center>Compose New Tweet</center></h2>
                    <form action="Tweet" method="post"  enctype="multipart/form-data"><br>
                        <center>
                            <textarea name="msg" onkeyup="countChar(this)" required="" style="width: 360px; height: 100px; border-bottom-color: #00abf0; color: #269abc"></textarea><br>
                            <div id="charNum"></div><br>
                            <input type="file" name="file" /><br>
                            <button style="color: #000">Tweet</button><br>
                        </center>
                    </form>
                </div>
            </div>
        </div>
        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> 2.0
            </div>
            <strong>Copyright &copy; 2017-2018 <a href="#">jp</a>.</strong>
        </footer>
    </div>
    <script>
        var modal = document.getElementById('myModal');
        var btn = document.getElementById("myBtn");
        var span = document.getElementsByClassName("close")[0];
        btn.onclick = function() {
            modal.style.display = "block";
        }
        span.onclick = function() {
            modal.style.display = "none";
        }
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
    <!-- Modal content Retweet -->
    <script>
        var modal1 = document.getElementById('TweetModal');
        var btn1 = document.getElementById("Retweet");
        var span1 = document.getElementsByClassName("close1")[0];
        btn1.onclick = function() {
            modal1.style.display = "block";
        }
        span1.onclick = function() {
            modal1.style.display = "none";
        }
        window1.onclick = function(event) {
            if (event.target == modal1) {
                modal1.style.display = "none";
            }
        }
    </script>
    <!-- Modal content Reply -->
    <script>
        var modal2 = document.getElementById('ReplyModa12');
        var btn2 = document.getElementById("Reply2");
        var span2 = document.getElementsByClassName("close2")[0];
        btn2.onclick = function() {
            modal2.style.display = "block";
        }
        span2.onclick = function() {
            modal2.style.display = "none";
        }
        window2.onclick = function(event) {
            if (event.target == modal2) {
                modal2.style.display = "none";
            }
        }
    </script>
    <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src='plugins/fastclick/fastclick.min.js'></script>
    <script src="dist/js/app.min.js" type="text/javascript"></script>
    <script src="plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
    <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
    <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
    <script src="plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
    <script src="plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="plugins/iCheck/icheck.min.js" type="text/javascript"></script>
    <script src="plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="plugins/chartjs/Chart.min.js" type="text/javascript"></script>
    <script src="dist/js/pages/dashboard2.js" type="text/javascript"></script>
    <script src="dist/js/demo.js" type="text/javascript"></script>
</body>
</html>

