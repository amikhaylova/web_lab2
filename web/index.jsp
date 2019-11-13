<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Лабораторная работа №2</title>
    <link rel="stylesheet" href="style.css">
    <script src="check.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
</head>
<body>
<table>
    <tr>
        <td class="top1" colspan="2">
            <p id="lab"><b>Лабораторная работа №2</b></p>
        </td>
    </tr>
    <tr>
        <td class="top2" colspan="2">
            <p id="name"><b>Выполнила:</b> Михайлова А.А.,
                <b>гр.</b> P3211
                <br>
                <b>Вариант:</b> 11113
            </p>
        </td>
    </tr>
    <tr>
        <td width="55%">
            <p align="justify">
                Эта <span class="important">невероятно полезная</span> страница поможет вам определить, попадает ли
                точка в заданную область.
                <br> <br>
                Просто задайте значения <span class="important">R, X, Y</span> - и вы узнаете ответ.
            </p>
        </td>
        <td id="pict" rowspan="3">
            <canvas id="plot" width="300" height="300" style="background-color: white;">
            </canvas>
            <br>
            <span id="warning3"></span>
        </td>
    </tr>
    <form action="control" method="get">
        <tr>
            <td>
                <h2>Изменение R</h2>
                <p>
                    Задайте значение для радиуса R (2 < x < 5).
                </p>
                <input type="text" placeholder="значение от 2 до 5" id="r_value" name="r" required autocomplete="off"
                       maxlength="16">
                <span id="warning1"></span>
            </td>
        </tr>
        <tr>
            <td>
                <h2>Изменение X</h2>
                <p>
                    Задайте значение для координаты X (-5 < x < 3).
                </p>
                <input type="text" placeholder="значение от -5 до 3" id="x_value" name="x" required autocomplete="off"
                       maxlength="16">
                <span id="warning2"></span>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <h2>Изменение Y</h2>
                <p>
                    Задайте значение для координаты Y.
                </p>
                <div>
                    <button type="button" name="button_y" value="-2" class="by" id="y_-2">
                        -2
                    </button>
                    <button type="button" name="button_y" value="-1.5" id="y_-1.5">
                        -1.5
                    </button>
                    <button type="button" name="button_y" value="-1" id="y_-1">
                        -1
                    </button>
                    <button type="button" name="button_y" value="-0.5" id="y_-0.5">
                        -0.5
                    </button>
                    <button type="button" name="button_y" value="0" class="focused" id="y_0">
                        0
                    </button>
                    <button type="button" name="button_y" value="0.5" id="y_0.5">
                        0.5
                    </button>
                    <button type="button" name="button_y" value="1" id="y_1">
                        1
                    </button>
                    <button type="button" name="button_y" value="1.5" id="y_1.5">
                        1.5
                    </button>
                    <button type="button" name="button_y" value="2" id="y_2">
                        2
                    </button>
                </div>
                <input type="hidden" name="hidden_y" id="hidden_y" value="0">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div>
                    <button id="send_button" type="submit">Определить</button>
                </div>
            </td>
        </tr>
    </form>
</table>
<br id="end">


<%
    /*if ((application.getAttribute("x") != null)
            && (application.getAttribute("y") != null)
            && (application.getAttribute("r") != null)
            && (application.getAttribute("area") != null)) {
        ArrayList<Double> x_list = (ArrayList<Double>) application.getAttribute("x");
        ArrayList<Double> y_list = (ArrayList<Double>) application.getAttribute("y");
        ArrayList<Double> r_list = (ArrayList<Double>) application.getAttribute("r");
        ArrayList<Boolean> area_list = (ArrayList<Boolean>) application.getAttribute("area");


        out.println("<table id=\"ans3\">");
        out.println("<table id=\"ans2\">");
        out.println("<tr style=\"background: #aec4c7; font-weight: bold\" >");
        out.println("<td>X</td>");
        out.println("<td>Y</td>");
        out.println("<td>R</td>");
        out.println("<td>Попадание</td>");
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
            out.println(area_list.get(i) ? "Да" : "Нет");
            out.println("</td>");
            out.println("</tr>");
        }
    }*/

    ArrayList<Double> x_list = (ArrayList<Double>) application.getAttribute("x");
    ArrayList<Double> y_list = (ArrayList<Double>) application.getAttribute("y");
    ArrayList<Double> r_list = (ArrayList<Double>) application.getAttribute("r");
    ArrayList<Boolean> area_list = (ArrayList<Boolean>) application.getAttribute("area");


    if ((x_list != null) && (y_list != null) && (r_list != null) && (area_list != null)) {
        out.println("<table id=\"ans3\">");
        out.println("<tr style=\"background: #aec4c7; font-weight: bold; border-radius: 10px\" >");
        out.println("<td>X</td>");
        out.println("<td>Y</td>");
        out.println("<td>R</td>");
        out.println("<td>Попадание</td>");
        out.println("</tr>");

        for (int i = 0; i < x_list.size(); i++) {
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
            out.println("<td class = hit>");
            out.println(area_list.get(i) ? "Да" : "Нет");
            out.println("</td>");
            out.println("</tr>");
        }
    }


%>

</table>
</body>
</html>

