<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Medical Details</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .nav-item {
            margin: 5px;
        }
        .xyz {
            width: 250px;
            height: 100px;
            margin: auto;
        }
        button {
            margin: 10px
        }
        a {
            text-decoration: none;
        }
        .xyz{
		padding-top: 100px
		}
		.a{
			text-align: center;
		}
		
    </style>

</head>
<body>

	<%
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hms","root","abdulrahman");
		Statement stmt=connection.createStatement();
		int name=Integer.parseInt(request.getParameter("id"));
		String sql="Select patient_detail.pid, pname, phoneno,Age from patient_detail where patient_detail.pid=?";
		PreparedStatement stm=connection.prepareStatement(sql);
		stm.setInt(1, name);
		ResultSet rs=stm.executeQuery();
		
	if(rs.next()){
		int pid=rs.getInt("pid");
		String pname=rs.getString("pname");
		String phoneno=rs.getString("phoneno");
		int age=rs.getInt("Age");
	%>
	
	<div style="margin: 70px;">
    <table class="table table-bordered">
        <thead>
          <tr>
            <th style="text-align: center;" colspan="4"><h3>PATIENT DETAILS</h3></th>
            
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">Patient ID</th>
            <td><%=pid %></td>
            <th>Patient Name</th>
            <td><%=pname %></td>
          </tr>
          <tr>
          <tr>
            <th scope="row">Phone No.</th>
            <td><%=phoneno %></td>
            <th>Age</th>
            <td><%=age%></td>
          </tr>
        </tbody>
      </table>
    </div>
    <%
	}
		
		//response.sendRedirect("NurseLogin.jsp");

	
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
	<div style="margin: 70px;">
        <table class="table table-bordered">
            <thead>
              <tr>
                <th style="text-align: center;" colspan="7"><h3>MEDICAL HISTORY</h3></th>
              </tr>
            </thead>
            <tbody>
            <%
            try
            {
            	Class.forName("com.mysql.jdbc.Driver");
        		Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hms","root","abdulrahman");
        		Statement stmt=connection.createStatement();
        		int name=Integer.parseInt(request.getParameter("id"));
        		String sql="select bp,bs,patient_doctor.Visit,Prescription,dis_detail from patient_doctor,patient_nurse where patient_doctor.pid=patient_nurse.pid and patient_nurse.pid =? and  patient_doctor.Visit=patient_nurse.Visit";
        		PreparedStatement stm=connection.prepareStatement(sql);
        		stm.setInt(1, name);
        		ResultSet rs=stm.executeQuery();
            	
            %>
            
              <tr>
                <th scope="row">Blood Pressure</th>
                <th scope="row">Blood Sugar</th>
                <th scope="row">Visit</th>
                <th scope="row">Prescription</th>
                <th scope="row">Disease Details</th>
              </tr>
              <%
              while(rs.next())
              {
            	 %>
            	 <tr> 
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
              </tr>
            </tbody>
            <% 
              }
              %>
          </table>  
    </div>
    <%
        	}
        		
        		//response.sendRedirect("NurseLogin.jsp");

        	
        	catch(SQLException e){
        		e.printStackTrace();
        	}
        	
            %>

</body>
</html>