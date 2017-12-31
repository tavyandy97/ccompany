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
public class TaskMapping {
    private int MappingID;
    protected char Status; 
    private int ParentTaskID;
    

    public int getMappingID() {
	return MappingID;
    }

    public void setMappingID(int MappingID) {
	this.MappingID = MappingID;
    }

    public char getStatus() {
	return Status;
    }

    public void setStatus(char Status) {
	this.Status = Status;
    }

    public int getParentTaskID() {
	return ParentTaskID;
    }

    public void setParentTaskID(int ParentTaskID) {
	this.ParentTaskID = ParentTaskID;
    }

   
    
}
