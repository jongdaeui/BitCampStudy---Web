package com.bc.bbs.mybatis;


import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

// MyBatis 사용해서 작업할 SqlSession을 만들어 줄
// SqlSessionFactory 객체생성을 위한 클래스
public class DBService {
	private static SqlSessionFactory factory;
	
	// static 초기화 구문
	static {
		try {
//			String config = "com/bc/mybatis/config.xml";
//			Reader reader = Resources.getResourceAsReader(config);
			factory = new SqlSessionFactoryBuilder()
					.build(Resources.getResourceAsReader("com/bc/bbs/mybatis/config.xml"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
