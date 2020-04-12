/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petru.dao;

import com.petru.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Petru
 */
public class LoginDao {
     
    public User getUserById(int id){
        String sql = "select * from users where id = ?";
        User user = null;
        try(Connection conn = DbConnection.getInstance().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql))
            {
                stmt.setInt(1, id);
                ResultSet rs = stmt.executeQuery();
                while(rs.next()){
                    user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(4));
                }
            return user;
            }catch(Exception e){
                e.printStackTrace();
            }
        return user;
    }
    
    public List<User> getUsers(){
		String sql = "select * from users order by last_name";
		List<User> users = null;
		try(Connection conn = DbConnection.getInstance().getConnection();
                     Statement stmt = conn.createStatement();
                     ResultSet rs = stmt.executeQuery(sql))
		{
			users = new ArrayList<>();
			while(rs.next()) {
				User user = convertUserToRow(rs);
				users.add(user);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
			return users;
    }
    
    public User convertUserToRow(ResultSet rs) throws Exception{
		
                int id = rs.getInt("id");
		String lastName = rs.getString("last_name");
		String firstName = rs.getString("first_name");
		String email = rs.getString("email");
		String password = rs.getString("password");
		
		User user = new User(id, lastName, firstName, email, password);
		return user;
    }
    
   public boolean getUserByPasswordLastNameEmail(String lastName, String email, String pass){
        String sql = "select * from users where password = ? and last_name = ? and email = ?";
        boolean ok = false;
        try(Connection conn = DbConnection.getInstance().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql))
        {
            stmt.setString(1, pass);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                ok = true;
            }
                return ok;
        }catch(Exception e){
            e.printStackTrace();
        }
                return ok;
    }
   
   public String getUserPasswordByEmail(String email){
       String password = null;
       String sql = "Select password from users where email=?";
       try(Connection conn = DbConnection.getInstance().getConnection();
           PreparedStatement stmt = conn.prepareStatement(sql))
       {
          stmt.setString(1, email);
          ResultSet rs = stmt.executeQuery();
          while(rs.next()){
              password = rs.getString("password");
          }
                  
       }catch(Exception e){
           e.printStackTrace();
       }
       return password;
   }
    
    public static void main(String... args){
        System.out.println(new LoginDao().getUserByPasswordLastNameEmail("Ianc", "petruianc1503@gmail.com", "1234"));
        System.out.println(new LoginDao().getUserPasswordByEmail("ptru_nc@yahoo.com"));
    }
}
