/**
 * 
 */
package com.DAO;

import java.util.List;

/**
 * @author Huynh Tan Dat last on 15-06-2020 10:14:18

 *
 */
public interface IDAO<E> {
	// tìm theo ID
		E findById(Long id);

		// tìm tất cả
		List<E> findAll();

		// tạo dối tượng mới
		E create(E entity) throws Exception;

		// cập nhật dối tang
		void update(E entity) throws Exception;

		// xóa đối tượng
		E delete(Long id);
}
