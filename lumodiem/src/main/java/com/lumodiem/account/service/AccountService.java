package com.lumodiem.account.service;

import com.lumodiem.account.dao.AccountDao;
import com.lumodiem.account.vo.Account;
import static com.lumodiem.common.sql.SqlSessionTemplate.getSqlSession;
import static com.lumodiem.common.sql.SqlSessionTemplate.commitRollback;

import org.apache.ibatis.session.SqlSession;

public class AccountService {

	public int accountCreateOne(Account act) {
		SqlSession session = getSqlSession();
		int result = new AccountDao().accountCreateOne(session, act);
		commitRollback(session, result);
		session.close();
		return result;
	}

	public Account loginAccount(Account act) {
		SqlSession session = getSqlSession();
		Account account = new AccountDao().loginAccount(session, act);
		return account;
	}

	public int accountDuplicateCheck(Account act) {
		SqlSession session = getSqlSession();
		int result = new AccountDao().accountDuplicateCheck(session, act);
		return result;
	}

}
