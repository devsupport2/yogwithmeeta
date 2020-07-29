package com.ui.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ui.dao.GalleryDAO;

import com.ui.model.Gallery;
import com.ui.model.GalleryImage;

public class GalleryDAOImpl implements GalleryDAO {
	@Autowired
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	JdbcTemplate jdbcTemplate;


	private static final Logger logger = LoggerFactory.getLogger(GalleryDAOImpl.class);
	

	@Override
    public List<Gallery> getAllAlbum() {
		logger.info("+++++ GET ALL ALBUM +++++");
        final List<Gallery> sta = new ArrayList<Gallery>();
        final String s = "y";
        final String sql = "select album_Id, album_title, album_subtitle, DATE_FORMAT(album_date,'%d/%m/%Y') as album_date, description from album where status=? order by album_title desc";
        Connection conn = null;
        try {
            conn = this.dataSource.getConnection();
            final PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, s);
            Gallery album = null;
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                album = new Gallery();
                album.setAlbumId(rs.getInt("album_Id"));
                album.setAlbumTitle(rs.getString("album_title"));
                album.setAlbumSubtitle(rs.getString("album_subtitle"));
                album.setAlbumDate(rs.getString("album_date"));
                album.setDescription(rs.getString("description"));
                sta.add(album);
            }
            rs.close();
            ps.close();
            return sta;
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        finally {
            if (conn != null) {
                try {
                    conn.close();
                }
                catch (SQLException ex) {}
            }
        }
    }


	@Override
	public String addAlbum(Gallery a) {
		 logger.info("+++++ ADD ALBUM +++++");
	        final String sql = "insert into album(album_title, album_subtitle, album_date, description, status, created_by, ip_address) values(?,?,STR_TO_DATE(?,'%d/%m/%Y'),?,?,?,?)";
	        final String status = "y";
	        Connection conn = null;
	        try {
	            conn = this.dataSource.getConnection();
	            final PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setString(1, a.getAlbumTitle());
	            ps.setString(2, a.getAlbumSubtitle());
	            ps.setString(3, a.getAlbumDate());
	            ps.setString(4, a.getDescription());
	            ps.setString(5, status);
	            ps.setInt(6, a.getCreatedBy());
	            ps.setString(7, a.getIpAddress());
	            ps.executeUpdate();
	            return "Success";
	        }
	        catch (SQLException e) {
	            System.out.println(e.getMessage());
	            return "Failed to add album";
	        }
	        finally {
	            if (conn != null) {
	                try {
	                    conn.close();
	                }
	                catch (SQLException ex) {}
	            }
	        }
	    }


	@Override
    public int getLastAlbumId() {
        logger.info("+++++ GET LAST ALBUM ID +++++");
        final String sql = "select album_Id from album order by album_Id desc limit 0,1 ";
        int id = 0;
        Connection conn = null;
        try {
            conn = this.dataSource.getConnection();
            final PreparedStatement ps = conn.prepareStatement(sql);
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("album_Id");
            }
            rs.close();
            ps.close();
            return id;
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        finally {
            if (conn != null) {
                try {
                    conn.close();
                }
                catch (SQLException ex) {}
            }
        }
    }


	@Override
	public String addAlbumImage(GalleryImage p) {
		logger.info("+++++ ADD ALBUM IMAGE +++++");
        final String sql = "insert into album_image (image_title, description, image, album_id, vid_ID, created_by, ip_address) values (?,?,?,?,?,?,?)";
        Connection conn = null;
        try {
            conn = this.dataSource.getConnection();
            final PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p.getImageTitle());
            ps.setString(2, p.getDescription());
            ps.setString(3, p.getImage());
            ps.setInt(4, p.getAlbumId());
            ps.setString(5, p.getVidId());
            ps.setInt(6, p.getCreatedBy());
            ps.setString(7, p.getIpAddress());
            ps.executeUpdate();
            return "Success";
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        finally {
            if (conn != null) {
                try {
                    conn.close();
                }
                catch (SQLException ex) {}
            }
        }
    }


	@Override
	public Gallery getAlbumDetailById(int albumid) {
		logger.info("+++++ GET ALBUM DETAIL BY ALBUMID +++++");
        Gallery album = null;
        final String s = "y";
        final String sql = "select album_Id, album_title, album_subtitle, DATE_FORMAT(album_date,'%d/%m/%Y') as album_date, description from album where status=? and album_id=?";
        Connection conn = null;
        try {
            conn = this.dataSource.getConnection();
            final PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, s);
            ps.setInt(2, albumid);
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                album = new Gallery();
                album.setAlbumId(rs.getInt("album_Id"));
                album.setAlbumTitle(rs.getString("album_title"));
                album.setAlbumSubtitle(rs.getString("album_subtitle"));
                album.setAlbumDate(rs.getString("album_date"));
                album.setDescription(rs.getString("description"));
            }
            rs.close();
            ps.close();
            return album;
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        finally {
            if (conn != null) {
                try {
                    conn.close();
                }
                catch (SQLException ex) {}
            }
        }
    }


	@Override
	public List<GalleryImage> getAlbumImage(int albumid) {
		logger.info("+++++ GET ALBUM IMAGE +++++");
        final List<GalleryImage> sta = new ArrayList<GalleryImage>();
        final String sql = "select album_image_id, image_title, description, image, album_id, vid_ID from album_image where album_id=? order by album_image_id";
        Connection conn = null;
        try {
            conn = this.dataSource.getConnection();
            final PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, albumid);
            GalleryImage albumimage = null;
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                albumimage = new GalleryImage();
                albumimage.setAlbumImageId(rs.getInt("album_image_id"));
                albumimage.setImageTitle(rs.getString("image_title"));
                albumimage.setDescription(rs.getString("description"));
                albumimage.setImage(rs.getString("image"));
                albumimage.setAlbumId(rs.getInt("album_id"));
                albumimage.setVidId(rs.getString("vid_ID"));
                sta.add(albumimage);
            }
         
            rs.close();
            ps.close();
            return sta;
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        finally {
            if (conn != null) {
                try {
                    conn.close();
                }
                catch (SQLException ex) {}
            }
        }
	}


	@Override
	public String deleteImage(int albumid, String imagetitle) {
		logger.info("+++++ INSIDE DELETE IMAGE +++++");
        final String sql = "delete from album_image where album_id=? and image_title=?";
        Connection conn = null;
        String result = "";
        try {
            conn = this.dataSource.getConnection();
            final PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, albumid);
            ps.setString(2, imagetitle);
            ps.executeUpdate();
            result = "Success";
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        finally {
            if (conn != null) {
                try {
                    conn.close();
                }
                catch (SQLException ex) {}
            }
        }
        if (conn != null) {
            try {
                conn.close();
            }
            catch (SQLException ex2) {}
        }
        return result;
    }


	 @Override
	    public String editAlbum(Gallery p) {
	        logger.info("+++++ EDIT ALBUM +++++");
	        final String sql = "update album set album_title=?, album_subtitle=?, album_date=STR_TO_DATE(?,'%d/%m/%Y'), description=?, created_by=?, ip_address=? where album_Id=?";
	        Connection conn = null;
	        try {
	            conn = this.dataSource.getConnection();
	            final PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setString(1, p.getAlbumTitle());
	            ps.setString(2, p.getAlbumSubtitle());
	            ps.setString(3, p.getAlbumDate());
	            ps.setString(4, p.getDescription());
	            ps.setInt(5, p.getCreatedBy());
	            ps.setString(6, p.getIpAddress());
	            ps.setInt(7, p.getAlbumId());
	            ps.executeUpdate();
	            return "Success";
	        }
	        catch (SQLException e) {
	            throw new RuntimeException(e);
	        }
	        finally {
	            if (conn != null) {
	                try {
	                    conn.close();
	                }
	                catch (SQLException ex) {}
	            }
	        }
	    }



		@Override
	    public void deleteAlbum(final int albumid) {
	        logger.info("+++++ DELETE ALBUM +++++");
	        final String status = "n";
	        final String sql = "update album set status=? where album_id=?";
	        Connection conn = null;
	        try {
	            conn = this.dataSource.getConnection();
	            final PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setString(1, status);
	            ps.setInt(2, albumid);
	            ps.executeUpdate();
	        }
	        catch (SQLException e) {
	            throw new RuntimeException(e);
	        }
	        finally {
	            if (conn != null) {
	                try {
	                    conn.close();
	                }
	                catch (SQLException ex) {}
	            }
	        }
	        if (conn != null) {
	            try {
	                conn.close();
	            }
	            catch (SQLException ex2) {}
	        }
	}


    @Override
    public List<Gallery> getThreeAlbum() {
      logger.info("+++++ GET ALL ALBUM +++++");
      final List<Gallery> sta = new ArrayList<Gallery>();
      final String s = "y";
      final String sql = "select album_Id, album_title, album_subtitle, DATE_FORMAT(album_date,'%d/%m/%Y') as album_date, description from album where status=? order by album_date asc limit 0,3";
      Connection conn = null;
      try {
          conn = this.dataSource.getConnection();
          final PreparedStatement ps = conn.prepareStatement(sql);
          ps.setString(1, s);
          Gallery album = null;
          final ResultSet rs = ps.executeQuery();
          while (rs.next()) {
              album = new Gallery();
              album.setAlbumId(rs.getInt("album_Id"));
              album.setAlbumTitle(rs.getString("album_title"));
              album.setAlbumSubtitle(rs.getString("album_subtitle"));
              album.setAlbumDate(rs.getString("album_date"));
              album.setDescription(rs.getString("description"));
              sta.add(album);
          }
          rs.close();
          ps.close();
          return sta;
      }
      catch (SQLException e) {
          throw new RuntimeException(e);
      }
      finally {
          if (conn != null) {
              try {
                  conn.close();
              }
              catch (SQLException ex) {}
          }
      }
    }


/*    @Override
    public List<GalleryImage> getAlbumOneImage() {
      logger.info("Inside Get All Album One Image Impl");
      
      List<GalleryImage> sta = new ArrayList<GalleryImage>(); 
      
      String sql = "select f.album_image_id, f.description, f.image_title, f.image, f.album_id, f.vid_ID, a.album_title, a.description from ( SELECT min(album_image_id) as firstimage, album_id FROM ywm.album_image group by album_id ) as x inner join album_image as f on f.album_id = x.album_id and f.album_image_id = x.firstimage left join album a on f.album_id=a.album_Id";
      
      Connection conn = null;
      
      try
      {
          conn = dataSource.getConnection();
          PreparedStatement ps = conn.prepareStatement(sql);
          
          GalleryImage gaim = null;
          
          ResultSet rs = ps.executeQuery();
          
          while (rs.next())
          {
            
            gaim = new GalleryImage();
            gaim.setAlbumImageId(rs.getInt("album_image_id"));
            gaim.setDescription(rs.getString("description"));
            gaim.setImageTitle(rs.getString("image_title"));
            gaim.setImage(rs.getString("image"));
            gaim.setAlbumId(rs.getInt("album_id"));
            gaim.setAlbumTitle(rs.getString("album_title"));
            gaim.setAlbumDescription(rs.getString("description"));
            gaim.setVidId(rs.getString("vid_ID"));
            
              sta.add(gaim);
         }
         rs.close();
         ps.close();
        
         return sta;
      }
      catch (SQLException e)
      {
          throw new RuntimeException(e);
      }
      finally
      {
          if (conn != null)
          {
              try
              {
                  conn.close();
              }
              catch (SQLException e) {}
          }
      }
    }*/
    
    @Override
    public List<GalleryImage> getAlbumOneImage() {
    logger.info("Inside Get All Album One Image Impl");
    
    List<GalleryImage> sta = new ArrayList<GalleryImage>(); 
    
    String sql = "select min(ai.album_image_id) as album_image_id, ai.image_title, ai.description, ai.image, a.album_id, ai.vid_ID, a.album_title, a.description from album a, album_image ai where ai.album_id=a.album_id group by ai.album_id desc";
    
    Connection conn = null;
    
    try
    {
        conn = dataSource.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        
        ResultSet rs = ps.executeQuery();
        GalleryImage gaim = null;
        while (rs.next())
        {
          
          gaim = new GalleryImage();
          gaim.setAlbumImageId(rs.getInt("album_image_id"));
          gaim.setDescription(rs.getString("description"));
          gaim.setImageTitle(rs.getString("image_title"));
          gaim.setImage(rs.getString("image"));
          gaim.setAlbumId(rs.getInt("album_id"));
          gaim.setAlbumTitle(rs.getString("album_title"));
          gaim.setAlbumDescription(rs.getString("description"));
          gaim.setVidId(rs.getString("vid_ID"));
          
            sta.add(gaim);
       }
       rs.close();
       ps.close();
      
       return sta;
    }
    catch (SQLException e)
    {
        throw new RuntimeException(e);
    }
    finally
    {
        if (conn != null)
        {
            try
            {
                conn.close();
            }
            catch (SQLException e) {}
        }
    }
   }


    @Override
    public List<GalleryImage> getAllAlbumImages() {
      logger.info("Inside Get All Album Images Impl");
      
      List<GalleryImage> sta = new ArrayList<GalleryImage>(); 
      
      String sql = "select album_image_id, image_title, description, image, album_id,vid_ID from album_image order by album_image_id";
      
      Connection conn = null;
      
      try
      {
          conn = dataSource.getConnection();
          PreparedStatement ps = conn.prepareStatement(sql);
          
          GalleryImage gaim = null;
          
          ResultSet rs = ps.executeQuery();
          
          while (rs.next())
          {
            gaim = new GalleryImage();
            gaim.setAlbumImageId(rs.getInt("album_image_id"));
            gaim.setDescription(rs.getString("description"));
            gaim.setImageTitle(rs.getString("image_title"));
            gaim.setImage(rs.getString("image"));
            gaim.setAlbumId(rs.getInt("album_id"));
            gaim.setVidId(rs.getString("vid_ID"));
              sta.add(gaim);
         }
         rs.close();
         ps.close();
        
         return sta;
      }
      catch (SQLException e)
      {
          throw new RuntimeException(e);
      }
      finally
      {
          if (conn != null)
          {
              try
              {
                  conn.close();
              }
              catch (SQLException e) {}
          }
      }
    }


}
