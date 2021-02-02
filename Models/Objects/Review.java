package Models.Objects;

public class Review {

	private int reviewId;
	private String reviewTitle;
	private String reviewDescription;
	private String reviewRecommend;
	
	public int getReviewId() {
		return reviewId;
	}
	
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	
	public String getReviewTitle() {
		return reviewTitle;
	}
	
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	
	public String getReviewDescription() {
		return reviewDescription;
	}
	
	public void setReviewDescription(String reviewDescription) {
		this.reviewDescription = reviewDescription;
	}
	
	public String getReviewRecommend() {
		return reviewRecommend;
	}
	
	public void setReviewRecommend(String reviewRecommend) {
		this.reviewRecommend = reviewRecommend;
	}
}
