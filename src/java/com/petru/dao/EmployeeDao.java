/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petru.dao;

import com.petru.model.Employee;
import com.petru.model.User;
import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Petru
 */
public class EmployeeDao {
    
    
    
    
    
    
    public Employee convertEmployeeToRow(ResultSet rs) throws Exception{
		
                int id = rs.getInt("id");
		String firstName = rs.getString("first_name");
		String lastName = rs.getString("last_name");
		String email = rs.getString("email");
		String department = rs.getString("department");
		BigDecimal salary = rs.getBigDecimal("salary");
		
		Employee emp = new Employee(id, lastName, firstName, email, department, salary);
		return emp;
		
	}
	
    public List<Employee> getEmployees(){
		String sql = "select id, first_name, last_name, email, department, salary from employees";
		List<Employee> employees = null;
		
		try(Connection conn = DbConnection.getInstance().getConnection();
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql))
		{
			employees = new ArrayList<>();
			while(rs.next()) {
				Employee emp = convertEmployeeToRow(rs);
				employees.add(emp);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
			return employees;
		
    }
    
   
    
    
    
    
    public List<Employee> searchEmployees(String lastName){
		List<Employee> emp = new ArrayList<>();
		
		lastName += "%";
		String sql = "select id, first_name, last_name, email, department, salary from Employees where last_name like ?";
		try(Connection conn = DbConnection.getInstance().getConnection();
                    PreparedStatement stmt = conn.prepareStatement(sql))
		{
			stmt.setString(1, lastName);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Employee e = convertEmployeeToRow(rs);
				emp.add(e);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return emp;
    }
    
    public boolean addEmployee(Employee emp, int userId) {
		String sql = "insert into employees(first_name, last_name, email, department, salary) values(?,?,?,?,?)";
		boolean add = false;
		try(Connection conn = DbConnection.getInstance().getConnection();
                    PreparedStatement stmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS))
		{
			int id = 0;
                        stmt.setString(1, emp.getFirstName());
			stmt.setString(2, emp.getLastName());
			stmt.setString(3, emp.getEmail());
			stmt.setString(4, emp.getDepartment());
			stmt.setBigDecimal(5, emp.getSalary());
			
			int row = stmt.executeUpdate();
			if(row>0) {
				add = true;
			}
			// get the generated key
			try(ResultSet rs = stmt.getGeneratedKeys()){
				while(rs.next()) {
                                    id = rs.getInt(1);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			// insert into audit history
			String insert = "insert into audit_history(user_id, employee_id, action, action_date_time) values(?,?,?,?)";
			try(PreparedStatement pStmt = conn.prepareStatement(insert))
			{
				pStmt.setInt(1, userId);
				pStmt.setInt(2, id);
				pStmt.setString(3, "Employee added!");
				pStmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
				
				pStmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
			return add;
    }
    
    public List<Employee> getEmployeeByDepartment(String dep){
        List<Employee> employees = new ArrayList<>();
        Employee emp = null;
        try(Connection conn = DbConnection.getInstance().getConnection();
            CallableStatement call = conn.prepareCall("{call get_employees_for_department(?)}"))
        {
            call.setString(1, dep);
            call.execute();
            try(ResultSet rs = call.getResultSet())
            {
                while(rs.next()){
                  emp = convertEmployeeToRow(rs);
                  employees.add(emp);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return employees;
    }
    
    public Employee getEmployeeById(int id){
        
        Employee emp = null;
        String sql = "{call get_employees_by_id(?)}";
        
        try(Connection conn = DbConnection.getInstance().getConnection();
            CallableStatement call = conn.prepareCall(sql))
        {
            call.setInt(1, id);
            call.execute();
            
            try(ResultSet rs = call.getResultSet())
            {
                while(rs.next()) emp = convertEmployeeToRow(rs);
            }
            
            return emp;
        }catch(Exception e){
            e.printStackTrace();
        }
        return emp;
    }
    
    public boolean increaseSalaryByDepartment(String dep, double percent, int userId){
        boolean increased = false;
        List<Employee> employees = null;
        
        try(Connection conn = DbConnection.getInstance().getConnection();
            CallableStatement call = conn.prepareCall("{call increase_salaries_for_department(?,?)}"))
        {
            call.setString(1, dep);
            call.setDouble(2, percent);
            int row = call.executeUpdate();
            System.out.println(increased);
            if(row>1){ 
                increased = true;
                employees = getEmployeeByDepartment(dep);
            }
            System.out.println("List of emp: "+employees);
            String newSql = "insert into audit_history(user_id, employee_id, action, action_date_time) values(?,?,?,?)";
            String status = null;
            if(percent>=0) status = "Salary Increased by department!!!";
            else status = "Salary Decreassed by department!";
           
                try(Connection newConn = DbConnection.getInstance().getConnection();
                    PreparedStatement stmt = newConn.prepareStatement(newSql))
                {
                    for(Employee e : employees)
                    {
                        stmt.setInt(1, userId);
                        stmt.setInt(2, e.getId());
                        stmt.setString(3, status);
                        stmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
                        stmt.executeUpdate();
                    }
                }catch(Exception e){
                    e.printStackTrace();
                }
                return increased;
        }catch(Exception e){
            e.printStackTrace();
        }
        
                return increased;
    }
    
    public boolean increaseSalaryByEmployee(int empId, double percent, int userId){
        
        boolean increased = false;
        String sql = "update employees set salary = salary + salary*? where id = ?";
        
        try(Connection conn = DbConnection.getInstance().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql))
        {
            stmt.setDouble(1, percent);
            stmt.setInt(2, empId);
            int row = stmt.executeUpdate();
            if(row > 0){
                 increased = true;
                 String insertSql = "insert into audit_history(user_id, employee_id, action, action_date_time) values(?,?,?,?)";
                 String status = null;
                 if(percent>=0) status = "Salary Increased!";
                 else status = "Salary decreased!";
                 try(PreparedStatement insertStmt = conn.prepareStatement(insertSql))
                 {   
                     insertStmt.setInt(1, userId);
                     insertStmt.setInt(2, empId);
                     insertStmt.setString(3, status);
                     insertStmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
                     int r = insertStmt.executeUpdate();
                     System.out.println(r);
                    
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return increased;
    }
    
    public boolean deleteEmployee(int id, int userId){
        boolean delete = false;
        String sql = "delete from employees where id = ?";
        try(Connection conn = DbConnection.getInstance().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql))
        {
            stmt.setInt(1, id);
            int row = stmt.executeUpdate();
            if(row>0){
                delete = true;
                String insertSql = "insert into audit_history(user_id, employee_id, action, action_date_time) values(?,?,?,?)";
                 String status = "Employee deleted!";
                 try(PreparedStatement insertStmt = conn.prepareStatement(insertSql))
                 {   
                     insertStmt.setInt(1, userId);
                     insertStmt.setInt(2, id);
                     insertStmt.setString(3, status);
                     insertStmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
                     int r = insertStmt.executeUpdate();
                     System.out.println(r);
                    
                }catch(Exception e){
                    e.printStackTrace();
                }
            }else{
                System.out.println("Employee not found!");
            }
            return delete;
        }catch(Exception e){
            e.printStackTrace();
        }
            return delete;
    }
    
    public static void main(String[] args) {
//        UserDao dao = new UserDao();
//        //System.out.println(dao.getUsers());
//        //System.out.println(dao.getEmployees());
//        //System.out.println(dao.getEmployees());
            System.out.println(new EmployeeDao().searchEmployees("i"));
//        //System.out.println(dao.getEmployeeByDepartment("HR"));
//        System.out.println(dao.getUserById(2));
//        System.out.println(dao.getEmployeeById(11));
//        System.out.println(dao.getUserByPasswordLastName("Ianc","ptru_nc@yahoo.com","123456"));
//        dao.increaseSalaryByEmployee(12, -0.1, 1);
//        dao.deleteEmployee(15, 3);
           System.out.println(new EmployeeDao().getEmployeeById(3));
        
        //dao.addEmployee(new Employee("Ianc","Petru","petruianc1503@gmail.com","Legal", BigDecimal.valueOf(125000)), 1);
    }
}
