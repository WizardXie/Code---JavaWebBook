package net.jwstm.Statistics.beans;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class statBean {
	int length;// 表示ResultSet的元素个数
	String maxName;// 最高分姓名
	String maxScore;// 最高分
	String minName;// 最低分姓名
	String minScore;// 最低分
	String average;// 平均分
	//int bad;// 不及格人数
	ArrayList<String> badNames=new ArrayList<>();// 不及格学生姓名
	ArrayList<String> badScores=new ArrayList<>();// 不及格学生成绩
	// 获取所有学生成绩信息
	
	public statBean() throws SQLException {
		getMax();
		getMin();
		getAvg();
		getBad();
	}
	
	public ResultSet getResult() {
		ResultSet rs = null;
		ConnectDB bc = new ConnectDB();
		String sql = "select * from score";
		try {
			rs = bc.select(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	// 获取学生总人数
	public int getLength() throws SQLException {
		ResultSet rs = this.getResult();
		rs.last();
		return rs.getRow();
	}

	// 获取最高分
	public void getMax() throws SQLException {
		ResultSet rs = this.getResult();
		String tempName = "";// 最高分学生姓名
		int s = -1;// 最高分，假设初始值为-1
		int t = 0;// rs中每一条目中的成绩
		while (rs.next()) {
			t = Integer.parseInt(rs.getString(2));
			if (t > s) {
				s = t;
				tempName = rs.getString(1);
			}
		}
		maxName = tempName;
		maxScore = String.valueOf(s);
	}

	// 获取最低分
	public void getMin() throws SQLException {
		ResultSet rs = this.getResult();
		String tempName = "";// 最高分学生姓名
		int s = 100;// 最高分，假设初始值为100
		int t = 0;// rs中每一条目中的成绩
		while (rs.next()) {
			t = Integer.parseInt(rs.getString(2));
			if (t < s) {
				s = t;
				tempName = rs.getString(1);
			}
		}
		minName = tempName;
		minScore = String.valueOf(s);
	}
	
	//计算平均分
	public void getAvg() throws SQLException {
		ResultSet rs = this.getResult();
		int l=getLength();
		double sum=0;
		int t;
		while (rs.next()) {
			t = Integer.parseInt(rs.getString(2));
			sum=sum+t;
		}
		average=String.valueOf(sum/l);
	}
	//统计不及格信息，这里设置及格线为60
	public void getBad() throws SQLException {
		ResultSet rs = this.getResult();
		int t;
		while(rs.next()) {
			t = Integer.parseInt(rs.getString(2));
			if(t<60) {
				badNames.add(rs.getString(1));
				badScores.add(rs.getString(2));
			}
		}
	}
	
	public String getMaxName() throws SQLException {
		return maxName;
	}

	public String getMaxScore() throws SQLException {
		return maxScore;
	}

	public String getMinName() {
		return minName;
	}

	public String getMinScore() {
		return minScore;
	}

	public String getAverage() {
		return average;
	}

	public ArrayList<String> getBadNames() throws SQLException {
		return badNames;
	}

	public ArrayList<String> getBadScores() throws SQLException {
		return badScores;
	}
}
