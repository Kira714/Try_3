<%@page import="java.sql.*"%>
<%@page import="SourceCode.DbConnection" %>
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
                            <li style="font-size: 26px; font-family: serif ; color: white">Detection of suicide-related posts in Twitter data streams in Social Networks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>

                            <!-- User Account: style can be found in dropdown.less -->
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="img\admin.png" class="user-image" alt="User Image"/>
                                    <span class="hidden-xs">Admin</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="img\admin.png" class="img-circle" alt="User Image" />
                                        <p>
                                            Admin
                                            <small></small>
                                        </p>
                                    </li>

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
                            <img src="img\admin.png" class="img-circle"  alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>Admin</p>

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
                    <ul class="sidebar-menu">
                        <li class="header" style="color: #fefefe">MAIN NAVIGATION</li>
                        <li class="active treeview">
                            <a href="admin_home.jsp">
                                <span>User Details</span>
                            </a>
                            <a href="user_stress.jsp">
                                <span>User Stress Level</span>
                            </a>
                            <a href="over_stress.jsp">
                                <span>Overall Stress Level</span>
                            </a>
                        </li>
                </section>
            </aside>
            <div class="content-wrapper">
                <!------------------------------------------------------ Content Header (Page header) ------------------------>
                <div style="width:100%;" align="center" class="container">
                    <div style="float:left; width:100%; background-color: #ccc; " >
                        <div style="background-color: #fefefe">
                            <font style="font-family: cursive; color: #269abc "><strong><font size="5">Detect Stress State of the User</font></strong></font><br><br>
                            <table>
                                <tr>
                                    <th style="text-align: center;width: 200px; font-size: 16px; color: black">User ID</th>
                                    <th style="text-align: center;width: 200px; font-size: 16px; color: black">User Name</th>
                                    <th style="text-align: center;width: 400px;  font-size: 16px; color: black">Email</th>
                                    <th style="text-align: center;width: 300px;  font-size: 16px; color: black">City</th>
                                    <th style="text-align: center;width: 200px;  font-size: 16px; color: black">Country</th>
                                    <th style="text-align: center;width: 200px;  font-size: 16px; color: black">Checking Stress Level</th>
                                </tr>
                                <tr>
                                    <%
                                        Connection con = DbConnection.getConnection();
                                        Statement st = con.createStatement();
                                        try {
                                            ResultSet rs = st.executeQuery("select * from register");
                                            while (rs.next()) {
                                    %>
                                    <td style="font-size: 16px"><center><%=rs.getString("id")%></center></td>   
                                <td style="font-size: 16px"><center><%=rs.getString("username")%></center></td>   
                                <td style="font-size: 16px"><center><%=rs.getString("email")%></center></td>  
                                <td style="font-size: 16px"><center><%=rs.getString("city")%></center></td>  
                                <td style="font-size: 16px"><center><%=rs.getString("country")%></center></td>
                                <td style="font-size: 16px"><center><a href="user_stress1.jsp?userid=<%=rs.getString("id")%>">Check</a></center></td>
                                </tr>
                                <%
                                        }
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }

                                %>

                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!------------------------------------------------------ Content Header (Page header) ------------------------>
        </div><!-- /.content-wrapper -->

        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> 2.0
            </div>
            <strong>Copyright &copy; 2017-2018 <a href="#">jp</a>.</strong>
        </footer>
    </div>

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



