package com.ohyoyo.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCTests {
	// static {블럭} : 이 값을 계속 돌리고 있는 것
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// Add junit 4
	@Test // @test는 test할꺼니까 실행해봐
	public void testConnection() {
		// connection이 잘 되고있다 jdbc도 잘 작동하고있다
		try (Connection conn = 
			 DriverManager.getConnection(
					 "jdbc:oracle:thin:@localhost:1521:XE",
					 "java",
					 "1234")) {
			System.out.println(conn);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
}
