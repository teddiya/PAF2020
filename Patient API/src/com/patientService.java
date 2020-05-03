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

import model.PatientRegister;

@Path("/Patient")
public class patientService {
	PatientRegister phobj = new PatientRegister();

	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)
	public String readItems() {
		return phobj.readItems();
	}

	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)                              //`PID`,`Pcode`,`PName`,`PNIC`,`PhoneNo`,`Email`,`Address`,`Password`
	public String insertItem(
			@FormParam("Pcode") String Pcode,
			@FormParam("PName") String PName,
			@FormParam("PNIC") String PNIC,
			@FormParam("PhoneNo") String PhoneNo,
			@FormParam("Email") String Email,
			@FormParam("Address") String Address,
			@FormParam("Password") String Password)
			{
		String output = phobj.insertItem(Pcode, PName, PNIC, PhoneNo,Email,Address,Password);
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
		String PID = itemObject.get("PID").getAsString();
		String Pcode = itemObject.get("Pcode").getAsString();
		String PName = itemObject.get("PName").getAsString();
		String PNIC = itemObject.get("PNIC").getAsString();
		String PhoneNo = itemObject.get("PhoneNo").getAsString();
		String Email = itemObject.get("Email").getAsString();
		String Address = itemObject.get("Address").getAsString();
		String Password = itemObject.get("Password").getAsString();
		String output = phobj.updateItem(PID,Pcode, PName, PNIC, PhoneNo,Email,Address,Password);
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
		String PID = pha.select("PID").text();
		String output = phobj.deleteItem(PID);
		return output;
	}

}
