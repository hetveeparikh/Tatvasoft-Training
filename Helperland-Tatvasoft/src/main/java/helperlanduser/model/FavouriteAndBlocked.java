package helperlanduser.model;

public class FavouriteAndBlocked {
	private int id;
	private int userId;
	private int targetUserId;
	private int isFavorite;
	private int isBlocked;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getTargetUserId() {
		return targetUserId;
	}
	public void setTargetUserId(int targetUserId) {
		this.targetUserId = targetUserId;
	}
	public int getIsFavorite() {
		return isFavorite;
	}
	public void setIsFavorite(int isFavorite) {
		this.isFavorite = isFavorite;
	}
	public int getIsBlocked() {
		return isBlocked;
	}
	public void setIsBlocked(int isBlocked) {
		this.isBlocked = isBlocked;
	}
	@Override
	public String toString() {
		return "FavouriteAndBlocked [id=" + id + ", userId=" + userId + ", targetUserId=" + targetUserId
				+ ", isFavorite=" + isFavorite + ", isBlocked=" + isBlocked + "]";
	}
	
	
}
