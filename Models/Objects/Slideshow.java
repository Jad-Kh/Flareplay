package Models.Objects;

import java.util.ArrayList;

public class Slideshow {
	
	private String slideshowName;
	private ArrayList<String> slideshowPics = new ArrayList<String>();
	
	public String getSlideshowName() {
		return slideshowName;
	}
	
	public void setSlideshowName(String slideshowName) {
		this.slideshowName = slideshowName;
	}
	
	public ArrayList<String> getSlideshowPics() {
		return slideshowPics;
	}
	
	public void setSlideshowPics(ArrayList<String> slideshowPics) {
		this.slideshowPics = slideshowPics;
	}
	
}
