package com;

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

import model.accountantRegister;

@Path("/Accountant")
public class accountantService {
	accountantRegister acobj = new accountantRegister();
//get
	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)
	public String readItems() {
		return acobj.readItems();
	}
//insert
	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)                             
	public String insertItem(@FormParam("Acode") String Acode,
			@FormParam("AName") String AName,
			@FormParam("ANIC") String ANIC,
			@FormParam("PhoneNo") String PhoneNo,
			@FormParam("Email") String Email,
			@FormParam("Address") String Address,
			@FormParam("Password") String Password)
			{
		String output = acobj.insertItem(Acode, AName, ANIC, PhoneNo,Email,Address,Password);
		return output;
	}
//update
	@PUT
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String updateItem(String itemData) {
		// Convert the input string to a JSON object
		JsonObject itemObject = new JsonParser().parse(itemData).getAsJsonObject();
		// Read the values from the JSON object
		String AID = itemObject.get("AID").getAsString();
		String Acode = itemObject.get("Acode").getAsString();
		String AName = itemObject.get("AName").getAsString();
		String ANIC = itemObject.get("ANIC").getAsString();
		String PhoneNo = itemObject.get("PhoneNo").getAsString();
		String Email = itemObject.get("Email").getAsString();
		String Address = itemObject.get("Address").getAsString();
		String Password = itemObject.get("Password").getAsString();
		String output = acobj.updateItem(AID,Acode, AName, ANIC, PhoneNo,Email,Address,Password);
		return output;
	}
//delete
	@DELETE
	@Path("/")
	@Consumes(MediaType.APPLICATION_XML)
	@Produces(MediaType.TEXT_PLAIN)
	public String deleteItem(String itemData) {
		// Convert the input string to an XML document
		Document doc = Jsoup.parse(itemData, "", Parser.xmlParser());

		// Read the value from the element <itemID>
		String AID = doc.select("AID").text();
		String output = acobj.deleteItem(AID);
		return output;
	}

}
