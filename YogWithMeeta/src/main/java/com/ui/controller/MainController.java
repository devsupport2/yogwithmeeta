package com.ui.controller;

import java.util.Locale;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ui.dao.GalleryDAO;



@Controller
public class MainController {
  
  @Autowired
  GalleryDAO galleryDao;

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);	

	@GetMapping(value = "/")
	public String login(Locale locale, Model model, HttpSession session) {
		logger.info("LOGIN PAGE");
		
		return "index";
	}
	
	@GetMapping(value = "/course-details")
    public String courseDetails(Locale locale, Model model, HttpSession session) {
        logger.info("COURSE DETAILS");
        
        return "course-details";
    }
	
	@GetMapping(value = "/courses")
    public String courses(Locale locale, Model model, HttpSession session) {
        logger.info("COURSES");
        
        return "courses";
    }
	
	@GetMapping(value = "/order_confirmation")
    public String orderConfirmation(Locale locale, Model model, HttpSession session) {
        logger.info("ORDER CONFIRMATION");
        
        return "order_confirmation";
    }
	
	@GetMapping(value = "/contact-us")
    public String contactUs(Locale locale, Model model, HttpSession session) {
        logger.info("CONTACT US");
        
        return "contact-us";
    }
	
	@GetMapping(value = "/corporate-yoga")
    public String corporateYoga(Locale locale, Model model, HttpSession session) {
        logger.info("CORPORATE YOGA");
        
        return "corporate-yoga";
    }
	
	@GetMapping(value = "/lifestyle-counselling")
    public String lifestyleCounselling(Locale locale, Model model, HttpSession session) {
        logger.info("lifestyle counselling");
        
        return "lifestyle-counselling";
    }
	
	@GetMapping(value = "/meditation")
    public String meditation(Locale locale, Model model, HttpSession session) {
        logger.info("MEDITATION");
        
        return "meditation";
    }
	
	@GetMapping(value = "/privacy-policy")
    public String privacyPolicy(Locale locale, Model model, HttpSession session) {
        logger.info("PRIVACY POLICY");
        
        return "privacy-policy";
    }
	
	@GetMapping(value = "/sound-healing")
    public String soundHealing(Locale locale, Model model, HttpSession session) {
        logger.info("SOUND HEALING");
        
        return "sound-healing";
    }
	
	@GetMapping(value = "/stress-and-anger-management")
    public String StressAndAngerManagement(Locale locale, Model model, HttpSession session) {
        logger.info("STRESS AND ANGER MANAGEMENT");
        
        return "stress-and-anger-management";
    }
	
	@GetMapping(value = "/termsAndconditions")
    public String termsAndConditions(Locale locale, Model model, HttpSession session) {
        logger.info("TERMS AND CONDITIONS");
        
        return "termsAndconditions";
    }
	
	@GetMapping(value = "/weight-management")
    public String weightManagement(Locale locale, Model model, HttpSession session) {
        logger.info("WEIGHT MANAGEMENT");
        
        return "weight-management";
    }
	
	@GetMapping(value = "/what-we-do")
    public String WhatWeDo(Locale locale, Model model, HttpSession session) {
        logger.info("WHAT WE DO");
        
        return "what-we-do";
    }
	
	@GetMapping(value = "/yog-nindra")
    public String yogNindra(Locale locale, Model model, HttpSession session) {
        logger.info("CONTACT US");
        
        return "yog-nindra";
    }
	
	@GetMapping(value = "/yoga-therapy")
    public String yogaTherapy(Locale locale, Model model, HttpSession session) {
        logger.info("YOGA THERAPY");
        
        return "yoga-therapy";
    }
	
	@GetMapping(value = "/testimonials")
    public String testimonials(Locale locale, Model model, HttpSession session) {
        logger.info("TESTIMONIALS");
        
        return "testimonials";
    }
	
	@GetMapping(value = "/gallery")
    public String gallery(Locale locale, Model model, HttpSession session) {
        logger.info("GALLERY");
        model.addAttribute("album", galleryDao.getAllAlbum());
        model.addAttribute("albumOneImage", galleryDao.getAlbumOneImage());
        model.addAttribute("albumImages", galleryDao.getAllAlbumImages());
        
        return "gallery";
    }
	
	@GetMapping(value = "/forgotpassword")
    public String forgotpassword(Locale locale, Model model, HttpSession session) {
        logger.info("FORGOTPASSWORD");
        
        return "forgotpassword";
    }
	
	@GetMapping(value = "/about-meeta-shah")
    public String aboutMeetaShah(Locale locale, Model model, HttpSession session) {
        logger.info("about meeta shah");
        
        return "about-meeta-shah";
    }
	
	@GetMapping(value = "/register")
    public String register(Locale locale, Model model, HttpSession session) {
        logger.info("REGISTER");
        if (session.getAttribute("userid") == null || Integer.parseInt(session.getAttribute("userid").toString()) == 0) {
          return "register";
      }
      return "index";
    }
	
	@GetMapping(value = "/confirm-registration")
    public String confirmRegistration(Locale locale, Model model, HttpSession session) {
        logger.info("CONFIRM REGISTER");
        if (session.getAttribute("userid") == null || Integer.parseInt(session.getAttribute("userid").toString()) == 0) {
          return "index";
      }
      return "confirm-registration";
    }
	
	@GetMapping(value = "/myProfile")
    public String myProfile(Locale locale, Model model, HttpSession session) {
        logger.info("User Profile");
        if (session.getAttribute("userid") == null || Integer.parseInt(session.getAttribute("userid").toString()) == 0) {
          return "index";
      }
      return "myProfile";
    }
	
	@GetMapping(value = "/myTransactions")
    public String myTransactions(Locale locale, Model model, HttpSession session) {
        logger.info("MY TRANSACTIONS");
        if (session.getAttribute("userid") == null || Integer.parseInt(session.getAttribute("userid").toString()) == 0) {
          return "index";
      }
      return "myTransactions";
    }
	
	@GetMapping(value = "/login")
    public String frontLogin(Locale locale, Model model, HttpSession session) {
        logger.info("FRONT LOGIN");
        if (session.getAttribute("userid") == null || Integer.parseInt(session.getAttribute("userid").toString()) == 0) {
          return "login";
      }
      return "index";
    }
	
	@GetMapping(value = "/logout")
    public String frontLogout(Locale locale, Model model, HttpSession session) {
        logger.info("FRONT Logout");
      try {
        if (session.getAttribute("userid") != null || Integer.parseInt(session.getAttribute("userid").toString()) != 0) {
            session.setAttribute("userid", null);
            session.setAttribute("username", null);
            session.setAttribute("usertypeid", null);
            session.setAttribute("emailid", null);
            session.setAttribute("mobileno", null);
            session.setAttribute("loginby", null);
            return "index";
        }
    } catch (Exception e) {
        return "index";
    }
    return "index";
    }
	
	@RequestMapping(value = "dataform")
    public String datafrom(Locale locale, Model model, HttpSession session) {
        logger.info("##### DATA FORM #####");

        return "dataform";
    }

    @RequestMapping(value = "/ccavRequestHandler", method = { RequestMethod.GET, RequestMethod.POST })
    public String ccavRequestHandler(Model model) {
        logger.info("##### CCAV REQUEST HANDLER #####");
        return "ccavRequestHandler";
    }

    @RequestMapping(value = "/ccavResponseHandler", method = { RequestMethod.GET, RequestMethod.POST })
    public String ccavResponseHandler(Model model) {
        logger.info("##### CCAV RESPONSE HANDLER #####");
        return "ccavResponseHandler";
    }

	
	@GetMapping(value = "/ManageYWM")
    public String Adminlogin(Locale locale, Model model, HttpSession session) {
        logger.info("Admin LOGIN PAGE");
        if (session.getAttribute("adminuserid") == null || Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
          return "Admin/index";
      }
      return "Admin/dashboard";
    }
	
	@RequestMapping(value = "/ManageYWM/logoutadmin", method = RequestMethod.GET)
    public String logoutadmin(Locale locale, Model model, HttpSession session) {
        logger.info("##### ADMIN LOGOUT #####");
        try {
            if (session.getAttribute("adminuserid") != null || Integer.parseInt(session.getAttribute("adminuserid").toString()) != 0) {
                session.setAttribute("adminuserid", null);
                session.setAttribute("adminusername", null);
                session.setAttribute("adminusertypeid", null);
                session.setAttribute("adminemailid", null);
                session.setAttribute("adminmobileno", null);
                return "Admin/index";
            }
        } catch (Exception e) {
            return "Admin/index";
        }
        return "Admin/index";
     }
	
	@GetMapping(value = "/ManageYWM/dashboard")
    public String admindashboard(Locale locale, Model model, HttpSession session) {
        logger.info("Admin Dashboard");
        if (session.getAttribute("adminuserid") == null
              || Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
          return "Admin/index";
      }
        return "Admin/dashboard";
    }
	
	@GetMapping(value = "/ManageYWM/manage_user")
    public String manageuser(Locale locale, Model model, HttpSession session) {
        logger.info("Admin MANAGE USER");
        if (session.getAttribute("adminuserid") == null
              || Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
          return "Admin/index";
      }
        return "Admin/manage_user";
    }
	
	@GetMapping(value = "/ManageYWM/add-batch")
    public String adminaddbatch(Locale locale, Model model, HttpSession session) {
        logger.info("Admin add batch");
        if (session.getAttribute("adminuserid") == null
              || Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
          return "Admin/index";
      }
        return "Admin/add-batch";
    }
	
	@GetMapping(value = "/ManageYWM/add-schedule")
    public String adminaddschedule(Locale locale, Model model, HttpSession session) {
        logger.info("Admin add batch");
        if (session.getAttribute("adminuserid") == null
              || Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
          return "Admin/index";
      }
        return "Admin/add-schedule";
    }
	
	@GetMapping(value = "/ManageYWM/add-course")
    public String adminaddcourse(Locale locale, Model model, HttpSession session) {
        logger.info("Admin add course");
        if (session.getAttribute("adminuserid") == null
              || Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
          return "Admin/index";
      }
        return "Admin/add-course";
    }
	
	@GetMapping(value = "/ManageYWM/users-profile")
    public String adminuserprofile(Locale locale, Model model, HttpSession session) {
        logger.info("Admin user profile");
        if (session.getAttribute("adminuserid") == null
              || Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
          return "Admin/index";
      }
        return "Admin/users-profile";
    }
	
	@GetMapping(value = "/ManageYWM/transactions")
    public String transactions(Locale locale, Model model, HttpSession session) {
        logger.info("transactions");
        if (session.getAttribute("adminuserid") == null
              || Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
          return "Admin/index";
      }
        return "Admin/transactions";
    }
	
	@GetMapping(value = "/ManageYWM/manage_Album")
    public String adminManageAlbum(Locale locale, Model model, HttpSession session) {
        logger.info("Admin Manage Album");
        if (session.getAttribute("adminuserid") == null
              || Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
          return "Admin/index";
      }
        return "Admin/manage_Album";
    }
	
	
	@GetMapping(value = "/ManageYWM/participants_list")
    public String adminParticipantsList(Locale locale, Model model, HttpSession session) {
        logger.info("Admin Manage Album");
        if (session.getAttribute("adminuserid") == null
              || Integer.parseInt(session.getAttribute("adminuserid").toString()) == 0) {
          return "Admin/index";
      }
        return "Admin/participants_list";
    }
	
	
}
