<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
        <head>
            <meta charset="UTF-8">
            <title>Лабораторная работа №2</title>
            <link rel="stylesheet" href="style.css">
        </head>
        <body>
        <table id="ans">
            <tr>
                <td class="top1" colspan="2">
                    <p id="lab"><b>Лабораторная работа №2</b></p>
                </td>
            </tr>
            <tr >
                <td class="top2" colspan="2">
                    <p id="name"><b>Выполнила:</b> Михайлова А.А.,
                        <b>гр.</b> P3211
                        <br>
                        <b>Вариант:</b> 11113
                    </p>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <br>
                    <h2>Значение R:</h2>
                </td>
                <td align="left">
                    <br>
                    <%if (request.getAttribute("r") != null) {
             out.println(request.getAttribute("r").toString());
         }%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <h2>Значение X:</h2>
                </td>
                <td align="left">
                     <%if (request.getAttribute("x") != null) {
             out.println(request.getAttribute("x").toString());
         }%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <h2>Значение Y:</h2>
                </td>
                <td align="left">
                    <%if (request.getAttribute("y") != null) {
             out.println(request.getAttribute("y").toString());
         }%>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <h2>Попадание точки в область:</h2>
                </td>
                <td align="left">
                    <%if (request.getAttribute("area") != null) {
             out.println((Boolean) request.getAttribute("area")? "Да" : "Нет");
         }%>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <div>
                        <form action ="/">
                            <button id="back_but">Вернуться на главную</button>
                        </form>
                    </div>
                </td>
            </tr>
        </table>
        <br>
        <table id="ans2">
            <tr style="background: #aec4c7; font-weight: bold; border-radius: 10px" >
                <td>X</td>
                <td>Y</td>
                <td>R</td>
                <td>Попадание</td>
            </tr>
            <%
                ServletContext context = request.getServletContext();
                if((context.getAttribute("x")!= null)
                        &&(context.getAttribute("y")!= null)
                        &&(context.getAttribute("r")!= null)
                        &&(context.getAttribute("area")!= null)){
                    ArrayList<Double> x_list = (ArrayList<Double>)context.getAttribute("x");
                    ArrayList<Double> y_list = (ArrayList<Double>)context.getAttribute("y");
                    ArrayList<Double> r_list = (ArrayList<Double>)context.getAttribute("r");
                    ArrayList<Boolean> area_list = (ArrayList<Boolean>)context.getAttribute("area");

                    for(int i=0;i<x_list.size();i++) {
                        out.println("<tr>");
                        out.println("<td class=x>");
                        out.println(x_list.get(i));
                        out.println("</td>");
                        out.println("<td class=y>");
                        out.println(y_list.get(i));
                        out.println("</td>");
                        out.println("<td class=r>");
                        out.println(r_list.get(i));
                        out.println("</td>");
                        out.println("<td class=hit>");
                        out.println(area_list.get(i) ? "Да" : "Нет");
                        out.println("</td>");
                        out.println("</tr>");
                    }
                }

            %>

        </table>
        </body>