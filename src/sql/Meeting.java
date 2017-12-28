package sql;

public class Meeting {

	private long meetingID;		//ID=ApplyTime+Status
	private int meetingDate;
	private int meetingStartTime;
	private int meetingEndTime;
	private String meetingStarter;
	private int meetingRoom;
	private int meetingStatus;
	private long meetingApplyTime;
	private String meetingGuest;
	private float meetingDuration;
	
	public long getMeetingID() {
		return meetingID;
	}
	public void setMeetingID(long meetingID) {
		this.meetingID = meetingID;
	}
	public int getMeetingDate() {
		return meetingDate;
	}
	public void setMeetingDate(int meetingDate) {
		this.meetingDate = meetingDate;
	}
	public int getMeetingStartTime() {
		return meetingStartTime;
	}
	public void setMeetingStartTime(int meetingStartTime) {
		this.meetingStartTime = meetingStartTime;
	}
	public int getMeetingEndTime() {
		return meetingEndTime;
	}
	public void setMeetingEndTime(int meetingEndTime) {
		this.meetingEndTime = meetingEndTime;
	}
	public String getMeetingStarter() {
		return meetingStarter;
	}
	public void setMeetingStarter(String meetingStarter) {
		this.meetingStarter = meetingStarter;
	}
	public int getMeetingRoom() {
		return meetingRoom;
	}
	public void setMeetingRoom(int meetingRoom) {
		this.meetingRoom = meetingRoom;
	}
	public int getMeetingStatus() {
		return meetingStatus;
	}
	public void setMeetingStatus(int meetingStatus) {
		this.meetingStatus = meetingStatus;
	}
	public long getMeetingApplyTime() {
		return meetingApplyTime;
	}
	public void setMeetingApplyTime(long meetingApplyTime) {
		this.meetingApplyTime = meetingApplyTime;
	}
	public String getMeetingGuest() {
		return meetingGuest;
	}
	public void setMeetingGuest(String meetingGuest) {
		this.meetingGuest = meetingGuest;
	}
	public float getMeetingDuration() {
		return meetingDuration;
	}
	public void setMeetingDuration(float meetingDuration) {
		this.meetingDuration = meetingDuration;
	}
}

