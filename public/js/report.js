$(document).ready(() => {

    //initialized global variables 
    let from_date = moment().startOf("month").format("YYYY-MM-DD")
    let to_date = moment().format("YYYY-MM-DD")
    let department_unit = 0

    //call function 
    generateReport(from_date, to_date, department_unit)
    fetchAdmin()

    $("#report").click(e => {
        let from_date = document.getElementById("from_date").value
        let to_date = document.getElementById("to_date").value
        department_unit = document.getElementById("department_unit").value
        if (from_date.length == 0 || from_date.length < 10 || to_date.length == 0 || to_date.length < 10)
            alert("Please enter a valid date")
        else generateReport(from_date, to_date, department_unit)
    })

    function generateReport(from_date, to_date, department_unit) {

        //perform ajax call to get data from api 
        $.ajax({
            type: "GET",
            url: `http://localhost:8000/api/report/${from_date}/${to_date}/${department_unit}`,
            cache: false,
            success: (res) => {
                //empty report table body to be replaced with fetched data
                if (res.length > 0) {
                    // console.log(res)
                    let total_expense = 0
                    document.getElementById("report_table_body").innerHTML = ""
                    document.getElementById("report_table_header").innerHTML = `REPORT ON DAILY ACTIVITIES ON PURCHASES (${moment(from_date).format("dddd, MMMM Do YYYY")} to ${moment(to_date).format("dddd, MMMM Do YYYY")})`
                    res.forEach(unit => {
                        unit.product_orders.forEach(unit_product => {
                            $("#report_table_body").append(`<tr><th scope="row">${moment(unit.created_at).format("dddd, MMMM Do YYYY")}</th><td>${unit_product.description}</td><td>${unit.poNumber}</td><td>${unit_product.quantity}</td><td>${unit_product.unit_price}</td><th scope="row">${unit_product.total_price}</th><td>${unit.purpose}</td></tr>`)
                            total_expense = Number(unit_product.total_price) + total_expense
                        })
                    })
                    document.getElementById("total_expense").innerHTML = `D${total_expense.toFixed(2)}`
                    document.getElementById("export_to_pdf_div").innerHTML = ""
                    $("#export_to_pdf_div").append(`<a id="export_pdf" href="/export_pdf/${from_date}/${to_date}/${department_unit}" target="_blank" class="btn btn-secondary btn-lg text-center">Export to PDF</a>`)
                } else {
                    let total_expense = 0
                    alert(res.length)
                    document.getElementById("report_table_body").innerHTML = "";
                    document.getElementById("report_table_header").innerHTML = `REPORT ON DAILY ACTIVITIES ON PURCHASES (${moment(from_date).format("dddd, MMMM Do YYYY")} to ${moment(to_date).format("dddd, MMMM Do YYYY")})`
                    $("#report_table_body").append(`<th scope="row" colspan="7" class="text-center text-danger">No purchase record is found or availablle the above time period </th></tr>`)
                    document.getElementById("total_expense").innerHTML = total_expense
                    document.getElementById("export_to_pdf_div").innerHTML = ""



                }
            }
        })
    }

    function fetchAdmin() {
        $.ajax({
            type: "GET",
            url: "http://localhost:8000/api/fetch_department",
            cache: false,
            success: res => {
                document.getElementById("department_unit").innerHTML = ""
                $("#department_unit").append(`<option value="0">All</option>`)
                if (res.length > 0) {
                    res.forEach(row => {
                        $("#department_unit").append(`<option value="${row.id}">${row.department_name}</option>`)
                    })

                } else {
                    console.log("empty departments")
                }
            }
        })
    }

})
