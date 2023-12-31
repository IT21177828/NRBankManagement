<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="DBEntities.*,java.io.File" session="true" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="http://localhost:8080/NRBOnline/css/Styles.css">
	
</head>
<body>
<%boolean isLogged = false;
User user;
try{
	isLogged = (boolean) session.getAttribute("isLoggedIn");
}catch(NullPointerException e){
	
}
if(!isLogged){
	out.println("<script>window.open('Login.jsp','_self')</script>");
}else{
	String userId = (String) session.getAttribute("userID");
	user = new User();
	user.loadUser(userId);%>
	
<section>
    <div class="header-wrapper">
        <header>
            <div class="login-wrapper">
                <div class="user-img-wrapper">
                    <img id="profile" src="http://localhost:8080/NRBOnline/images/User.png" alt="User" style="width:50px ;height: 50px;border-radius: 50%;width: 50px; height: 50px;object-fit: cover;">
                </div>
                <button type="button" class="btn btn-outline-primary" onclick="window.open('../index.jsp','_self');">Logout</button>  
            </div>
        </header>
        <%if((boolean)session.getAttribute("isLoggedIn")){		 
	out.println("<script> var element = document.getElementById('profile');element.src=\"/NRBOnline/DPGetter?url="+user.getPictureURL() +"\";</script>");
out.println("<script>var log = document.getElementById('loginBtn'); log.innerHTML='Logout'</script>");
}
		%>
    </div>
    <div class="nav-Wrapper">
        <div class="nav-seciton">
            <nav>				
                <ul id="menutab" >
                    <li><a class="nav-buttons smooth "  href="../index.jsp" onclick="hideShowmenu();find('a');">Home</a></li>
                    <li><a class="nav-buttons smooth" onclick="hideShowmenu();find('f');">Account</a></li>
                    <li><a class="nav-buttons smooth Active" href="Loan.jsp" onclick="hideShowmenu();find('t');">Loan</a></li>
                    <li><a class="nav-buttons smooth" href="#" onclick="hideShowmenu();">Transaction</a></li>
                   
                </ul>
            </nav>
        </div>
    </div>
    <h1>Guaranting Loans</h1>
    <div class="guaranting-loan">

    </div>
    
</section>
<div class="footer-section col-" style="position:fixed;">	
    <div class="wave">
        <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
            <path d="M0,0V46.29c47.79,22.2,103.59,32.17,158,28,70.36-5.37,136.33-33.31,206.8-37.5C438.64,32.43,512.34,53.67,583,72.05c69.27,18,138.3,24.88,209.4,13.08,36.15-6,69.85-17.84,104.45-29.34C989.49,25,1113-14.29,1200,52.47V0Z" opacity=".25" class="shape-fill"></path>
            <path d="M0,0V15.81C13,36.92,27.64,56.86,47.69,72.05,99.41,111.27,165,111,224.58,91.58c31.15-10.15,60.09-26.07,89.67-39.8,40.92-19,84.73-46,130.83-49.67,36.26-2.85,70.9,9.42,98.6,31.56,31.77,25.39,62.32,62,103.63,73,40.44,10.79,81.35-6.69,119.13-24.28s75.16-39,116.92-43.05c59.73-5.85,113.28,22.88,168.9,38.84,30.2,8.66,59,6.17,87.09-7.5,22.43-10.89,48-26.93,60.65-49.24V0Z" opacity=".5" class="shape-fill"></path>
            <path d="M0,0V5.63C149.93,59,314.09,71.32,475.83,42.57c43-7.64,84.23-20.12,127.61-26.46,59-8.63,112.48,12.24,165.56,35.4C827.93,77.22,886,95.24,951.2,90c86.53-7,172.46-45.71,248.8-84.81V0Z" class="shape-fill"></path>
        </svg>			
    </div>
        
    <div class="info-wrapper">
        <p id="copyright">�All rights reserved 2022</p>
        <p id="contact-info">Contact: info.NRB-Banking-System</p>
    </div>
</div>
<%} %>
</body>
</html>