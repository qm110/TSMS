package com.tsms.dao.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.tsms.dao.UserDao;
import com.tsms.entity.User;
import com.tsms.util.DBUtil;

public class UserDaoImpl implements UserDao {
	
	private DBUtil db = DBUtil.getInstance();
	@Override
	public User getUserByUsername(String username) {
		List<Map<String, String>> list = db.query("select * from tb_user where username=?", username);
		User user = null;
		for (Map<String, String> map : list) {
			user = User.getInstance();
			try {
				BeanUtils.populate(user, map);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return user;
	}
	@Override
	public List<Map<String, String>> getUser_TaxerByUsername(String username) {
		String sql = "";
		List<Map<String, String>> list = db.query(sql, username);
		return list;
	}
	@Override
	public boolean updateUserPasswordByUsername(String password,String username) {
		String sql = "update tb_user set password=? where username=?";
		boolean b = db.update(sql, password,username);
		return b;
	}


}
