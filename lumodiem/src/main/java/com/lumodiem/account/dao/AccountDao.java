package com.lumodiem.account.dao;

import org.apache.ibatis.session.SqlSession;

import com.lumodiem.account.vo.Account;

public class AccountDao {

	public int accountCreateOne(SqlSession session, Account act) {
		int result = session.insert("accountMapper.accountInsert", act);
		return result;
	}

	public Account loginAccount(SqlSession session, Account temp) {
		Account act = session.selectOne("accountMapper.loginSelect", temp);
		return act;
	}

}
