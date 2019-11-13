package general;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "TestServlet")
public class TestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String xString=request.getParameter("x");
        String yString=request.getParameter("hidden_y");
        String rString=request.getParameter("r");
        PrintWriter out = response.getWriter();
        out.println("<table id=\"ans2\">");
        out.println("<tr style=\"background: #aec4c7; font-weight: bold\" >");
        out.println("<td>X</td>");
        out.println("<td>Y</td>");
        out.println("<td>R</td>");
        out.println("<td>Area</td>");
        out.println("</tr>");
    }
}
