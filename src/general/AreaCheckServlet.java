package general;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.util.ArrayList;

public class AreaCheckServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String xString = request.getParameter("x");
        String yString = request.getParameter("hidden_y");
        String rString = request.getParameter("r");

        Double x;
        Double y;
        Double r;

        try {
            x = Double.parseDouble(xString);
            y = Double.parseDouble(yString);
            r = Double.parseDouble(rString);

            boolean point_is_in_area = false;

            /*boolean y_is_valid = false;
            Double [] y_values = new Double[]{-2.0, -1.5, -1.0, -0.5, 0.0, 0.5, 1.0, 1.5, 2.0};
            for (Double value : y_values) {
                if (value.equals(y)) {
                    y_is_valid = true;
                }
            }*/

            /*if ((x <= -5) || (x >= 3) || (r <= 2) || (r >= 5) || (y<-2) || (y>2)) {
                throw new Exception();
            }*/



            boolean triangle = false;
            boolean rectangle = false;
            boolean circle = false;

            if ((Math.pow(y, 2) <= Math.pow(r, 2) / 4 - Math.pow(x, 2)) && (y <= 0) && (x <= 0)) {
                circle = true;
            }

            if ((y<=0)&&(y>=-r/2)&&(x>=0)&&(x<=r)){
                rectangle = true;
            }

            if((y>=0) && (y <= x/2 + r/2 ) && (x <= 0)){
                triangle = true;
            }

            if (triangle || circle || rectangle){
                point_is_in_area = true;
            }

            ServletContext context = request.getServletContext();

            if (context.getAttribute("x") == null){
                ArrayList<Double> x_list = new ArrayList<>();
                x_list.add(x);
                context.setAttribute("x", x_list);
            }else{
                ArrayList<Double> x_list = (ArrayList<Double>)context.getAttribute("x");
                x_list.add(x);
                context.setAttribute("x", x_list);
            }

            if (context.getAttribute("y") == null){
                ArrayList<Double> y_list = new ArrayList<>();
                y_list.add(y);
                context.setAttribute("y", y_list);
            }else {
                ArrayList<Double> y_list = (ArrayList<Double>)context.getAttribute("y");
                y_list.add(y);
                context.setAttribute("y", y_list);
            }

            if (context.getAttribute("r") == null){
                ArrayList<Double> r_list = new ArrayList<>();
                r_list.add(r);
                context.setAttribute("r", r_list);
            }else{
                ArrayList<Double> r_list = (ArrayList<Double>)context.getAttribute("r");
                r_list.add(r);
                context.setAttribute("r", r_list);
            }

            if (context.getAttribute("area") == null){
                ArrayList<Boolean> area_list = new ArrayList<>();
                area_list.add(point_is_in_area);
                context.setAttribute("area", area_list);
            }else {
                ArrayList<Boolean> area_list = (ArrayList<Boolean>)context.getAttribute("area");
                area_list.add(point_is_in_area);
                context.setAttribute("area", area_list);
            }


            request.setAttribute("x", x);
            request.setAttribute("y", y);
            request.setAttribute("r", r);
            request.setAttribute("area", point_is_in_area);

            request.getRequestDispatcher("answer.jsp").forward(request, response);

            /*PrintWriter out = response.getWriter();
            //out.println(point_is_in_area);

            if ((context.getAttribute("x") != null)
                    && (context.getAttribute("y") != null)
                    && (context.getAttribute("r") != null)
                    && (context.getAttribute("area") != null)) {
                ArrayList<Double> x_list = (ArrayList<Double>) context.getAttribute("x");
                ArrayList<Double> y_list = (ArrayList<Double>) context.getAttribute("y");
                ArrayList<Double> r_list = (ArrayList<Double>) context.getAttribute("r");
                ArrayList<Boolean> area_list = (ArrayList<Boolean>) context.getAttribute("area");

                out.println("<table id=\"ans2\">");
                out.println("<tr style=\"background: #aec4c7; font-weight: bold\" >");
                out.println("<td>X</td>");
                out.println("<td>Y</td>");
                out.println("<td>R</td>");
                out.println("<td>Area</td>");
                out.println("</tr>");

                for (int i = 0; i < x_list.size(); i++) {
                    out.println("<tr>");
                    out.println("<td>");
                    out.println(x_list.get(i));
                    out.println("</td>");
                    out.println("<td>");
                    out.println(y_list.get(i));
                    out.println("</td>");
                    out.println("<td>");
                    out.println(r_list.get(i));
                    out.println("</td>");
                    out.println("<td>");
                    out.println(area_list.get(i));
                    out.println("</td>");
                    out.println("</tr>");
                }

                out.println("</table>");
            }*/



        } catch (Exception e) {
            request.setAttribute("e", e);
            request.getServletContext().getRequestDispatcher("/invalid.jsp").forward(request, response);
        }



    }
}
