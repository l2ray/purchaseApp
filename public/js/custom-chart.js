$(document).ready(() => {
    /**
     * ++++++++++++++++++
     *load scripts
     * ++++++++++++++++++
     */
    $.getScript("/js/Chart.bundle.js", function () {});
    $.getScript("/js/moment-with-locales.min.js", function () {});

    /**
     * +++++++++++++++++++++++
     * GLOBAL VARIABLES AND THIRD PARTY SCRIPT REQUIREMENTS
     * +++++++++++++++++++++++
     */


    $("#plo").DataTable();
    // $("#department_table").DataTable();

    let from_month = moment().startOf("month").format("YYYY-MM-DD");
    let to_month = moment().format("YYYY-MM-DD");
    chartGenerator(from_month, to_month);
    /**
     * +++++++++++++++++++++++
     * CLICK LISTENERS
     * +++++++++++++++++++++++
     */
    $("#generate").click(e => {
        let from_month = document.getElementById("from_month").value;
        let to_month = document.getElementById("to_month").value;

        if (
            from_month.length == 0 ||
            from_month.length < 10 ||
            to_month.length == 0 ||
            to_month.length < 10
        ) {
            alert("Please select a valid date");
        } else chartGenerator(from_month, to_month);
    });



    /**
     * +++++++++++++++++++++++
     * FUNCTIONS
     * +++++++++++++++++++++++
     */


    function chartGenerator(from_month, to_month) {
        // if (window.myChart != undefined) window.myChart.destroy();

        document.getElementById("chart1").innerHTML = "";
        document.getElementById("chart2").innerHTML = "";
        document.getElementById("chart1").innerHTML =
            "<canvas id='myChart'></canvas>";
        document.getElementById("chart2").innerHTML =
            "<canvas id='myChart2'></canvas>";
        document.getElementById("department_table_body").innerHTML = "";

        $.ajax({
            type: "GET",
            url: `http://po.app.qcell.gm/api/charts/${from_month}/${to_month}`,
            cache: false,
            success: function (res) {

                let labels = Object.keys(res.data.department)
                let data = Object.values(res.data.department)
                var ctx = document.getElementById("myChart").getContext("2d");
                var ctz = document.getElementById("myChart2").getContext("2d");

                var myChart = new Chart(ctx, {
                    type: "bar",
                    data: {
                        labels: labels,
                        datasets: [{
                            label: "# of purchase",
                            data: data,
                            backgroundColor: [
                                "#d7ccc8",
                                "#ffe0b2",
                                "#c8e6c9",
                                "#e1bee7",
                                "#f8bbd0",
                                "#bbdefb",
                                "#b2ebf2",
                                "#b2dfdb",
                                "#ffcdd2",
                                "#e1bee7",
                                "#f48fb1",
                                "#fff9c4",
                                "#f0f4c3"
                            ],
                            borderColor: [
                                "#795548",
                                "#ff9800",
                                "#8bc34a",
                                "#9c27b0",
                                "#e91e63",
                                "#2196f3",
                                "#00bcd4 ",
                                "#009688",
                                "#f44336",
                                "#9c27b0",
                                "#e91e63",
                                "#ffeb3b",
                                "#cddc39"
                            ],
                            borderWidth: 1,
                        }, ],
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true,
                                },
                            }, ],
                        },
                        title: {
                            display: true,
                            text: "Purchases From " +
                                from_month +
                                " To " +
                                to_month,
                        },
                    },
                });

                var myChart2 = new Chart(ctz, {
                    type: "doughnut",
                    data: {
                        labels: labels,
                        datasets: [{
                            label: "# of Votes",
                            data: data,
                            backgroundColor: [
                                "#d7ccc8",
                                "#ffe0b2",
                                "#c8e6c9",
                                "#e1bee7",
                                "#f8bbd0",
                                "#bbdefb",
                                "#b2ebf2",
                                "#b2dfdb",
                                "#ffcdd2",
                                "#e1bee7",
                                "#f48fb1",
                                "#fff9c4",
                                "#f0f4c3"
                            ],
                            borderColor: [
                                "#795548",
                                "#ff9800",
                                "#8bc34a",
                                "#9c27b0",
                                "#e91e63",
                                "#2196f3",
                                "#00bcd4 ",
                                "#009688",
                                "#f44336",
                                "#9c27b0",
                                "#e91e63",
                                "#ffeb3b",
                                "#cddc39"
                            ],
                            borderWidth: 1,
                        }, ],
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero: true,
                                },
                            }, ],
                        },
                        title: {
                            display: true,
                            text: "Purchases From " +
                                from_month +
                                " To " +
                                to_month,
                        },
                    },
                });
	//	$("#rqanalysis").innerText = `Analysis On Department Requisations ${from_month} to ${to_month}`;
		 document.getElementById("rqanalysis").innerText = `Analysis On Department Requisations ${from_month} to ${to_month}`;
                $("#department_table_body").append(
                    `<tr><td>Admin</td><td>${res.data.department['Admin'] || 0}</td></tr><tr><td>Customer Care</td><td>${res.data.department['Call center'] || 0}</td></tr><tr><td>Finance</td><td>${res.data.department['Finance and R.A'] || 0}</td></tr><tr><td>IT and Billing</td><td>${res.data.department['IT and Billing'] || 0}</td></tr><tr><td>Marketing</td><td>${res.data.department['Marketing'] || 0}</td></tr><tr><td>Projects</td><td>${res.data.department['Projects'] || 0}</td></tr><tr><td>Sales</td><td>${res.data.department['Sales'] || 0}</td></tr><tr><td>Technical</td><td>${res.data.department['SWAT'] || 0}</td></tr>`
                );
            },
            error: function (err) {
                console.log(err);
            },
        });
    }
});
