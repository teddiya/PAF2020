package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.sun.jersey.spi.dispatch.RequestDispatcher;

public class PatientRegister {
	// A common method to connect to the DB
			private Connection connect() {
				Connection con = null;
				try {
					Class.forName("com.mysql.jdbc.Driver");

					// Provide the correct details: DBServer/DBName, username, password
					con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/healthcare", "root", "");
				} catch (Exception e) {
					e.printStackTrace();
				}
				return con;
			}

			public String insertItem(String pcode, String name, String nic, String phone, String email, String address,String pass) {
				String output = "";
				try {
					Connection con = connect();
					if (con == null) {
						return "Error while connecting to the database for inserting.";
					}
					// create a prepared statement
					String query = " insert into patient(`PID`,`Pcode`,`PName`,`PNIC`,`PhoneNo`,`Email`,`Address`,`Password`)"
							+ " values (?, ?, ?, ?, ?, ?, ?, ?)";
					PreparedStatement preparedStmt = con.prepareStatement(query);
					// binding values
					preparedStmt.setInt(1, 0);
					preparedStmt.setString(2, pcode);
					preparedStmt.setString(3, name);
					preparedStmt.setString(4, nic);
					preparedStmt.setString(5, phone);
					preparedStmt.setString(6, email);
					preparedStmt.setString(7, address);
					preparedStmt.setString(8, pass);

					// execute the statement
					preparedStmt.execute();
					con.close();
					output = "Inserted successfully";
				} catch (Exception e) {
					output = "Error while inserting the item.";
					System.err.println(e.getMessage());
				}
				return output;
			}

			public String readItems() {
				String output = "";
				try {
					Connection con = connect();
					if (con == null) {
						return "Error while connecting to the database for reading.";
					}
					// Prepare the html table to be displayed
					output = "<table border=\"2\"><tr><th>Patient code</th><th>Name</th><th>NIC NO</th><th>Phone No</th><th>Emaill</th>"
							+ "<th>Address</th><th>Password</th><th>Update</th><th>Remove</th></tr>";
					String query = "select * from patient";
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery(query);   
					// iterate through the rows in the result set
					while (rs.next()) {
						String PID = Integer.toString(rs.getInt("PID"));
						String Pcode = rs.getString("Pcode");
						String PName = rs.getString("PName");
						String PNIC = rs.getString("PNIC");
						String PhoneNo = rs.getString("PhoneNo");
						String Email = rs.getString("Email");
						String Address = rs.getString("Address");
						String Password = rs.getString("Password");
						// Add into the html table
						output += "<tr><td>" + Pcode + "</td>";
						output += "<td>" + PName + "</td>";
						output += "<td>" + PNIC + "</td>";
						output += "<td>" + PhoneNo + "</td>";
						output += "<td>" + Email + "</td>";
						output += "<td>" + Address + "</td>";
						output += "<td>" + Password + "</td>";
						// buttons
						output += "<td><button type=\"button\" class=\"btn update_btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModal\" data-id=\"" + PID + "\" data-todo='{\"Pcode\":\""+ Pcode+ "\","
								+ "\"PName\":\""+PName+ "\",\"PNIC\":\""+ PNIC+ "\",\"PhoneNo\":\""+ PhoneNo + "\",\"Email\":\""+ Email+ "\",\"Address\":\""+ Address+ "\",\"Password\":\""+ Password+ "\"}'>Update</button></td>"
								+ "<td><form method=\"post\" action=\"patientdet.jsp\">"
								+ "<input name=\"btnRemove\" type=\"submit\" value=\"Remove\"class=\"btn btn-danger\">"
								+ "<input name=\"PID\" type=\"hidden\" value=\"" + PID + "\">" + "</form></td></tr>";
					}
					con.close();
					// Complete the html table
					output += "</table>";
				} catch (Exception e) {
					output = "Error while reading the items.";
					System.err.println(e.getMessage());
				}
				return output;
			}


			public String updateItem(String ID, String pcode, String name, String nic, String phone, String email, String address,String pass) {
				String output = "";
				System.out.println(ID);
				try {
					Connection con = connect();
					if (con == null) {
						return "Error while connecting to the database for updating.";
					}
					// create a prepared statement
					String query = "UPDATE patient SET Pcode=?,PName=?,PNIC=?,PhoneNo=?,Email=?,Address=?,Password=?WHERE PID=?";
					PreparedStatement preparedStmt = con.prepareStatement(query);
					// binding values
					preparedStmt.setString(1, pcode);
					preparedStmt.setString(2, name);
					preparedStmt.setString(3, nic);
					preparedStmt.setInt(4, Integer.parseInt(phone));
					preparedStmt.setString(5, email);
					preparedStmt.setString(6, address);
					preparedStmt.setString(7, pass);
					preparedStmt.setInt(8, Integer.parseInt(ID));
					// execute the statement
					preparedStmt.execute();
					con.close();
					output = "Updated successfully";
		
				} catch (Exception e) {
					output = "Error while updating the item.";
					System.err.println(e.getMessage());
				}
				return output;
			}
		
			public String deleteItem(String PID) {
				System.out.println("p delte");
				String output = "";
				try {
					Connection con = connect();
					if (con == null) {
						return "Error while connecting to the database for deleting.";
					}
					// create a prepared statement
					String query = "delete from patient where PID=?";
					PreparedStatement preparedStmt = con.prepareStatement(query);
					// binding values
					preparedStmt.setInt(1, Integer.parseInt(PID));
					// execute the statement
					preparedStmt.execute();
					con.close();
					output = "Deleted successfully";
				} catch (Exception e) {
					output = "Error while deleting the item.";
					System.err.println(e.getMessage());
				}
				return output;
			}

}
