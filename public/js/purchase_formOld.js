
$(document).ready(() => {

    /**
     * +++++++++++++++++++++++
     * GLOBAL VARIABLES AND THIRD PARTY SCRIPT REQUIREMENTS
     * +++++++++++++++++++++++
     */

    var items_count = 0;

    $("#plo").DataTable();
    // $("#department_table").DataTable();

    // let from_month = moment().startOf("month").format("YYYY-MM-DD");
    // let to_month = moment().format("YYYY-MM-DD");
    // chartGenerator(from_month, to_month);
    /**
     * +++++++++++++++++++++++
     * CLICK LISTENERS
     * +++++++++++++++++++++++
     */

    $("#department").click((e) => {
        const hod = Number(e.target.value);
        // console.log(hod);
        $.get(`/api/fetchHod/${hod}`, function (data) {
            // console.log(data);
            const hodName = data[0].name;
            const hodId = data[0].id;
            document.getElementById("supId").value = hodId;
            document.getElementById("head_of_department").value = hodName;
        });
    })

    $("#add_item").click((e) => {
        e.preventDefault();
        listGenereator();
    });
    $(document).on("click", ".remove", (e) => {
        e.preventDefault();
        let clickedItem = e.target.parentElement.parentElement;
        clickedItem.remove();

        //        let head_parent = clickedItem.parent.parent;
        //       head_parent.hide();
    });

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
    var options = "";
document.getElementById("add_item").style.display="none";    //----------------------------------------------------------------
    // document.getElementById("add_itemHR").style.display="block";
    function showAddItemBtn(){
	document.getElementById("loadingSection").style.display="none";
        document.getElementById("add_item").style.display="block";

    }
    function showAddItemHr(){
	 document.getElementById("add_itemHR").style.display="block";
    }
    setTimeout(showAddItemHr, 1);
    setTimeout(showAddItemBtn,1);
    $.get(`http://localhost:8000/api/getcachedata`,function(data){
        // alert("Product Successfully Rejected.");
       console.log(data[0].productName);
       for(var i = 0; i<data.length; i++){
        const tmpData = data[i].productName;
       options+=`<option value='${tmpData}'> ${tmpData}</option>`;
       }
       options+=`<option value="cant"> __CANT FIND PRODUCT</option>`;


    });
    function listGenereator() {
        items_count = items_count + 1;

//         fetch('https://stores.qcell.gm/api/items?all')
//   .then(response => response.json())
//   .then(data => console.log(data));

        $("#items").append(
            "<div class='form-row'>" +
            "<div class='form-group col-md-2'> " +
            "<label for='quantity'>Quantity *</label> " +
            "<input required type='number' id='quantity" +
            items_count +
            "' name='quantity" +
            items_count +
            "' class='form-control form-control-lg' aria-describedby='quantityHelp'>" +
            "<small id='quantityHelp' class='form-text-muted'>Your help</small>" +
            "</div>" +
///////////////////////////////////////

	`<div class='form-group col-md-8'>
           <label for=''>Product Description</label>
	    <input required type='text' placeholder='Please enter in the Product' name='storeProduct${items_count}' id='productNameDescription${items_count}' list='productDescriptionName${items_count}' class='form-control form-control-lg'>
	    <datalist id='productDescriptionName${items_count}'>${options}</datalist>
            </div>`


	//////////////////////////
		+

            `<div style='display:none'  id='pNameContainer${items_count}' class='form-group col-md-3'> ` +
            "<label for='unit_price'>Product NameSS*</label> " +
            "<input type='text' value='product Name'  id='unit_price" + items_count + "' name='pName" + items_count + "' class='form-control form-control-lg' aria-describedby='pName_Help'>" +
            "<small id='unit_price_Help' class='form-text-muted'>product Name</small>" +
            "</div>" +
/*
            `<div id='pList${items_count}' class='form-group col-md-6'>
                <label for=''>Product Description</label>
                <select class='form-control' id='products${items_count}' onclick='switchP(${items_count},1)' name='storeProduct${items_count}' value='${options}'>${options}</select>
            </div>`+*/

            `<div style='display:none' id='pDiscContainer${items_count}' class='form-group col-md-5'> ` +
            "<label for='description'>Description</label> " +
            "<textarea type='text'  id='description" +
            items_count +
            "' name='description" +
            items_count +
            "' class='form-control form-control-lg' rows='2' aria-describedby='descriptionHelp'>Test Description </textarea>" +
            "<small id='descriptionHelp' class='form-text-muted'>description of item</small>" +
            "</div>" +
            "<div class='form-group col-md-2 align-self-center '> " +
            "<button class='btn btn-outline-danger remove' id=''>remove</button>" +
            "</div>" +
            "</div>"
        );
    }
    switchP = (id,caller)=>{ // The caller variable determines if the call if from normal User or Hr Personnel.
        if(caller === 1){

        var e = document.getElementById(`products${id}`);
        console.log(e.options[e.selectedIndex].value);
    var strUser = e.options[e.selectedIndex].value;
    console.log(strUser);
    if(strUser === "cant"){
        document.getElementById(`pNameContainer${id}`).style.display="block";
        document.getElementById(`pDiscContainer${id}`).style.display="block";
        document.getElementById(`pList${id}`).style.display="none";
        }
    }
    else{
        var e = document.getElementById(`products${id}`);
        console.log(e.options[e.selectedIndex].value);
    var strUser = e.options[e.selectedIndex].value;
    console.log(strUser);
    if(strUser === "cant"){
        document.getElementById(`pDiscContainer${id}`).style.display="block";
        document.getElementById(`pList${id}`).style.display="none";
        }

    }
    }

    $("#add_itemHR").click((e) => {
        e.preventDefault();
        listGenereatorHR()
    });

    function listGenereatorHR() {
        items_count = items_count + 1
        $("#items").append("<div class='form-row'>" +
            "<div class='form-group col-md-2'> " +
            "<label for='quantity'>Quantity *</label> " +
            "<input type='number' min='1' required id='quantity" + items_count + "' name='quantity" + items_count + "' class='form-control form-control-lg' aria-describedby='quantityHelp'>" +
            "<small id='quantityHelp' class='form-text-muted'>Your help</small>" +
            "</div>" +

            "<div class='form-group col-md-3'> " +
            "<label for='unit_price'>Unit Price*</label> " +
            "<input type='number' min='1' required id='unit_price" + items_count + "' name='unit_price" + items_count + "' class='form-control form-control-lg' aria-describedby='pName_Help'>" +
            "<small id='unit_price_Help' class='form-text-muted'>Unit Price</small>" +
            "</div>" +
	/////////////////////////////////////////

		`<div class='form-group col-md-5'>
           <label for=''>Product Description</label>
	    <input required type='text' placeholder='Please enter in the Product' name='storeProduct${items_count}' id='productNameDescription${items_count}' list='productDescriptionName${items_count}' class='form-control form-control-lg'>
	    <datalist id='productDescriptionName${items_count}'>${options}</datalist>
            </div>`

////////////////////////////////////////////////
		+
  //          `<div id='pList${items_count}' class='form-group col-md-5'>
//            <label for=''>Product Description</label>

           // <select class='form-control' id='products${items_count}' onclick='switchP(${items_count})' name='storeProduct${items_count}' value='${options}'>${options}</select>
           // </div>`+
///////////////////////////////   sdfsdfs
            `<div style='display:none' id='pDiscContainer${items_count}' class='form-group col-md-5'>
            <label for='description'>Description</label>
            <textarea type='text' id='description${items_count}' name='description${items_count}' class='form-control form-control-lg' rows='2' aria-describedby='descriptionHelp'></textarea>
            <small id='descriptionHelp' class='form-text-muted'>description of item</small>
            </div>`+
            "<div class='form-group col-md-2 align-self-center '> " +
            "<button class='btn btn-outline-danger remove' id=''>remove</button>" +
            "</div>" +

            "</div>");
    }


});
