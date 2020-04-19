/**
 * 
 */

/**
 * 
 */
var token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyIiwiaWF0IjoxNTg3MzA3MzkxLCJleHAiOjE1ODc5MTIxOTF9.KJ92JmukBYyASqHEYMtygtapnINtchRiefG6C51BrY4PW2ZAUgohqhPUNTrVtzlIyTOOON7wzZEPrxEBPbu-Ng";

function getDetails(){
	jQuery.ajax({
        url: "http://localhost:5000/api/products",
        type: "GET",
        contentType: "application/json", 
        headers: {"Authorization": "Bearer " + token},        
        dataType:'json',
        success: function(data, textStatus, errorThrown) {
            //here is your json.
              // process it
        	var items = [];
        	
        	$.each(data, function(key, val){
        		items.push("<tr>");
        		items.push("<td>" + val.id + "</td>");
        		items.push("<td>" + val.name + "</td>");
        		items.push("<td>" + val.description + "</td>");
        		items.push("<td>" + val.price + "</td>");
        		items.push("<td>" + val.quantity + "</td>");
        		items.push("<tr>");
        	});
        	$("<tbody/>", {html: items.join("")}).appendTo("#all_products");

        }, 
        error : function(jqXHR, textStatus, errorThrown) {
        		$("#title").text("Sorry! Book not found!");
        		$("#price").text("");
        },
        timeout: 120000,
    });
};

function getDetailsById(){
	jQuery.ajax({
        url: "http://localhost:5000/api/products/" + parseInt($("#product_id").val()),
        type: "GET",
        contentType: "application/json", 
        headers: {"Authorization": "Bearer " + token},        
        dataType:'json',
        success: function(data, textStatus, errorThrown) {
            //here is your json.
              // process it
        	var items = [];
        	
        	
        		items.push("<tr>");
        		items.push("<td>" + data.id + "</td>");
        		items.push("<td>" + data.name + "</td>");
        		items.push("<td>" + data.description + "</td>");
        		items.push("<td>" + data.price + "</td>");
        		items.push("<td>" + data.quantity + "</td>");
        		items.push("<tr>");
        	
        	$("<tbody/>", {html: items.join("")}).appendTo("#one_product");

        }, 
        error : function(jqXHR, textStatus, errorThrown) {
        		$("#error_msg").html("<div class=\"alert alert-danger\" role=\"alert\">Product Not Found !</div>");
        		$("#price").text("");
        },
        timeout: 120000,
    });
};

function addProducts(){
	console.log('addWine');
    $.ajax({
        type: 'POST',
        contentType: 'application/json',
        headers: {"Authorization": "Bearer " + token},
        url: "http://localhost:5000/api/products",
        dataType: "json",
        data: AddNewProductformToJSON(),
        success: function(response){
        	$("#pro_add_msg").html("<div class=\"alert alert-success\" role=\"alert\">Product added successfuly !</div>");
        },
        error: function(jqXHR, textStatus, errorThrown){
        	$("#pro_add_msg").html("<div class=\"alert alert-danger\" role=\"alert\">Something went wrong !</div>");
        }
    });
};

function removeProductById(){
	jQuery.ajax({
        url: "http://localhost:5000/api/products/" + $("#del_product_id").val(),
        type: "DELETE",
        contentType: "application/json",  
        dataType:'json',
        headers: {"Authorization": "Bearer " + token},
        success: function(data, textStatus, errorThrown) {
        	$("#pro_del_msg").html("<div class=\"alert alert-success\" role=\"alert\">Product deleted successfuly !</div>");
        },
        error : function(jqXHR, textStatus, errorThrown) {
        	$("#pro_del_msg").html("<div class=\"alert alert-danger\" role=\"alert\">Something went wrong !</div>");
        },
        timeout: 120000,
    });
};


function AddNewProductformToJSON() {
    return JSON.stringify({
         "name" : $('#product_name').val(),
        "quantity": parseInt($('#product_quant').val()),
        "price": parseFloat($('#product_price').val()),
        "description": $('#product_desc').val()
    });
}