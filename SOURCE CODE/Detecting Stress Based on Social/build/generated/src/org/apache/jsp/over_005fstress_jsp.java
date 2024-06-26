package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.DecimalFormat;
import java.sql.*;
import SourceCode.DbConnection;

public final class over_005fstress_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");


    Connection con = DbConnection.getConnection();
    Statement st1 = con.createStatement();
    Statement st2 = con.createStatement();
    double t1 = 0, t2 = 0, t3 = 0;
    int a = 0, b = 0;
    double per;
    double stress, normal;
    try {
        ResultSet rs1 = st1.executeQuery("SELECT COUNT(*) AS TweetCount FROM tweet");
        if (rs1.next()) {
            t1 = rs1.getInt("TweetCount");
            System.out.println("Total count of Tweet : " + t1);
            ResultSet rs2 = st2.executeQuery("SELECT COUNT(*) AS StressTweet FROM tweet WHERE stress='Stressd Tweet'");
            if (rs2.next()) {
                t2 = rs2.getInt("StressTweet");
                per = 100 / t1;
                t3 = t1 - t2;
                System.out.println("total Persentage : " + per);
                stress = per * t2;
                System.out.println("Stress Level Persantage : " + stress);
                a = (int) Math.round(stress);
                normal = per * t3;
                System.out.println("Normal Level Persantage : " + normal);
                b = (int) Math.round(normal);
                System.out.println("Integer A and B : " + a + "\t" + b);
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <title>Detecting Stress Based on Social Interactions </title>\n");
      out.write("        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>\n");
      out.write("        <link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <link href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <link href=\"http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <link href=\"plugins/morris/morris.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <link href=\"plugins/jvectormap/jquery-jvectormap-1.2.2.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <link href=\"plugins/daterangepicker/daterangepicker-bs3.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <link href=\"dist/css/AdminLTE.min.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <link href=\"dist/css/skins/_all-skins.min.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("        <script>\n");
      out.write("            window.onload = function() {\n");
      out.write("                var va1 =");
      out.print(a);
      out.write(";\n");
      out.write("                var va2 =");
      out.print(b);
      out.write(";\n");
      out.write("                var chart = new CanvasJS.Chart(\"chartContainer\", {\n");
      out.write("                    animationEnabled: true,\n");
      out.write("                    title: {\n");
      out.write("                        text: \"User Stress Level\"\n");
      out.write("                    },\n");
      out.write("                    data: [{\n");
      out.write("                            type: \"pie\",\n");
      out.write("                            startAngle: 240,\n");
      out.write("                            yValueFormatString: \"##0.00\\\"%\\\"\",\n");
      out.write("                            indexLabel: \"{label} {y}\",\n");
      out.write("                            dataPoints: [\n");
      out.write("                                {y: va1, label: \"Stressed Tweets\"},\n");
      out.write("                                {y: va2, label: \"Normal Tweets\"},\n");
      out.write("                            ]\n");
      out.write("                        }]\n");
      out.write("                });\n");
      out.write("                chart.render();\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("        <style>\n");
      out.write("            .container .box{\n");
      out.write("                width: 100px;\n");
      out.write("                float: left; \n");
      out.write("                margin: 2px;\n");
      out.write("                padding: 5px;\n");
      out.write("                border: 1px solid #ccc;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /*Fade all the DIV when user hovers on any div*/\n");
      out.write("            .container:hover .box{\n");
      out.write("                zoom: 1;\n");
      out.write("                filter: alpha(opacity=45);\n");
      out.write("                opacity: 0.45;\n");
      out.write("                -webkit-transition: opacity .5s ease-in-out;\n");
      out.write("                -moz-transition: opacity .5s ease-in-out;\n");
      out.write("                -ms-transition: opacity .5s ease-in-out;\n");
      out.write("                -o-transition: opacity .5s ease-in-out;\n");
      out.write("                transition: opacity .5s ease-in-out;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /*Fade out the particular DIV when user hover on that DIV*/\n");
      out.write("            .container .box:hover{\n");
      out.write("                box-shadow: 3px 3px 15px #666;\n");
      out.write("                border-color:#C76C0C;\n");
      out.write("                background: #C76C0C;\n");
      out.write("                color: #fff;\n");
      out.write("                cursor: pointer;\n");
      out.write("\n");
      out.write("                /*Opacity*/\n");
      out.write("                zoom: 1;\n");
      out.write("                filter: alpha(opacity=100);\n");
      out.write("                opacity: 1;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        <style>\n");
      out.write("            .modal {\n");
      out.write("                display: none; /* Hidden by default */\n");
      out.write("                position: fixed; /* Stay in place */\n");
      out.write("                z-index: 1; /* Sit on top */\n");
      out.write("                padding-top: 100px; /* Location of the box */\n");
      out.write("                left: 0;\n");
      out.write("                top: 0;\n");
      out.write("                width: 100%; /* Full width */\n");
      out.write("                height: 100%; /* Full height */\n");
      out.write("                overflow: auto; /* Enable scroll if needed */\n");
      out.write("                background-color: rgb(0,0,0); /* Fallback color */\n");
      out.write("                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */\n");
      out.write("            }\n");
      out.write("            .modal-content {\n");
      out.write("                background-color: #fefefe;\n");
      out.write("                margin: auto;\n");
      out.write("                padding: 20px;\n");
      out.write("                border: 1px solid #888;\n");
      out.write("                width: 30%;\n");
      out.write("            }\n");
      out.write("            .close {\n");
      out.write("                color: #aaaaaa;\n");
      out.write("                float: right;\n");
      out.write("                font-size: 28px;\n");
      out.write("                font-weight: bold;\n");
      out.write("            }\n");
      out.write("            .close:hover,\n");
      out.write("            .close:focus {\n");
      out.write("                color: #000;\n");
      out.write("                text-decoration: none;\n");
      out.write("                cursor: pointer;\n");
      out.write("            }\n");
      out.write("            #aaa:hover\n");
      out.write("            {\n");
      out.write("                color: red;\n");
      out.write("            }\n");
      out.write("            #bb:hover{\n");
      out.write("                color: #7ed321;\n");
      out.write("            }\n");
      out.write("            #ccc:hover{\n");
      out.write("                color: #00abf0;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            .modal1 {\n");
      out.write("                display: none; /* Hidden by default */\n");
      out.write("                position: fixed; /* Stay in place */\n");
      out.write("                z-index: 1; /* Sit on top */\n");
      out.write("                padding-top: 100px; /* Location of the box */\n");
      out.write("                left: 0;\n");
      out.write("                top: 0;\n");
      out.write("                width: 100%; /* Full width */\n");
      out.write("                height: 100%; /* Full height */\n");
      out.write("                overflow: auto; /* Enable scroll if needed */\n");
      out.write("                background-color: rgb(0,0,0); /* Fallback color */\n");
      out.write("                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */\n");
      out.write("            }\n");
      out.write("            .modal-content1 {\n");
      out.write("                background-color: #fefefe;\n");
      out.write("                margin: auto;\n");
      out.write("                padding: 20px;\n");
      out.write("                border: 1px solid #888;\n");
      out.write("                width: 30%;\n");
      out.write("            }\n");
      out.write("            .close1 {\n");
      out.write("                color: #aaaaaa;\n");
      out.write("                float: right;\n");
      out.write("                font-size: 28px;\n");
      out.write("                font-weight: bold;\n");
      out.write("            }\n");
      out.write("            .close1:hover,\n");
      out.write("            .close1:focus {\n");
      out.write("                color: #000;\n");
      out.write("                text-decoration: none;\n");
      out.write("                cursor: pointer;\n");
      out.write("            }\n");
      out.write("            label {\n");
      out.write("                font-size: 16px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body class=\"skin-blue\">\n");
      out.write("        <div class=\"wrapper\">\n");
      out.write("            <header class=\"main-header\">\n");
      out.write("                <a href=\"index2.html\" class=\"logo\"><img src=\"img\\icon.png\" width=\"64\" height=\"64\"></a>\n");
      out.write("                <nav class=\"navbar navbar-static-top\" role=\"navigation\">\n");
      out.write("                    <a href=\"#\" class=\"sidebar-toggle\" data-toggle=\"offcanvas\" role=\"button\">\n");
      out.write("                        <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                    </a>\n");
      out.write("                    <div class=\"navbar-custom-menu\">\n");
      out.write("                        <ul class=\"nav navbar-nav\">\n");
      out.write("                            <li style=\"font-size: 26px; font-family: serif ; color: white\">Detecting Stress Based on Social Interactions in Social Networks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>\n");
      out.write("\n");
      out.write("                            <!-- User Account: style can be found in dropdown.less -->\n");
      out.write("                            <li class=\"dropdown user user-menu\">\n");
      out.write("                                <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">\n");
      out.write("                                    <img src=\"img\\admin.png\" class=\"user-image\" alt=\"User Image\"/>\n");
      out.write("                                    <span class=\"hidden-xs\">Admin</span>\n");
      out.write("                                </a>\n");
      out.write("                                <ul class=\"dropdown-menu\">\n");
      out.write("                                    <!-- User image -->\n");
      out.write("                                    <li class=\"user-header\">\n");
      out.write("                                        <img src=\"img\\admin.png\" class=\"img-circle\" alt=\"User Image\" />\n");
      out.write("                                        <p>\n");
      out.write("                                            Admin\n");
      out.write("                                            <small></small>\n");
      out.write("                                        </p>\n");
      out.write("                                    </li>\n");
      out.write("\n");
      out.write("                                    <li class=\"user-footer\">\n");
      out.write("                                        <div class=\"pull-left\">\n");
      out.write("                                            <a href=\"#\" class=\"btn btn-default btn-flat\">Profile</a>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"pull-right\">\n");
      out.write("                                            <a href=\"index.jsp\" class=\"btn btn-default btn-flat\">Sign out</a>\n");
      out.write("                                        </div>\n");
      out.write("                                    </li>\n");
      out.write("                                </ul>\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                </nav>\n");
      out.write("            </header>\n");
      out.write("            <!-- Left side column. contains the logo and sidebar -->\n");
      out.write("            <aside class=\"main-sidebar\">\n");
      out.write("                <!-- sidebar: style can be found in sidebar.less -->\n");
      out.write("                <section class=\"sidebar\">\n");
      out.write("                    <!-- Sidebar user panel -->\n");
      out.write("                    <div class=\"user-panel\" style=\"width: 400px\">\n");
      out.write("                        <div class=\"pull-left image\">\n");
      out.write("                            <img src=\"img\\admin.png\" class=\"img-circle\"  alt=\"User Image\" />\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"pull-left info\">\n");
      out.write("                            <p>Admin</p>\n");
      out.write("\n");
      out.write("                            <a href=\"#\"><i class=\"fa fa-circle text-success\"></i> Online</a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <!-- search form -->\n");
      out.write("                    <form action=\"#\" method=\"get\" class=\"sidebar-form\">\n");
      out.write("                        <div class=\"input-group\">\n");
      out.write("                            <input type=\"text\" name=\"q\" class=\"form-control\" placeholder=\"Search...\"/>\n");
      out.write("                            <span class=\"input-group-btn\">\n");
      out.write("                                <button type='submit' name='search' id='search-btn' class=\"btn btn-flat\"><i class=\"fa fa-search\"></i></button>\n");
      out.write("                            </span>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                    <ul class=\"sidebar-menu\">\n");
      out.write("                        <li class=\"header\" style=\"color: #fefefe\">MAIN NAVIGATION</li>\n");
      out.write("                        <li class=\"active treeview\">\n");
      out.write("                            <a href=\"admin_home.jsp\">\n");
      out.write("                                <span>User Details</span>\n");
      out.write("                            </a>\n");
      out.write("                            <a href=\"user_stress.jsp\">\n");
      out.write("                                <span>User Stress Level</span>\n");
      out.write("                            </a>\n");
      out.write("                            <a href=\"over_stress.jsp\">\n");
      out.write("                                <span>Overall Stress Level</span>\n");
      out.write("                            </a>\n");
      out.write("                        </li>\n");
      out.write("                </section>\n");
      out.write("            </aside>\n");
      out.write("            <div class=\"content-wrapper\">\n");
      out.write("                <!------------------------------------------------------ Content Header (Page header) ------------------------>\n");
      out.write("                <div style=\"background-color: #fff\">\n");
      out.write("                    <center>\n");
      out.write("                        <br>\n");
      out.write("                        <h1>Overall Stress Level of all Users</h1>\n");
      out.write("                        <br><label style=\"color: #CC0033\">");
      out.print(a);
      out.write("%  Stressed Tweet</label>\n");
      out.write("                        <br><label style=\"color: #7ed321\">");
      out.print(b);
      out.write("%  Normal Tweet's</label>\n");
      out.write("                    </center>\n");
      out.write("                </div>\n");
      out.write("                <div id=\"chartContainer\" style=\"height: 400px; width: 100%;\"></div>\n");
      out.write("                <script src=\"graph.js\"></script>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!------------------------------------------------------ Content Header (Page header) ------------------------>\n");
      out.write("        </div><!-- /.content-wrapper -->\n");
      out.write("\n");
      out.write("        <footer class=\"main-footer\">\n");
      out.write("            <div class=\"pull-right hidden-xs\">\n");
      out.write("                <b>Version</b> 2.0\n");
      out.write("            </div>\n");
      out.write("            <strong>Copyright &copy; 2017-2018 <a href=\"#\">jp</a>.</strong>\n");
      out.write("        </footer>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <script src=\"plugins/jQuery/jQuery-2.1.3.min.js\"></script>\n");
      out.write("    <script src=\"bootstrap/js/bootstrap.min.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src='plugins/fastclick/fastclick.min.js'></script>\n");
      out.write("    <script src=\"dist/js/app.min.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"plugins/sparkline/jquery.sparkline.min.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"plugins/jvectormap/jquery-jvectormap-1.2.2.min.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"plugins/jvectormap/jquery-jvectormap-world-mill-en.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"plugins/daterangepicker/daterangepicker.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"plugins/datepicker/bootstrap-datepicker.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"plugins/iCheck/icheck.min.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"plugins/slimScroll/jquery.slimscroll.min.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"plugins/chartjs/Chart.min.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"dist/js/pages/dashboard2.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"dist/js/demo.js\" type=\"text/javascript\"></script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
