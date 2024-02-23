/**
 * 
 */
package com.exception;

/**
 * @author Huynh Tan Dat last on 15-06-2020 10:15:32

 *
 */
public class myException extends Exception{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public static String messageNullPoin(String entityName) {
		return entityName+" không được trống! ";
		
	}
	
}
