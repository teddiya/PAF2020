package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Time;

import com.sun.jersey.spi.dispatch.RequestDispatcher;

public class apointment {
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

			public String insertItem(String fName, String lName, String type, String phone,String date, String time,String messege) {
				String output = "";
				try {
					Connection con = connect();
					if (con == null) {
						return "Error while connecting to the database for inserting.";
					}
					// create a prepared statement
					String query = " insert into appointment(fName,lName,type,phone,date,time, messege)"
							+ " values (?, ?, ?, ?, ?, ?, ?)";
					PreparedStatement preparedStmt = con.prepareStatement(query);
					// binding values
					preparedStmt.setInt(1, 0);
					preparedStmt.setString(2, fName);
					preparedStmt.setString(3, lName);
					preparedStmt.setString(4, type);
					preparedStmt.setString(5, phone);
					preparedStmt.setString(6, date);
					preparedStmt.setString(7, time);
					preparedStmt.setString(8, messege);

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
					output = "<table border=\"2\"><tr><th>First Name</th><th>Last Name</th><th>Service Type</th><th>Phone No</th><th>Date</th><th>Time</th><th>Messege</th>"
							+ "<th>Address</th><th>Password</th><th>Update</th><th>Remove</th></tr>";
					String query = "select * from appointment";
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery(query);   
					// iterate through the rows in the result set
					while (rs.next()) {
						String AID = Integer.toString(rs.getInt("AID"));
						String fName = rs.getString("fName");
						String lName = rs.getString("lName");
						String type = rs.getString("type");
						String phone = rs.getString("phone");
						String date = rs.getString("date");
						String time = rs.getString("time");
						String messege = rs.getString("messege");
						// Add into the html table
						output += "<tr><td>" + fName + "</td>";
						output += "<td>" + lName + "</td>";
						output += "<td>" + type + "</td>";
						output += "<td>" + phone + "</td>";
						output += "<td>" + date + "</td>";
						output += "<td>" + time + "</td>";
						output += "<td>" + messege + "</td>";
						// buttons
						output += "<td><button type=\"button\" class=\"btn update_btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModal\" data-id=\"" + AID + "\" data-todo='{\"fName\":\""+ fName+ "\","
								+ "\"lName\":\""+lName+ "\",\"type\":\""+ type+ "\",\"phone\":\""+ phone + "\",\"date\":\""+ date+ "\",\"time\":\""+ time+ "\",\"messege\":\""+ messege+ "\"}'>Update</button></td>"
								+ "<td><form method=\"post\" action=\"appointment.jsp\">"
								+ "<input name=\"btnRemove\" type=\"submit\" value=\"Remove\"class=\"btn btn-danger\">"
								+ "<input name=\"AID\" type=\"hidden\" value=\"" + AID + "\">" + "</form></td></tr>";
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


			public String updateItem(String AID, String fName, String lName, String type, String phone,String date, String time,String messege) {
				String output = "";
				System.out.println(AID);
				try {
					Connection con = connect();
					if (con == null) {
						return "Error while connecting to the database for updating.";
					}
					// create a prepared statement
					String query = "UPDATE patient SET Pcode=?,PName=?,PNIC=?,PhoneNo=?,Email=?,Address=?,Password=?WHERE AID=?";
					PreparedStatement preparedStmt = con.prepareStatement(query);
					// binding values
					preparedStmt.setString(1, fName);
					preparedStmt.setString(2, lName);
					preparedStmt.setString(3, type);
					preparedStmt.setString(4, phone);
					preparedStmt.setString(5, date);
					preparedStmt.setString(6, time);
					preparedStmt.setString(7, messege);
					preparedStmt.setInt(8, Integer.parseInt(AID));
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
		
			public String deleteItem(String AID) {
				System.out.println("p delete");
				String output = "";
				try {
					Connection con = connect();
					if (con == null) {
						return "Error while connecting to the database for deleting.";
					}
					// create a prepared statement
					String query = "delete from patient where AID=?";
					PreparedStatement preparedStmt = con.prepareStatement(query);
					// binding values
					preparedStmt.setInt(1, Integer.parseInt(AID));
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
