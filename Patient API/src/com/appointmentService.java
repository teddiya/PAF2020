package com;

import java.sql.Date;
import java.sql.Time;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.parser.Parser;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import model.apointment;
import model.PatientRegister;
import model.apointment;

@Path("/apointment")
public class appointmentService {
	apointment apobj = new apointment();

	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)
	public String readItems() {
		return apobj.readItems();
	}

	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)                             
	public String insertItem(
			@FormParam("fName") String fName,
			@FormParam("lName") String lName,
			@FormParam("type") String  type,
			@FormParam("phone") String phone,
			@FormParam("date") String date,
			@FormParam("time") String time,
			@FormParam("message") String messege)
			{
		String output = apobj.insertItem(fName, lName, type, phone, date,time,messege);
		return output;
		
	}

	@PUT
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String updateItem(String itemData) {
		// Convert the input string to a JSON object
		JsonObject itemObject = new JsonParser().parse(itemData).getAsJsonObject();
		// Read the values from the JSON object
		String AID = itemObject.get("AID").getAsString();
		String fName = itemObject.get("fName").getAsString();
		String lName = itemObject.get("lName").getAsString();
		String type = itemObject.get("type").getAsString();
		String phone = itemObject.get("phone").getAsString();
		String date = itemObject.get("date").getAsString();
		String time = itemObject.get("time").getAsString();
		String message = itemObject.get("message").getAsString();
		String output = apobj.updateItem(AID,fName, lName, type, phone, date,time,message);
		return output;
	}

	@DELETE
	@Path("/")
	@Consumes(MediaType.APPLICATION_XML)
	@Produces(MediaType.TEXT_PLAIN)
	public String deleteItem(String itemData) {
		// Convert the input string to an XML document
		Document pha = Jsoup.parse(itemData, "", Parser.xmlParser());

		// Read the value from the element <itemID>
		String AID = pha.select("AID").text();
		String output = apobj.deleteItem(AID);
		return output;
	}

}
