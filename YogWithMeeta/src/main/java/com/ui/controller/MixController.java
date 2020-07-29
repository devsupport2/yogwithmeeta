package com.ui.controller;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Hashtable;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ui.dao.MixDAO;
import com.ui.dao.impl.CourseDAOImpl;
import com.ui.model.AllCount;

@RestController
public class MixController {

  @Autowired
  MixDAO dao;
  
  private static final Logger logger = LoggerFactory.getLogger(MixController.class);
  
  @GetMapping(value = "/getAllCounts")
  public AllCount getAllCounts(HttpServletRequest request, HttpSession session) {
      logger.info("***** GET ALL COUNTS *****");
      return dao.getAllCounts();
  }
  
  
  public String uploadImage(MultipartFile file, String folderName, HttpServletRequest request) {
    logger.info("****** uploadImage *******");
    String imagePath = null;

    try {
        byte[] bytes = file.getBytes();
        File dir = new File(request.getSession().getServletContext().getRealPath("") + "/resources/admin/images/"
                + File.separator + folderName);
        if (!dir.exists())
            dir.mkdirs();
        String path = request.getSession().getServletContext()
                .getRealPath("/resources/admin/images/" + folderName + "/");
        File uploadfile = new File(path + File.separator + file.getOriginalFilename());
        int height = 1280, width = 904;
        ByteArrayInputStream in = new ByteArrayInputStream(bytes);
        try {
            BufferedImage img = ImageIO.read(in);
            int original_width = img.getWidth();
            int original_height = img.getHeight();
            int bound_width = 904;
            int bound_height = 1280;
            if (original_height / bound_height > original_width / bound_width) {
                bound_width = (int) (bound_height * original_width / original_height);
            } else {
                bound_height = (int) (bound_width * original_height / original_width);
            }
            Image scaledImage = img.getScaledInstance(bound_width, bound_height, Image.SCALE_SMOOTH);
            BufferedImage imageBuff = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            Graphics2D drawer = imageBuff.createGraphics();
            drawer.setBackground(Color.WHITE);
            drawer.clearRect(0, 0, width, height);
            imageBuff.getGraphics().drawImage(scaledImage, (width - bound_width) / 2, (height - bound_height) / 2,
                    new Color(0, 0, 0), null);
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            ImageIO.write(imageBuff, "jpg", buffer);
            bytes = buffer.toByteArray();
        } catch (IOException e) {
            System.out.println("ERROR OCCURED == "+e);
        }
        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(uploadfile));
        bufferedOutputStream.write(bytes);
        bufferedOutputStream.close();
        imagePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + "/resources/admin/images/" + folderName + "/" + file.getOriginalFilename();
    } catch (Exception e) {
        imagePath = null;
    }

    return imagePath;

}
  
  
  
  public String uploadProfileImage(MultipartFile file, String folderName, HttpServletRequest request) {
    logger.info("****** uploadImage *******");
    String imagePath = null;

    try {
        byte[] bytes = file.getBytes();
        File dir = new File(request.getSession().getServletContext().getRealPath("") + "/resources/admin/images/"
                + File.separator + folderName);
        if (!dir.exists())
            dir.mkdirs();
        String path = request.getSession().getServletContext()
                .getRealPath("/resources/admin/images/" + folderName + "/");
        File uploadfile = new File(path + File.separator + file.getOriginalFilename());
        int height = 480, width = 700;
        ByteArrayInputStream in = new ByteArrayInputStream(bytes);
        try {
            BufferedImage img = ImageIO.read(in);
            int original_width = img.getWidth();
            int original_height = img.getHeight();
            int bound_width = 700;
            int bound_height = 480;
            if (original_height / bound_height > original_width / bound_width) {
                bound_width = (int) (bound_height * original_width / original_height);
            } else {
                bound_height = (int) (bound_width * original_height / original_width);
            }
            Image scaledImage = img.getScaledInstance(bound_width, bound_height, Image.SCALE_SMOOTH);
            BufferedImage imageBuff = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            Graphics2D drawer = imageBuff.createGraphics();
            drawer.setBackground(Color.WHITE);
            drawer.clearRect(0, 0, width, height);
            imageBuff.getGraphics().drawImage(scaledImage, (width - bound_width) / 2, (height - bound_height) / 2,
                    new Color(0, 0, 0), null);
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            ImageIO.write(imageBuff, "jpg", buffer);
            bytes = buffer.toByteArray();
        } catch (IOException e) {
            System.out.println("ERROR OCCURED == "+e);
        }
        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(uploadfile));
        bufferedOutputStream.write(bytes);
        bufferedOutputStream.close();
        imagePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + "/resources/admin/images/" + folderName + "/" + file.getOriginalFilename();
    } catch (Exception e) {
        imagePath = null;
    }

    return imagePath;

}
  
}
