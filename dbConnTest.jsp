<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 커넥션 테스트</title>
</head>
<body>
<%
    String driverName = "org.mariadb.jdbc.Driver"; // MariaDB 드라이버로 변경
    String url = "jdbc:mariadb://localhost:3306"; // MariaDB의 접속 URL
    String username = "test";
    String password = "a1234";
    Connection conn = null;
    try {
        Class.forName(driverName);
        conn = DriverManager.getConnection(url, username, password);
        out.println(">>연결 성공 :" + conn);
    } catch (ClassNotFoundException e) {
        out.println(">>연결 실패: 드라이버 복사 필요!");
    } catch (SQLException e) {
        out.println(">>연결 실패: SQL 명령문 확인 필요");
    } finally {
        try {
            if (conn != null)
                conn.close();
        } catch (SQLException e) {
        	out.println(">>연결 종료 중 오류 발생: " + e.getMessage());
        }
    }
%>
</body>
</html>
