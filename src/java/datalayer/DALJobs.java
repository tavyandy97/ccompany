/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datalayer;
import java.sql.*;
import java.util.*;
/**
 *
 * @author tavya
 */
public class DALJobs extends DBOperations{
    public DALJobs(){
	createConnection();
    }
    public int getLevels (int JobID){
	int level=0;
	try {
	    PreparedStatement ps = con.prepareStatement("SELECT Level FROM Jobs WHERE JobID=?");
	    ps.setString(1, String.valueOf(JobID));
	    ResultSet rs = ps.executeQuery();
	    
	    while(rs.next()){
		level = rs.getInt("Level");
	    }
	} catch (Exception e) {
	    System.out.println(e);
	}
	return level;
    }
    public ArrayList<beans.Jobs> getJobs(int index,int Level){
	ArrayList<beans.Jobs> AJ = new ArrayList<beans.Jobs>();
	try {
	    PreparedStatement ps = con.prepareStatement("SELECT * FROM Jobs WHERE DepartmentID=? AND Level=?");
	    ps.setString(1, String.valueOf(index));
	    ps.setString(2, String.valueOf(Level+1));
	    ResultSet rs = ps.executeQuery();
	    while(rs.next()){
		beans.Jobs j = new beans.Jobs();
		j.setJobID(rs.getInt("JobID"));
		j.setJobName(rs.getString("JobName"));
		AJ.add(j);
	    }
	    closeConnection();
	} catch (Exception e) {
	    System.out.println(e);
	}
	return AJ;
    }
    
    public String getJobByJobID(int ID){
	String job="";
	try {
	    PreparedStatement ps = con.prepareStatement("SELECT * FROM Jobs WHERE JobID=?");
	    ps.setString(1, String.valueOf(ID));
	    ResultSet rs = ps.executeQuery();
	    while(rs.next()){
		job=rs.getString("JobName");
	    }
	} catch (Exception e) {
	    System.out.println(e);
	}
	return job;
    }
    
    
}
