/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author tavya
 */
public class Jobs extends Departments {
    protected int JobID;
    private String JobName;  
    private int Level;

    public int getJobID() {
	return JobID;
    }

    public void setJobID(int JobID) {
	this.JobID = JobID;
    }

    public String getJobName() {
	return JobName;
    }

    public void setJobName(String JobName) {
	this.JobName = JobName;
    }

    public int getLevel() {
	return Level;
    }

    public void setLevel(int Level) {
	this.Level = Level;
    }

    public int getDepartmentID() {
	return DepartmentID;
    }

    public void setDepartmentID(int DepartmentID) {
	this.DepartmentID = DepartmentID;
    }
    
    
}
