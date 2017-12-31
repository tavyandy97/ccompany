/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datalayer;
import java.sql.*;
/**
 *
 * @author tavya
 */
public class DBOperations {
    protected Connection con;
    
    protected void createConnection(){
	try {
	    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    con = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-G0799BR\\TAVEESHDATA:57836;database=TaskManagers;userName=sa;password=root");
	} catch (ClassNotFoundException | SQLException ex) {
	    System.out.println(ex);
	}
    }
    
    protected void closeConnection(){
	if(con!=null){
	    try{
		con.close();
	    }
	    catch(SQLException ex){
		System.out.println(ex);
	    }
	}
    }
}
