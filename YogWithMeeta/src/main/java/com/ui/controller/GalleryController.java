package com.ui.controller;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ui.dao.GalleryDAO;
import com.ui.model.Gallery;
import com.ui.model.GalleryImage;




@RestController
public class GalleryController {
    
    @Autowired
    GalleryDAO galleryDao;
    
    Gallery ga;
    GalleryImage gaim;
    
    
    private static final Logger logger = LoggerFactory.getLogger(GalleryController.class);

    @RequestMapping(value = "/getAllAlbum", method = RequestMethod.GET, produces = "application/json")
    public List<Gallery> getAllAlbum(HttpServletRequest request) {
        logger.info("***** GET ALL ALBUMS *****");
        final List<Gallery> Album = galleryDao.getAllAlbum();
        return Album;
    }
    
     @RequestMapping(value = "/getAlbumDetailById" , method = RequestMethod.GET , produces = "application/json")
        public Gallery getAlbumDetailById(int albumid, HttpServletRequest request) {
            logger.info("***** GET ALBUM DETAIL BY ID *****");
            Gallery album = new Gallery();
            album = galleryDao.getAlbumDetailById(albumid);
            album.setGetAlbumImageList(galleryDao.getAlbumImage(albumid));
            return album;
        }
     
     @RequestMapping(value = "/getAllAlbumWithImages", method = RequestMethod.GET, produces = "application/json")
     public List<Gallery> getAllAlbumWithImages(HttpServletRequest request) {
         logger.info("***** GET ALL ALBUMS *****");
         List<Gallery> Album = galleryDao.getAllAlbum();
         for(Gallery albumimg:Album) {
             albumimg.setGetAlbumImageList(galleryDao.getAlbumImage(albumimg.getAlbumId()));
         }
         return Album;
     }
     
     @RequestMapping(value = "/getThreeAlbumWithImages", method = RequestMethod.GET, produces = "application/json")
     public List<Gallery> getThreeAlbumWithImages(HttpServletRequest request) {
         logger.info("***** GET Three ALBUMS *****");
         List<Gallery> Album = galleryDao.getThreeAlbum();
         for(Gallery albumimg:Album) {
             albumimg.setGetAlbumImageList(galleryDao.getAlbumImage(albumimg.getAlbumId()));
         }
         return Album;
     }
     
     @RequestMapping(value = "/AlbumImage", method = RequestMethod.GET, produces = "application/json")
        public List<GalleryImage> AlbumImage(final int albumid, final HttpServletRequest request) {
            logger.info("***** GET ALBUM IMAGE BY ALBUMID *****");
            List<GalleryImage> AlbumImage = galleryDao.getAlbumImage(albumid);
            return AlbumImage;
        }
    
    @RequestMapping(value = "/addAlbum", method = RequestMethod.POST)
    public String addAlbum(String title, String subtitle,String tourdate,String description, HttpServletRequest request, HttpSession session) {
        logger.info("***** ADD ALBUM *****");
        final int createdBy = Integer.parseInt(session.getAttribute("adminuserid").toString());
        final String p = title.replace("$", "&");
        final String p2 = p.replace("~", "#");
        final String p3 = p2.replace("!", "%");
        final String sub = subtitle.replace("$", "&");
        final String sub2 = sub.replace("~", "#");
        final String sub3 = sub2.replace("!", "%");
        final String status = "y";
        String IpAddress = request.getHeader("X-FORWARDED-FOR");
        if (IpAddress == null) {
            IpAddress = request.getRemoteAddr();
        }
        
        if(tourdate == ""){
          tourdate = null;
        }
        Gallery a = new Gallery();
        a.setAlbumTitle(p3);
        a.setAlbumSubtitle(sub3);
        a.setAlbumDate(tourdate);
        a.setDescription(description);
        a.setStatus(status);
        a.setCreatedBy(createdBy);
        a.setIpAddress(IpAddress);
        final String result = galleryDao.addAlbum(a);
        return result;
    }
      
    
    @RequestMapping(value ="addAlbumImage", method = RequestMethod.POST)
    public String addAlbumImage(@RequestParam(value = "image", required = false) MultipartFile[] image, String[] imagetitle, String[] imagedescription, String[] videoId, HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
        logger.info("***** INSIDE ADD ALBUM IMAGE *****");
        final int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
        String IpAddress = request.getHeader("X-FORWARDED-FOR");
        if (IpAddress == null) {
            IpAddress = request.getRemoteAddr();
        }
        final int albumid = galleryDao.getLastAlbumId();
        String image2 = null;
        System.out.println(String.valueOf(image.length) + "===============image length");
        String result = "";
        try {
            if (image != null && image.length > 0) {
                try {
                    for (int j = 0; j < image.length; ++j) {
                        System.out.println(String.valueOf(j) + "===============image length");
                        if(videoId[j].equals("") || videoId[j].equals(null)) {
                        byte[] bytes = image[j].getBytes();
                        final File dir = new File(String.valueOf(request.getSession().getServletContext().getRealPath("")) + "/resources/admin/images/" + File.separator + "photoalbum");
                        if (!dir.exists()) {
                            dir.mkdirs();
                        }
                        final String path = request.getSession().getServletContext().getRealPath("/resources/admin/images/photoalbum/");
                        final File uploadfile = new File(String.valueOf(path) + File.separator + image[j].getOriginalFilename());
                        final int height = 575;
                        final int width = 915;
                        final ByteArrayInputStream in = new ByteArrayInputStream(bytes);
                        try {
                            final BufferedImage img = ImageIO.read(in);
                            final int original_width = img.getWidth();
                            final int original_height = img.getHeight();
                            int bound_width = 915;
                            int bound_height = 575;
                            final int new_width = original_width;
                            final int new_height = original_height;
                            if (original_height / bound_height > original_width / bound_width) {
                                bound_width = bound_height * original_width / original_height;
                            }
                            else {
                                bound_height = bound_width * original_height / original_width;
                            }
                            final Image scaledImage = img.getScaledInstance(bound_width, bound_height, 4);
                            final BufferedImage imageBuff = new BufferedImage(width, height, 1);
                            final Graphics2D drawer = imageBuff.createGraphics();
                            drawer.setBackground(Color.WHITE);
                            drawer.clearRect(0, 0, width, height);
                            imageBuff.getGraphics().drawImage(scaledImage, (width - bound_width) / 2, (height - bound_height) / 2, new Color(0, 0, 0), null);
                            final ByteArrayOutputStream buffer = new ByteArrayOutputStream();
                            ImageIO.write(imageBuff, "jpg", buffer);
                            bytes = buffer.toByteArray();
                        }
                        catch (IOException ex) {}
                        System.out.println("*********************Path" + path);
                        final BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(uploadfile));
                        bufferedOutputStream.write(bytes);
                        bufferedOutputStream.close();
                        image2 = String.valueOf(request.getScheme()) + "://" + request.getServerName() + ":" + request.getServerPort() + "/resources/admin/images/photoalbum/" + image[j].getOriginalFilename();
                        final String t = imagetitle[j].toString().replace("$", "&");
                        final String t2 = t.replace("~", "#");
                        final String t3 = t2.replace("!", "%");
                        System.out.println(String.valueOf(t3) + "=================================title");
                        String vid3 = null;
                        gaim = new GalleryImage();
                        gaim.setImageTitle(t3);
                        gaim.setVidId(vid3);
                        gaim.setDescription(imagedescription[j].toString());
                        gaim.setImage(image2);
                        gaim.setAlbumId(albumid);
                        gaim.setCreatedBy(id);
                        gaim.setIpAddress(IpAddress);
                        result = galleryDao.addAlbumImage(gaim);
                    }else {System.out.println(videoId[j]);
                    final String t = imagetitle[j].toString().replace("$", "&");
                    final String t2 = t.replace("~", "#");
                    final String t3 = t2.replace("!", "%");
                    System.out.println(String.valueOf(t3) + "=================================title");
                    final String vid = videoId[j].toString().replace("$", "&");
                    final String vid2 = vid.replace("~", "#");
                    final String vid3 = vid2.replace("!", "%");
                    System.out.println(String.valueOf(t3) + "=================================vid id");
                    image2 = null;
                    gaim = new GalleryImage();
                    gaim.setImageTitle(t3);
                    gaim.setVidId(vid3);
                    gaim.setDescription(imagedescription[j].toString());
                    gaim.setImage(image2);
                    gaim.setAlbumId(albumid);
                    gaim.setCreatedBy(id);
                    gaim.setIpAddress(IpAddress);
                    result = galleryDao.addAlbumImage(gaim);
            }
                    }
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    @RequestMapping(value ="editAlbum", method = RequestMethod.PUT)
    public String editAlbum(int albumid, String title, String subtitle, String tourdate, String description, HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
        logger.info("***** EDIT PHOTO ALBUM *****");
         String p = title.replace("$", "&");
         String p2 = p.replace("~", "#");
         String p3 = p2.replace("!", "%");
         int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
        String IpAddress = request.getHeader("X-FORWARDED-FOR");
        if (IpAddress == null) {
            IpAddress = request.getRemoteAddr();
        }
        Gallery a = new Gallery();
        a.setAlbumId(albumid);
        a.setAlbumTitle(p3);
        a.setAlbumSubtitle(subtitle);
        a.setAlbumDate(tourdate);
        a.setDescription(description);
        a.setCreatedBy(id);
        a.setIpAddress(IpAddress);
        String result = galleryDao.editAlbum(a);
        return result;
    }
    
    @RequestMapping(value = "removeAlbumImageRowEdit", method = RequestMethod.POST)
    public String removeAlbumImageRowEdit(final int albumid, final String imagetitle, final HttpServletRequest request, final HttpSession session) {
        logger.info("***** INSIDE REMOVE IMAGE*****");
        String result = "";
        result = galleryDao.deleteImage(albumid, imagetitle);
        return result;
    }
    
    @RequestMapping(value = "editAlbumImage" , method =  RequestMethod.POST)
    public String editAlbumImage(@RequestParam(value = "image", required = false) MultipartFile image, int albumid, String imagetitle, String imagedescription, String videoId, HttpServletRequest request, HttpSession session) {
        logger.info("***** INSIDE EDIT ALBUM IMAGE *****");
        final int id = Integer.parseInt(session.getAttribute("adminuserid").toString());
        String IpAddress = request.getHeader("X-FORWARDED-FOR");
        if (IpAddress == null) {
            IpAddress = request.getRemoteAddr();
        }
        String image2 = null;
        String result = "";
        try {
            try {
                if(videoId.equals("") || videoId.equals(null)) {
                byte[] bytes = image.getBytes();
                final File dir = new File(String.valueOf(request.getSession().getServletContext().getRealPath("")) + "/resources/admin/images/" + File.separator + "photoalbum");
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                final String path = request.getSession().getServletContext().getRealPath("/resources/admin/images/photoalbum/");
                final File uploadfile = new File(String.valueOf(path) + File.separator + image.getOriginalFilename());
                final int height = 575;
                final int width = 915;
                final ByteArrayInputStream in = new ByteArrayInputStream(bytes);
                try {
                    final BufferedImage img = ImageIO.read(in);
                    final int original_width = img.getWidth();
                    final int original_height = img.getHeight();
                    int bound_width = 915;
                    int bound_height = 575;
                    final int new_width = original_width;
                    final int new_height = original_height;
                    if (original_height / bound_height > original_width / bound_width) {
                        bound_width = bound_height * original_width / original_height;
                    }
                    else {
                        bound_height = bound_width * original_height / original_width;
                    }
                    final Image scaledImage = img.getScaledInstance(bound_width, bound_height, 4);
                    final BufferedImage imageBuff = new BufferedImage(width, height, 1);
                    final Graphics2D drawer = imageBuff.createGraphics();
                    drawer.setBackground(Color.WHITE);
                    drawer.clearRect(0, 0, width, height);
                    imageBuff.getGraphics().drawImage(scaledImage, (width - bound_width) / 2, (height - bound_height) / 2, new Color(0, 0, 0), null);
                    final ByteArrayOutputStream buffer = new ByteArrayOutputStream();
                    ImageIO.write(imageBuff, "jpg", buffer);
                    bytes = buffer.toByteArray();
                }
                catch (IOException ex) {}
                System.out.println("*********************Path" + path);
                final BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(uploadfile));
                bufferedOutputStream.write(bytes);
                bufferedOutputStream.close();
                image2 = String.valueOf(request.getScheme()) + "://" + request.getServerName() + ":" + request.getServerPort() + "/resources/admin/images/photoalbum/" + image.getOriginalFilename();
                final String t = imagetitle.toString().replace("$", "&");
                final String t2 = t.replace("~", "#");
                final String t3 = t2.replace("!", "%");
                System.out.println(String.valueOf(t3) + "=================================title");
                gaim = new GalleryImage();
                gaim.setImageTitle(t3);
                gaim.setDescription(imagedescription.toString());
                gaim.setImage(image2);
                gaim.setAlbumId(albumid);
                gaim.setCreatedBy(id);
                gaim.setIpAddress(IpAddress);
                result = galleryDao.addAlbumImage(gaim);
                }else 
                {System.out.println(videoId);
                final String t = imagetitle.toString().replace("$", "&");
                final String t2 = t.replace("~", "#");
                final String t3 = t2.replace("!", "%");
                System.out.println(String.valueOf(t3) + "=================================title");
                final String vid = videoId.toString().replace("$", "&");
                final String vid2 = vid.replace("~", "#");
                final String vid3 = vid2.replace("!", "%");
                System.out.println(String.valueOf(t3) + "=================================vid id");
                image2 = null;
                gaim = new GalleryImage();
                gaim.setImageTitle(t3);
                gaim.setVidId(vid3);
                gaim.setDescription(imagedescription.toString());
                gaim.setImage(image2);
                gaim.setAlbumId(albumid);
                gaim.setCreatedBy(id);
                gaim.setIpAddress(IpAddress);
                result = galleryDao.addAlbumImage(gaim);
        }
            }
            catch (Exception e) {
                e.printStackTrace();
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    @RequestMapping(value = "deleteAlbum", method = RequestMethod.DELETE)
    public void delete(final int albumid) {
        logger.info("***** DELETE ALBUM *****");
        galleryDao.deleteAlbum(albumid);
    }
}



