package in.co.ecommerce.service;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import in.co.ecommerce.dao.BookProductDAOInt;
import in.co.ecommerce.entity.BookProductEntity;
import in.co.ecommerce.entity.BookProductEntity;
import in.co.ecommerce.exception.DuplicateRecordException;

@Service
public class BookProductServiceImpl implements BookProductServiceInt {

	private Logger log = Logger.getLogger(getClass().getName());

	@Autowired
	private BookProductDAOInt dao;
	
	@Override
	@Transactional
	public long add(BookProductEntity bean) {
		log.info("BookProductServiceImpl  add method start");
		long pk = dao.add(bean);
		log.info("BookProductServiceImpl add method end");
		return pk;
	}

	@Override
	@Transactional
	public void update(BookProductEntity bean) {
		log.info("BookProductServiceImpl  update method start");
		dao.update(bean);
		log.info("BookProductServiceImpl update method end");
		
	}

	@Override
	@Transactional
	public void delete(BookProductEntity bean) {
		log.info("BookProductServiceImpl  delete method start");
		dao.delete(bean);
		log.info("BookProductServiceImpl delete method end");
		
	}

	@Override
	@Transactional
	public BookProductEntity findByName(String name) {
		log.info("BookProductServiceImpl  findByLogin method start");
		BookProductEntity bean = dao.findByName(name);
		log.info("BookProductServiceImpl findByLogin method end");
		return bean;
	}

	

	@Override
	@Transactional
	public BookProductEntity findByPk(long id) {
		log.info("BookProductServiceImpl  findByPk method start");
		BookProductEntity bean = dao.findByPk(id);
		log.info("BookProductServiceImpl findBypk method end");
		return bean;
	}

	@Override
	@Transactional
	public List<BookProductEntity> search(BookProductEntity bean, long pageNo, int pageSize) {
		log.info("BookProductServiceImpl  search method start");
		List<BookProductEntity> list = dao.search(bean, pageNo, pageSize);
		log.info("BookProductServiceImpl search method end");
		return list;
	}

	@Override
	@Transactional
	public List<BookProductEntity> search(BookProductEntity bean) {
		log.info("BookProductServiceImpl  search method start");
		List<BookProductEntity> list = dao.search(bean);
		log.info("BookProductServiceImpl search method end");
		return list;
	}

	

}
