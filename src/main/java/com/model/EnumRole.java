/**
 * 
 */
package com.model;

/**
 * @author Huynh Tan Dat last on 29-06-2020 16:43:29
 *
 * 
 */
//phải giống với Roles trong database
public enum EnumRole {
	admin, staff, doctor;
	
	 @Override
	 public String toString() {
	      if (this == admin) {
	    	  //role_name trong database
	          return "admin";
	      } else if (this == staff) {
	          return "staff";
	      }else if (this == doctor) {
	          return "doctor";
	      }
	      return super.toString();
	  }
}
