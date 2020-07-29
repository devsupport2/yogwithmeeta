package com.ui.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ui.dao.PaymentDAO;
import com.ui.dao.UserDAO;
import com.ui.model.Order;
import com.ui.model.User;

@RestController
public class EmailController {
    @Autowired
    UserDAO userdao;
    @Autowired
    PaymentDAO paymentdao;

    User user;

    private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
    
    final String username = "relaymessages@astartechnologies.net";
    final String password = "ASTar@2010";

    public String sendForgotPassLink(String email) {
      logger.info("***** SEND FORGOT PASSWORD LINK ****");

      String result = null;

      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.host", "mail.astartechnologies.net");
      props.put("mail.smtp.port", "587");
      props.put("mail.smtp.starttls.enable", "true");
      javax.mail.Session session1 = javax.mail.Session.getInstance(props, new javax.mail.Authenticator() {
          protected PasswordAuthentication getPasswordAuthentication() {
              return new PasswordAuthentication(username, password);
          }
      });
      
      user = userdao.getUserByEmail(email);

      try {
          InternetAddress[] myBccList = InternetAddress.parse("webmaster@ultrainfotech.net");
          Message message = new MimeMessage(session1);
          message.setFrom(new InternetAddress(username, "Yog With Meeta"));
          message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
          message.setRecipients(Message.RecipientType.BCC, myBccList);
          message.setSubject("Password recovery link form Yog With Meeta");
          StringBuilder sb = new StringBuilder();
          sb.append("<div style='width:100%;background-color:#ffffff;margin:0;padding:0;font-family:'Open Sans',sans-serif'><table align='center' border='0' cellpadding='0' cellspacing='0' style='border-collapse:collapse;width:100%;min-width:100%;height:auto' width='100%'><tbody>"
                + "<tr><td bgcolor='#FFFFFF' style='padding-top:20px' valign='top' width='100%'><table align='center' bgcolor='#FFFFFF' border='0' cellpadding='0' cellspacing='0' style='border-collapse:collapse;margin:0 auto' width='580'><tbody>"
                + "<tr><td align='center' bgcolor='#FFFFFF' style='padding:0' valign='top'><a data-saferedirecturl='#' href='#' target='_blank'><img alt='' border='0' class='CToWUd' src='http://yogwithmeeta.com/resources/admin/images/logo-email.jpg' style='display:block'></a></td></tr><tr>"
                + "<td bgcolor='#FFFFFF' style='font-size:13px;color:#282828;font-weight:normal;text-align:left;font-family:'Open Sans',sans-serif;line-height:24px;vertical-align:top;padding:15px 8px 10px 8px'><h1 style='text-align:center;font-weight:600;margin:30px 0 50px 0'>PASSWORD RESET REQUEST</h1>"
                + "<p>Dear "+ user.getFirstName() + " " + user.getLastName()+",</p><p>We have received your request to reset your password. Please click the link below to complete the reset:</p></td></tr><tr><td style='padding-bottom:30px;' align='center'>"
                + "<a data-saferedirecturl='http://yogwithmeeta.com/forgotpassword?email="+user.getEmail()+"' href='http://yogwithmeeta.com/forgotpassword?email="+user.getEmail()+"' style='padding:10px;width:300px;display:block;text-decoration:none;border:1px solid #ff6c37;text-align:center;font-weight:bold;font-size:14px;font-family:'Open Sans',sans-serif;color:#ffffff;background-color:#FE7E07;border-radius:5px;line-height:17px;margin:0 auto' target='_blank'>Reset My Password</a></td></tr>"
                + "<tr><td style='font-family:'Open Sans',sans-serif;font-size:13px;padding:0px 10px 0px 10px;text-align:left'><p>If you need additional assistance, or you did not make this change, please contact <a href='mailto:webmaster@ultrainfotech.net' style='color:#ff6c37;text-decoration:underline;font-weight:bold' target='_blank'>webmaster@ultrainfotech.net</a>.</p>"
                + "<p>Regards,<br>Yog With Meeta</p></td></tr></tbody></table></td></tr></tbody></table>"
                +"<div style='height:15px;margin:0 auto'></div><table align='center' border='0' cellpadding='0' cellspacing='0' style='border-collapse:collapse;margin:0 auto' width='580'><tbody><tr><td bgcolor='#FFFFFF' style='font-family:'Open Sans',sans-serif;line-height:150%;padding-top:10px;padding-left:10px;padding-right:18px;padding-bottom:30px;text-align:left;border-bottom:0;font-size:10px;border-top:0'><table align='left' border='0' cellpadding='0' cellspacing='0' style='border-collapse:collapse' width='100%'><tbody><tr><td style='text-align:center;font-size:11px;color:#282828;font-family:'Open Sans',sans-serif;padding:20px 0;padding-left:0px' valign='top'>© 2020 Yog With Meeta., All Rights Reserved<br><br></td></tr></tbody></table></td></tr></tbody></table></div>");
          /*sb.append(
                  "<table style='border:solid 1px #bcc2cf; font-family: Arial,Helvetica,sans-serif;' align='center' width='750' cellspacing='0' cellpadding='0' border='0'>"
                          + "<tbody>"
                          + "<tr><td style='padding:15px 0px;  font-size: 16px;  color: #373737; background-color: #f7f7f7;' align='center' valign='middle'><a href='http://yogwithmeeta.com/'> "
                          + "<img border='0' src='http://yogwithmeeta.com/resources/front/assets/images/logo.png'/></a></td></tr>"
                          + "<tr><td style='font-family:Arial,Helvetica,sans-serif;font-size:12px; color:#373737; background-color:#fff; padding:20px;' align='left' valign='top'><p> Dear "
                          + user.getFirstName() + " " + user.getLastName() + ",</p>" + "Please verify your account for updating your password, by clicking on below link<br> "
                          + " <a href='http://yogwithmeeta.com/forgotpassword?email="+user.getEmail()+"'>Click here...</a><br><br>"
                          + "With warm regards and best of wishes,<br>" + "<strong> Yog With Meeta"
                          + "</strong><br></td></tr></tbody></table></td></tr></tbody>"
                          + "</table></td></tr></tbody></table>");*/

          message.setContent(sb.toString(), "text/html");
          Transport.send(message);
          System.out.println("E-Mail send suceessfully");
          result = "Success";
      } catch (Exception msg) {
          result = "Fail";
          System.out.println("Error occurs in sennding mail " + msg);
      }

      return result;
  }
    
    
    
    
    @PostMapping(value = "sendOrderConfirmationMail")
    public String sendOrderConfirmationMail(String ordernumber, HttpSession session, HttpServletRequest request,
            HttpServletResponse res) {

        logger.info("***** SEND ORDER CONFIRMATION EMAIL *****");

        String result = null;
        int id = Integer.parseInt(session.getAttribute("memberid").toString());
                       
        Order od = paymentdao.getOrderDetailByOrderNumber(ordernumber);
        
        User u = userdao.getMemberDetailByMemberId(id);
       
        final String username = "relaymessages@astartechnologies.net";
        final String password = "ASTar@2010";
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "mail.ultrainfotech.net");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.starttls.enable", "true");
        
        javax.mail.Session session1 = javax.mail.Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        
        System.out.println("demo----"+u.getEmail());
        
        try {
            InternetAddress[] myBccList = InternetAddress.parse("relaymessages@astartechnologies.net");
            Message message = new MimeMessage(session1);
            message.setFrom(new InternetAddress(username, "YWM"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(u.getEmail()));
            message.setRecipients(Message.RecipientType.BCC, myBccList);
            message.setSubject("Payment Confirmation- YWM");
            StringBuilder sb = new StringBuilder();
            sb.append(
                    "<table style='border:solid 1px #bcc2cf; font-family: Arial,Helvetica,sans-serif;' align='center' width='750' cellspacing='0' cellpadding='0' border='0'>"
                            + "<tbody>"
                            + "<tr><td style='padding:15px 0px;  font-size: 16px;  color: #373737; background-color: #f7f7f7;' align='center' valign='middle'><a href='http://yogwithmeeta.com'> "
                            + "<img border='0' src='http://yogwithmeeta.com/resources/front/assets/images/logo.png'/></a></td></tr>"
                            + "<tr><td style='font-family:Arial,Helvetica,sans-serif;font-size:12px; color:#373737; background-color:#fff; padding:20px;' align='left' valign='top'><p> Dear "
                            + u.getFirstName() + " " + u.getLastName() + ",</p>" + "Your payment of Rs. "
                            + od.getAmountPaid() + " transaction is successful.<br><br>"
                            + "With warm regards and best of wishes,<br>" + "<strong> Yog With Meeta"
                            + "</strong><br></td></tr></tbody></table></td></tr></tbody>"
                            + "</table></td></tr></tbody></table>");

            message.setContent(sb.toString(), "text/html");
            Transport.send(message);
            System.out.println("E-Mail Send Suceessfully For Delivery...Using JSP.........");
            result = "Success";
        } catch (Exception msg) {
            result = "Fail";
            System.out.println("Not send mail " + msg);
        }

        return result;
    }

    @PostMapping(value = "sendOrderConfirmationSMS")
    public String sendOrderConfirmationSMS(String ordernumber, HttpSession session, HttpServletRequest request,
            HttpServletResponse res) {

        logger.info("***** SEND ORDER CONFIRMATION SMS *****");

        String result = null;

        int id = Integer.parseInt(session.getAttribute("memberid").toString());

        Order od = paymentdao.getOrderDetailByOrderNumber(ordernumber);
        
        User u = userdao.getMemberDetailByMemberId(id);

        System.out.println("User Mobile Number-------------------------->" + u.getMobileNo());

        try {
            String url = "http://sms.astartechnologies.net/sendsms.aspx";
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
            String urlParameters = "mobile=9624024813&pass=EGIQT&senderid=ASTECH&to=" + u.getMobileNo()
                    + "&msg= Dear " + u.getFirstName() + " " + u.getLastName() + ", your payment of Rs. "
                    + od.getAmountPaid() + "  has been successful.";

            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(urlParameters);
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();
            if (responseCode == 200) {
                con.connect();
                BufferedReader rd = new BufferedReader(new InputStreamReader(con.getInputStream()));
                StringBuffer buffer = new StringBuffer();
                String line;
                while ((line = rd.readLine()) != null) {
                    buffer.append(line).append("n");
                }
                System.out.println(buffer.toString());
                rd.close();
                con.disconnect();
                System.out.println("responseCode ->" + responseCode + " --- " + con.getContent().toString());

                result = "Success";
            } else {
                result = "Fail";
                System.out.println("http response code error: " + responseCode + "\n");
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = "Fail";
        }

        return result;
    }
    
    
    
}//end
