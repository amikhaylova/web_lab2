package general;

import java.io.IOException;

public class ControllerServlet extends javax.servlet.http.HttpServlet {

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        String xString=request.getParameter("x");
        String yString=request.getParameter("hidden_y");
        String rString=request.getParameter("r");

        try{
            Double.parseDouble(xString);
            Double.parseDouble(yString);
            Double.parseDouble(rString);

        }catch (Exception e){
            request.getServletContext().getRequestDispatcher("/invalid.jsp").forward(request, response);
        }

        if(xString == null || yString == null || rString == null){
            //request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            //request.getRequestDispatcher("index.jsp").forward(request, response);
            request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("check").forward(request, response);
            //request.getServletContext().getRequestDispatcher("/test").forward(request, response);
        }
        //request.getRequestDispatcher("/test.jsp").forward(request, response);
    }
}
