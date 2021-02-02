package Models.Objects;

public class Activity {
	
	private int activityId;
	private String activityPic;
	private String activityTitle;
	private String activityType;
	
	public int getActivityId() {
		return activityId;
	}
	
	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}
	
	public String getActivityPic() {
		return activityPic;
	}
	
	public void setActivityPic(String activityPic) {
		this.activityPic = activityPic;
	}
	
	public String getActivityTitle() {
		return activityTitle;
	}
	
	public void setActivityTitle(String activityTitle) {
		this.activityTitle = activityTitle;
	}
	
	public String getActivityType() {
		return activityType;
	}
	
	public void setActivityType(String activityType) {
		this.activityType = activityType;
	}
}
