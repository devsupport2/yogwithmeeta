package com.ui.dao;

import java.util.List;

import com.ui.model.Gallery;
import com.ui.model.GalleryImage;

public interface GalleryDAO {

    public List<Gallery> getAllAlbum();

    public String addAlbum(Gallery a);

    public int getLastAlbumId();

    public String addAlbumImage(GalleryImage gaim);

    public Gallery getAlbumDetailById(int albumid);

    public List<GalleryImage> getAlbumImage(int albumid);

    public String deleteImage(int albumid, String imagetitle);

    public String editAlbum(Gallery a);

    public void deleteAlbum(int albumid);

    public List<Gallery> getThreeAlbum();

    public Object getAlbumOneImage();

    public Object getAllAlbumImages();
}
