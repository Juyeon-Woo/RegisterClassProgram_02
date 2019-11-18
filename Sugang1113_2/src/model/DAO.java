package model;

import java.sql.*;
import java.util.*;

public class DAO extends DBConnection {
	private static DAO instance = new DAO();

	public static DAO getInstance() {
		return instance;
	}

	private DAO() {
	}

	public ArrayList<JoinVO> listall() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<JoinVO> lista = new ArrayList<JoinVO>();
		try {
			conn = getConnection();
			sql = "select id, c.name, c.credit, l.name, c.week, " + " c.start_hour, c.end_end "
					+ " from course_tbl c join lecturer_tbl l " + " on c.lecturer=l.idx";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				JoinVO vo = new JoinVO();
				vo.setId(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setCredit(rs.getString(3));
				vo.setNname(rs.getString(4));
				// vo.setWeek(rs.getString(5));
				if (rs.getInt(5) == 1)
					vo.setWeek("월");
				else if (rs.getInt(5) == 2)
					vo.setWeek("화");
				else if (rs.getInt(5) == 3)
					vo.setWeek("수");
				else if (rs.getInt(5) == 4)
					vo.setWeek("목");
				else if (rs.getInt(5) == 5)
					vo.setWeek("금");
				else
					vo.setWeek("토");
				vo.setStart_hour(rs.getString(6));
				vo.setEnd_end(rs.getString(7));
				lista.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDBResource(rs, pstmt, conn);
		}
		return lista;
	}

	public String countId() {

		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		String id = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			sql = "select count(*) from course_tbl";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				id = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDBResource(rs, pstmt, conn);
		}
		return id;
	}

	public int insert(JoinVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rs = 0;
		String sql = null;
		try {
			conn = getConnection();
			sql = "insert into course_tbl values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getCredit());
			pstmt.setString(4, vo.getLecturer());
			pstmt.setString(5, vo.getWeek());
			pstmt.setString(6, vo.getStart_hour());
			pstmt.setString(7, vo.getEnd_end());
			rs = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDBResource(pstmt, conn);
		}
		return rs;
	}

	public ArrayList<lecturerVO> getLecturer() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<lecturerVO> leclist = new ArrayList<lecturerVO>();
		try {
			conn = getConnection();
			sql = "select idx, name from lecturer_tbl";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				lecturerVO vo = new lecturerVO();
				vo.setIdx(rs.getString(1));
				vo.setName(rs.getString(2));
				leclist.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDBResource(rs, pstmt, conn);
		}
		return leclist;
	}

	public JoinVO sendSubid(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		JoinVO vo = new JoinVO();
		try {
			conn = getConnection();
			sql = "select id, c.name, c.credit, l.name, c.week, " + " c.start_hour, c.end_end "
					+ " from course_tbl c join lecturer_tbl l " + " on c.lecturer=l.idx and id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next())
				vo.setId(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setCredit(rs.getString(3));
			vo.setLecturer(rs.getString(4));
			vo.setWeek(rs.getString(5));
			vo.setStart_hour(rs.getString(6));
			vo.setEnd_end(rs.getString(7));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDBResource(rs, pstmt, conn);
		}
		return vo;
	}

	public int update(JoinVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rs = 0;
		String sql = null;
		ArrayList<JoinVO> jlist = new ArrayList<JoinVO>();
		try {
			conn = getConnection();
			sql = "update course_tbl set id=?, name=?, lecturer=?," + " credit=?, week=?, start_hour=?, end_end=?"
					+ " where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getLecturer());
			pstmt.setString(4, vo.getCredit());
			pstmt.setString(5, vo.getWeek());
			pstmt.setString(6, vo.getStart_hour());
			pstmt.setString(7, vo.getEnd_end());
			rs = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDBResource(pstmt, conn);
		}
		return rs;
	}

	public int delete(JoinVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rs = 0;
		String sql = null;
		try {
			conn = getConnection();
			sql = "delete course_tbl where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			rs = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDBResource(pstmt, conn);
		}
		return rs;
	}

}
