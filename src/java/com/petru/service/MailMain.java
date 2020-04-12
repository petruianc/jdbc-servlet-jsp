/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petru.service;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Petru
 */
public class MailMain {
    public static void main(String... args) throws MessagingException{
//        final String username = "ptru_nc@yahoo.com";
//        final String password = "wblokckezktqrdll";
//        String fromMail = "ptru_nc@yahoo.com";
//        String toMail="petruianc1503@gmail.com";
//        
//        Properties properties = new Properties();
//        properties.put("mail.smtp.auth", "true");
//        properties.put("mail.smtp.starttls.enable", "true");
//        properties.put("mail.smtp.host", "smtp.mail.yahoo.com");
//        properties.put("mail.smtp.port", "587");
//        
//        Session session = Session.getInstance(properties, new Authenticator() {
//                @Override
//                protected PasswordAuthentication getPasswordAuthentication(){
//                    return new PasswordAuthentication(username, password);
//                }
//        
//        });
//        // start your email message
//        MimeMessage msg = new MimeMessage(session);
//        msg.setFrom(new InternetAddress(fromMail));
//        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
//        msg.setSubject("mail de la java");
//        msg.setText("body de la email");
//        Transport.send(msg);
        JavaMail.sendMail("petruianc1503@gmail.com");
    }
}
