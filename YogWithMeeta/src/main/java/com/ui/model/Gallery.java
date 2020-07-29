package com.ui.model;

import java.util.List;

public class Gallery {
private int albumId;
private String albumTitle;
private String albumSubtitle;
private String albumDate;
private String description;
private String status;
private int createdBy;
private String ipAddress;

private List<GalleryImage> getAlbumImageList;

public int getAlbumId() {
    return albumId;
}
public void setAlbumId(int albumId) {
    this.albumId = albumId;
}
public String getAlbumTitle() {
    return albumTitle;
}
public void setAlbumTitle(String albumTitle) {
    this.albumTitle = albumTitle;
}
public String getAlbumSubtitle() {
    return albumSubtitle;
}
public void setAlbumSubtitle(String albumSubtitle) {
    this.albumSubtitle = albumSubtitle;
}
public String getAlbumDate() {
    return albumDate;
}
public void setAlbumDate(String albumDate) {
    this.albumDate = albumDate;
}
public String getDescription() {
    return description;
}
public void setDescription(String description) {
    this.description = description;
}
public String getStatus() {
    return status;
}
public void setStatus(String status) {
    this.status = status;
}
public int getCreatedBy() {
    return createdBy;
}
public void setCreatedBy(int createdBy) {
    this.createdBy = createdBy;
}
public String getIpAddress() {
    return ipAddress;
}
public void setIpAddress(String ipAddress) {
    this.ipAddress = ipAddress;
}
public List<GalleryImage> getGetAlbumImageList() {
    return getAlbumImageList;
}
public void setGetAlbumImageList(List<GalleryImage> getAlbumImageList) {
    this.getAlbumImageList = getAlbumImageList;
}






}
