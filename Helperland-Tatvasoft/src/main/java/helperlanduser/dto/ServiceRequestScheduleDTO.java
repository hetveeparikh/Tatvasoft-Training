package helperlanduser.dto;

public class ServiceRequestScheduleDTO {
	private int id;
	private String start;
	private String end;
	private String title;
	private String color;
	private String textColor;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	@Override
	public String toString() {
		return "ServiceRequestDTO [id=" + id + ", start=" + start + ", end=" + end + ", title=" + title + ", color="
				+ color + ", textColor=" + textColor + "]";
	}
	
	
}
