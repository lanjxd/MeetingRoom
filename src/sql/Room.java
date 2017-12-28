package sql;

public class Room {

	private int roomID;
	private String roomName;
	private int roomStartTime;
	private int roomEndTime;
	private String roomPermission;
	
	public int getRoomID() {
		return roomID;
	}
	public void setRoomID(int roomID) {
		this.roomID = roomID;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getRoomStartTime() {
		return roomStartTime;
	}
	public void setRoomStartTime(int roomStartTime) {
		this.roomStartTime = roomStartTime;
	}
	public int getRoomEndTime() {
		return roomEndTime;
	}
	public void setRoomEndTime(int roomEndTime) {
		this.roomEndTime = roomEndTime;
	}
	public String getRoomPermission() {
		return roomPermission;
	}
	public void setRoomPermission(String roomPermission) {
		this.roomPermission = roomPermission;
	}
}
