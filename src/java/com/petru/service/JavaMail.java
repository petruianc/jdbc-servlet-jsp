/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petru.service;

import com.petru.dao.LoginDao;
import javax.mail.PasswordAuthentication;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Petru
 */
public class JavaMail {
    public static boolean sendMail(String mail) throws MessagingException{
        System.out.println("prepareing to send email");
        boolean sent = false;
        final String username = "ptru_nc@yahoo.com";
        final String password = "wblokckezktqrdll";
        String fromMail = "ptru_nc@yahoo.com";
        String toMail=mail;
        
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.mail.yahoo.com");
        properties.put("mail.smtp.port", "587");
        
        Session session;
        session = Session.getInstance(properties, new Authenticator() {
           
            @Override
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(username, password);
            }
         });
        
        Message message = prepareMessage(session, username, toMail);
        Transport.send(message);
        sent = true;
        System.out.println("message send succesfully!!!");
        return sent;
    }
    
    public static Message prepareMessage(Session session, String username, String toMail){
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
            message.setSubject("Password from DB to JAva to you");
            message.setText(new LoginDao().getUserPasswordByEmail(toMail));
            return message;
        } catch (AddressException ex) {
            Logger.getLogger(JavaMail.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(JavaMail.class.getName()).log(Level.SEVERE, null, ex);
        }
            return null;
    }

}
