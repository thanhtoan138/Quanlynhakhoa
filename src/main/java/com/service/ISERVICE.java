/**
 * 
 */
package com.service;

import java.util.List;

/**
 * @author Huynh Tan Dat last on 15-06-2020 10:14:35

 *
 */
public interface ISERVICE<E> {
	E get(Long id) throws Exception;
	List<E> getAll() throws Exception;
	E create(E entity) throws Exception;
	void update(E entity) throws Exception;
	E delete(Long id) throws Exception;
}
