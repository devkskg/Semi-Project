package com.lumodiem.account.service;

import com.lumodiem.account.dao.AccountDao;
import com.lumodiem.account.vo.Account;
import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;

import org.apache.ibatis.session.SqlSession;

public class AccountService {

	public int accountCreateOne(Account act) {
		SqlSession session = getSqlSession();
		int result = new AccountDao().accountCreateOne(session, act);
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}

	public Account loginAccount(Account temp) {
		SqlSession session = getSqlSession();
		Account act = new AccountDao().loginAccount(session, temp);
		if(act != null) {
			session.commit();
		} else {
			session.rollback();
		}
		return act;
	}

}
