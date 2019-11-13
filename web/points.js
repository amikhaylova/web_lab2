window.onload = function () {
    var plot_canvas = document.getElementById("plot");
    var ctx = plot_canvas.getContext("2d");
    var r = document.getElementById("r_value");

    function draw_canvas(){
        ctx.fillStyle = '#aec4c7';
        ctx.fillRect(150, 150, 100, 50);

        ctx.beginPath();
        ctx.arc(150, 150, 50, Math.PI, 1 / 2 * Math.PI, true);
        ctx.lineTo(150, 150);
        ctx.fill();

        ctx.closePath();
        ctx.beginPath();
        ctx.lineTo(150, 100);
        ctx.lineTo(50, 150);
        ctx.lineTo(150, 150);
        ctx.fill();
        ctx.closePath();

        ctx.strokeStyle = "black";
        ctx.lineWidth = 0.5;

        ctx.beginPath();
        ctx.moveTo(150, 0);
        ctx.lineTo(150, 300);
        ctx.closePath();
        ctx.stroke();

        ctx.beginPath();
        ctx.moveTo(0, 150);
        ctx.lineTo(300, 150);
        ctx.closePath();
        ctx.stroke();
    }


    var x;
    var y;
    var xx;
    var yy;
    let r_value = '-1';
    draw_canvas();


    r.addEventListener("change", change_r, false);
    plot_canvas.addEventListener("click", checkPoint, false);

    function checkPoint(e) {

        let x_pix;
        let y_pix;
        let x_canvas;
        let y_canvas;

        if (r_value == '-1') {
            warning3_element = document.getElementById("warning3");
            warning3_element.textContent = "Выберите значение для R!";
            warning3_element.style.visibility = "visible";
            setTimeout(function () {
                    warning3_element.style.visibility = "hidden"
                },
                2000);
        } else {
            //getCursorPosition(e);
            x_pix = getCP_X_pix(e);
            y_pix = getCP_Y_pix(e);
            x_canvas = getCP_X_canvas(x_pix, r_value);
            y_canvas = getCP_Y_canvas(y_pix, r_value);

            /*console.log("x_pix: " + x_pix);
            console.log("y_pix: " + y_pix);
            console.log("x_can: " + x_canvas);
            console.log("y_can: " + y_canvas);*/

            var hit_ans;
            let hit;

            $.ajax({
                type: "GET",//тип запроса: get,post либо head
                url: "control",//url адрес файла обработчика
                data: {'x': x_canvas, 'hidden_y': y_canvas, 'r': r_value},//параметры запроса
                response: 'text', //тип возвращаемого ответа text либо xml
                error: function (message) {
                    //console.log(message);
                },
                success: function (data) {//возвращаемый результат от сервера
                    $('#ans2').remove();
                    $('#ans3').remove();
                    $(data).insertAfter(("#end"));
                    hit_ans = document.getElementsByClassName("hit");
                    hit = hit_ans[hit_ans.length - 1].innerHTML.toString().trim();
                    console.log("hit_1: " + hit);
                    $('#ans').remove();

                    draw_point(x_pix, y_pix, hit)

                }
            });

        }
    }

     function draw_point(x, y, hit){
         console.log("hit_1: " + hit);
         if (hit == "Да"){
             ctx.fillStyle = 'green';
         }else{
             ctx.fillStyle = 'red';
         }
         ctx.beginPath();
         ctx.rect(x - 2.5, y - 2.5, 5, 5);
         ctx.fill();
     }


    function getCursorPosition(e) {
        xx = e.clientX - left;
        yy = e.clientY - top;
        x = (r_value / 100 * (e.clientX - left - 150)).toFixed(6);
        y = (-r_value / 100 * (e.clientY - top - 150)).toFixed(6);
    }

    function getCP_X_pix(e) {
        var br = plot_canvas.getBoundingClientRect();
        var left = br.left;
        var top = br.top;
        return e.clientX - left;
    }

    function getCP_Y_pix(e) {
        var br = plot_canvas.getBoundingClientRect();
        var left = br.left;
        var top = br.top;
        return e.clientY - top;
    }

    function getCP_X_canvas(x_pix, r) {
        return x = (r / 100 * (x_pix - 150)).toFixed(6);
    }

    function getCP_Y_canvas(y_pix, r) {
        return y = (-r / 100 * (y_pix - 150)).toFixed(6);
    }

    function change_r(e) {
        if (!(isNaN(document.getElementById("r_value").value))
            && (document.getElementById("r_value").value > 2)
            && (document.getElementById("r_value").value < 5)) {
            r_value = document.getElementById("r_value").value;
            let table_x = document.getElementsByClassName("x");
            let table_y = document.getElementsByClassName("y");
            let table_r = document.getElementsByClassName("r");
            let table_hit = document.getElementsByClassName("hit");
            console.log(table_hit.length);
        }else{
            r_value = -1;
        }
        //alert(r_value);
    }
}