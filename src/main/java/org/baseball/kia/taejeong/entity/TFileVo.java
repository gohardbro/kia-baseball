package org.baseball.kia.taejeong.entity;

public class TFileVo {
	private String id, profileName, ContentType, profilePath;
	

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProfileName() {
		return profileName;
	}
	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}
	public String getContentType() {
		return ContentType;
	}
	public void setContentType(String contentType) {
		ContentType = contentType;
	}
	public String getProfilePath() {
		return profilePath;
	}
	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}
	@Override
	public String toString() {
		return "TFileVo [id=" + id + ", profileName=" + profileName + ", ContentType=" + ContentType + ", profilePath="
				+ profilePath + "]";
	}
	
	
	
	
	
	
	
	
	
}
