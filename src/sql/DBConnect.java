package sql;

import java.sql.*;
import java.util.ArrayList;

public class DBConnect {

	public Connection Connect2MySQL() throws Exception{
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://127.0.0.1:3306/meetingdb?useUnicode=true&characterEncoding=utf-8&useSSL=false";
		Class.forName(driver);
		Connection conn=DriverManager.getConnection(url, "root", "root");
		return conn;
	}
	
	public void printAllUser() throws Exception{
		Connection conn = this.Connect2MySQL();		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from user");
		String userID;
		String userName;
		String userPWD;
		String userMail;
		String userPosition;
		while(rs.next()){
			userID = rs.getString("userid");
			userName = rs.getString("username");
			userPWD = rs.getString("userpwd");
			userMail = rs.getString("usermail");
			userPosition = rs.getString("userPosition");
			System.out.println(userID);
			System.out.println(userName);
			System.out.println(userPWD);
			System.out.println(userMail);
			System.out.println(userPosition);
		}
		rs.close();
		stmt.close();
		conn.close();
	}
	
	public boolean chkUser(String userID, String userPWD) throws Exception{		
		String chkStr = "Select * from user where userid = '" + userID + "' and userpwd = '" + userPWD + "'";
		Connection conn = this.Connect2MySQL();		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(chkStr);
		User u = new User();
		u.setUserid("null");
		u.setUserpwd("null");
		if(rs.next()){
			u.setUserid(rs.getString("userid"));
			u.setUserpwd(rs.getString("userpwd"));
		}
		if(u.getUserid().equals(userID) && u.getUserpwd().equals(userPWD)){
			System.out.println("user confirmed");
			rs.close();
			stmt.close();
			conn.close();
			return true;
		}
		return false;			
	}
	
	public boolean isUserExist(String userID) throws Exception{		
		String Str = "Select * from user where userid = '" + userID+ "'";
		Connection conn = this.Connect2MySQL();		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(Str);		
		if(rs.next()){
			return true;
		}
		return false;			
	}
	
	public User saveUser(String userID) throws Exception {		
		String str = "Select * from user where userid = '" + userID + "'";		
		Connection conn = this.Connect2MySQL();		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(str);			
		User u = new User();		
		if(rs.next()){		
		u.setUserid(rs.getString("userid"));
		u.setUsername(rs.getString("username"));
		u.setUsermail(rs.getString("usermail"));
		u.setUserpwd(rs.getString("userpwd"));
		u.setUserposition(rs.getString("userposition"));		
		}
		rs.close();
		stmt.close();
		conn.close();
		return u;	
	}

	public Room getRoom(int roomid) throws Exception {		
		String str = "Select * from room where roomID = " + roomid ;		
		Connection conn = this.Connect2MySQL();		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(str);			
		Room m = new Room();		
		if(rs.next()){		
		m.setRoomID(rs.getInt("roomID"));
		m.setRoomName(rs.getString("roomName"));
		m.setRoomStartTime(rs.getInt("roomStartTime"));
		m.setRoomEndTime(rs.getInt("roomEndTime"));
		m.setRoomPermission(rs.getString("roomPermission"));
		}
		rs.close();
		stmt.close();
		conn.close();
		return m;
	}

	public void applyRoom(long meetingId, int meetingDate, int meetingStartTime, int meetingEndTime, String meetingStarter, int meetingRoom, int meetingStatus, long meetingApplyTime, String meetingGuest) throws Exception{		
		String applyStr = "INSERT INTO meeting (`meetingID`, `meetingDate`, `meetingStartTime`, `meetingEndTime`, `meetingStarter`, `meetingRoom`, `meetingStatus`, `meetingApplyTime`, `meetingGuest`) VALUES (?,?,?,?,?,?,?,?,?);";		
		Connection conn = this.Connect2MySQL();
		PreparedStatement ps = conn.prepareStatement(applyStr);
		ps.setLong(1, meetingId);
		ps.setInt(2, meetingDate);
		ps.setInt(3, meetingStartTime);
		ps.setInt(4, meetingEndTime);
		ps.setString(5, meetingStarter);
		ps.setInt(6, meetingRoom);
		ps.setInt(7, meetingStatus);
		ps.setLong(8, meetingApplyTime);
		ps.setString(9, meetingGuest);
		System.out.println(ps.executeUpdate());
		ps.close();
		conn.close();
	}

	public void createUser(String userid, String username, String userpwd, String usermail, String userposition) throws Exception {
		String str = "INSERT INTO `meetingdb`.`user` (`userid`, `username`, `userpwd`, `usermail`, `userposition`) VALUES (?,?,?,?,?);";		
		Connection conn = this.Connect2MySQL();
		PreparedStatement ps = conn.prepareStatement(str);
		ps.setString(1, userid);
		ps.setString(2, username);
		ps.setString(3, userpwd);
		ps.setString(4, usermail);
		ps.setString(5, userposition);	
		System.out.println(ps.executeUpdate());
		ps.close();
		conn.close();
	}
	
	public boolean isRoomOrdered(int ctime, int croom, int cdate) throws Exception{		
		String chkStr = "SELECT * FROM meeting where meetingDate= "+cdate+ " and meetingStartTime <= "+ctime+" and meetingEndTime > "+ctime+ " and meetingRoom = "+croom + " and meetingStatus = 1";				
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		ResultSet rs1 = stmt.executeQuery(chkStr);			
		if(rs1.next()){
			return true;
		}		
		return false;		
	}
	
	public boolean isRoomOrdered(int startTime,int endTime, int croom, int cdate) throws Exception{		
		String chkStr = "SELECT * FROM meeting where meetingDate= "+cdate+ " and meetingStartTime <= "+ startTime+" and meetingEndTime > "+startTime+ " and meetingRoom = "+croom + " and meetingStatus = 1";
		String chkStr2 = "SELECT * FROM meeting where meetingDate= "+cdate+ " and meetingStartTime >= "+ startTime+" and meetingStartTime < "+ endTime + " and meetingRoom = "+croom + " and meetingStatus = 1";		
		System.out.println(chkStr);
		System.out.println(chkStr2);		
		int flag=0;		
		if(flag==0){
			Connection conn = this.Connect2MySQL();
			Statement stmt = conn.createStatement();
			ResultSet rs1 = stmt.executeQuery(chkStr);
			if(rs1.next()){
				System.out.println("rs1 error");
				flag=1;
			}
			rs1.close();
			stmt.close();
			conn.close();
		}		
		if(flag==0){
			Connection conn = this.Connect2MySQL();
			Statement stmt = conn.createStatement();
			ResultSet rs2 = stmt.executeQuery(chkStr2);
			if(rs2.next()){
				System.out.println("rs2 error");
				flag=1;
			}
			rs2.close();
			stmt.close();
			conn.close();
		}				
		if(flag==0){
			System.out.println("rs no error");
			return false;
		}
		return true;		
	}
	
	//?
	public Meeting getMeeting(int ctime, int croom, int cdate) throws Exception{		
		String Str = "SELECT * FROM meeting where meetingDate= "+cdate+ " and meetingStartTime <= "+ctime+" and meetingEndTime > "+ctime+ " and meetingRoom = "+croom + " and meetingStatus = 1";		
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(Str);		
		Meeting m = new Meeting();		
		if(rs.next()){			
			m.setMeetingApplyTime(rs.getLong("meetingApplyTime"));
			m.setMeetingDate(rs.getInt("meetingDate"));
			m.setMeetingEndTime(rs.getInt("meetingEndTime"));
			m.setMeetingID(rs.getLong("meetingID"));
			m.setMeetingRoom(rs.getInt("meetingRoom"));
			m.setMeetingStarter(rs.getString("meetingStarter"));
			m.setMeetingStartTime(rs.getInt("meetingStartTime"));
			m.setMeetingStatus(rs.getInt("meetingStatus"));
		}
		rs.close();
		stmt.close();
		conn.close();
		return m;
	}
	
	//?
	public Meeting chkRoom(int ctime, int croom, int cdate) throws Exception{			
			String chkStr = "SELECT * FROM meeting where meetingDate= "+cdate+ " and meetingStartTime <= "+ctime+" and meetingEndTime > "+ctime+ " and meetingRoom = "+croom + " and meetingStatus = 1";
			System.out.println(chkStr);
			Meeting mrs = new Meeting();		
			Connection conn = this.Connect2MySQL();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(chkStr);				
			if(rs.next()){				
				mrs.setMeetingID(rs.getLong("meetingID"));
				mrs.setMeetingDate(rs.getInt("meetingDate"));
				mrs.setMeetingStartTime(rs.getInt("meetingStartTime"));
				mrs.setMeetingEndTime(rs.getInt("meetingEndTime"));
				mrs.setMeetingStarter(rs.getString("meetingStarter"));
				mrs.setMeetingRoom(rs.getInt("meetingRoom"));
				mrs.setMeetingStatus(rs.getInt("meetingStatus"));
				mrs.setMeetingApplyTime(rs.getLong("meetingApplyTime"));				
			}
			rs.close();
			stmt.close();
			conn.close();
			return mrs;			
		}
	
	public void cancelOrder(String cancelID) throws Exception{		
		String cancelStr = "UPDATE meeting SET meetingStatus = 2 WHERE meetingID ="+ cancelID;
		System.out.println(cancelStr);
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		stmt.execute(cancelStr);	
		stmt.close();
		conn.close();		
	}
	
	public ArrayList<Meeting> chkUserHistoryApply() throws Exception {		
		ArrayList<Meeting> allApplies = new ArrayList<Meeting>();		
		String chkStr = "SELECT * FROM meeting";		
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(chkStr);			
		while(rs.next()){
			Meeting mrs = new Meeting();
			mrs.setMeetingID(rs.getLong("meetingID"));
			mrs.setMeetingDate(rs.getInt("meetingDate"));
			mrs.setMeetingStartTime(rs.getInt("meetingStartTime"));
			mrs.setMeetingEndTime(rs.getInt("meetingEndTime"));
			mrs.setMeetingStarter(rs.getString("meetingStarter"));
			mrs.setMeetingRoom(rs.getInt("meetingRoom"));
			mrs.setMeetingStatus(rs.getInt("meetingStatus"));
			mrs.setMeetingApplyTime(rs.getLong("meetingApplyTime"));
			allApplies.add(mrs);
		}
		rs.close();
		stmt.close();
		conn.close();
		return allApplies;
	}

	public ArrayList<Room> getRooms() throws Exception {		
		ArrayList<Room> rooms = new ArrayList<Room>();		
		String Str = "SELECT * FROM room";				
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(Str);			
		while(rs.next()){			
			Room r = new Room();
			r.setRoomID(rs.getInt("roomID"));
			r.setRoomName(rs.getString("roomName"));
			r.setRoomStartTime(rs.getInt("roomStartTime"));
			r.setRoomEndTime(rs.getInt("roomEndTime"));
			r.setRoomPermission(rs.getString("roomPermission"));
			rooms.add(r);
		}
		rs.close();
		stmt.close();
		conn.close();
		return rooms;
	}
	
	public ArrayList<Meeting> chkUserApply(String username) throws Exception {
		ArrayList<Meeting> allApplies = new ArrayList<Meeting>();		
		String chkStr = "SELECT * FROM meeting where meetingStatus = 1 and meetingStarter= '"+ username +"'";		
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(chkStr);			
		while(rs.next()){
			Meeting mrs = new Meeting();
			mrs.setMeetingID(rs.getLong("meetingID"));
			mrs.setMeetingDate(rs.getInt("meetingDate"));
			mrs.setMeetingStartTime(rs.getInt("meetingStartTime"));
			mrs.setMeetingEndTime(rs.getInt("meetingEndTime"));
			mrs.setMeetingRoom(rs.getInt("meetingRoom"));
			mrs.setMeetingApplyTime(rs.getLong("meetingApplyTime"));
			mrs.setMeetingGuest(rs.getString("meetingGuest"));
			allApplies.add(mrs);
		}
		rs.close();
		stmt.close();
		conn.close();
		return allApplies;
	}
	
	public ArrayList<Meeting> chkRoomApply(int roomid) throws Exception {
		ArrayList<Meeting> allApplies = new ArrayList<Meeting>();		
		String chkStr = "SELECT * FROM meeting where meetingStatus = 1 and meetingRoom= '"+ roomid +"'";		
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(chkStr);			
		while(rs.next()){
			Meeting mrs = new Meeting();
			mrs.setMeetingID(rs.getLong("meetingID"));
			mrs.setMeetingDate(rs.getInt("meetingDate"));
			mrs.setMeetingStartTime(rs.getInt("meetingStartTime"));
			mrs.setMeetingEndTime(rs.getInt("meetingEndTime"));
			mrs.setMeetingStarter(rs.getString("meetingStarter"));
			mrs.setMeetingApplyTime(rs.getLong("meetingApplyTime"));
			allApplies.add(mrs);
		}
		rs.close();
		stmt.close();
		conn.close();
		return allApplies;
	}

	public void alterRoomInfo(int selectedRoom, int startTime, int endTime, String authority) throws Exception{		
		String alterStr = "UPDATE room SET roomPermission='" + authority + "', roomStartTime =" + startTime + ", roomEndTime =" + endTime + " WHERE roomID="+ selectedRoom;		
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		stmt.execute(alterStr);
		stmt.close();
		conn.close();
	}

	public void alterUserInfo(String userid, String userposition, String usermail, String userpwd) throws Exception{		
		String alterStr = "UPDATE user SET userpwd='"+  userpwd + "', usermail='"+  usermail + "', userposition='"+  userposition + "' WHERE userid='" + userid+ "'";
		System.out.println(alterStr);		
		Connection conn = this.Connect2MySQL();
		Statement stmt = conn.createStatement();
		stmt.execute(alterStr);
		stmt.close();
		conn.close();
	}
	
}