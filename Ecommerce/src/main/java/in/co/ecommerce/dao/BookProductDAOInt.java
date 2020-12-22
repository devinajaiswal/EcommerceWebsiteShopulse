package in.co.ecommerce.dao;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import in.co.ecommerce.entity.BookProductEntity;

public interface BookProductDAOInt {

public long add(BookProductEntity bean);
	
	public void update(BookProductEntity bean);
	
	public void delete(BookProductEntity bean);
	
	public BookProductEntity findByName(String name);
	
	public BookProductEntity findByPk(long id);
	
	public List<BookProductEntity> search(BookProductEntity bean, long pageNo, int pageSize);
	
	public List<BookProductEntity> search(BookProductEntity bean);
	
	
}
