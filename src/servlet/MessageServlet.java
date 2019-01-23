package servlet;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
@WebServlet("/MessageServlet")
public class MessageServlet extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=GBK";

    //Initialize global variables
    public void init() throws ServletException {
    }

    //Process the HTTP Get request
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        response.setCharacterEncoding("GBK");
        request.setCharacterEncoding("GBK");
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>MessageServlet</title></head>");
        out.println("<body bgcolor=\"#ffffff\">");
        String strMsg = request.getParameter("message");
        if (strMsg==null||strMsg.equals(""))
        {
            displayHtml(out);
        }
        else
        {
            ServletContext app = getServletContext();
            StringBuffer objMsg =(StringBuffer)app.getAttribute("objMessage");
            if (objMsg==null)
            {
                objMsg = new StringBuffer();
            }
            String name = request.getParameter("name");
            objMsg.append("<b>"+name+"Ëµ:</b>"+strMsg+"<br>");
            app.setAttribute("objMessage",objMsg);
            displayHtml(out);
        }

        out.close();
    }
    public void displayHtml(PrintWriter out)
    {
        out.println("<html>");
        out.println("<head><title>MessageServlet</title></head>");
        out.println("<body bgcolor=#ffffff onload = javascript:frm.message.focus()>");
        out.println("<form method = post name =frm>");
        out.println("<input type = text name = message>");
        out.println("<input type=submit value = '·¢ËÍ'>");
        out.println("</form>");
        out.println("</body>");
        out.println("</html>");
    }

    //Process the HTTP Post request
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request, response);
    }

    //Clean up resources
    public void destroy() {
    }
}

