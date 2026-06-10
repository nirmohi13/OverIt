<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
String student = (String) session.getAttribute("studentEmail");
String role = (String) session.getAttribute("role");
if(student == null){
    response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OverIt - My Profile</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css?v=2">
</head>
<body>
    <div class="bg-blob blob-1"></div>
    <div class="bg-blob blob-2"></div>

    <!-- Global Header -->
    <nav class="navbar">
        <a href="index.jsp" class="navbar-brand">
            <i class="fa-solid fa-bolt"></i> OverIt
        </a>
        <div class="navbar-nav">
            <a href="javascript:history.back()" class="nav-btn"><i class="fa-solid fa-arrow-left"></i> Back</a>
            <% if("admin".equals(role)) { %>
                <a href="admin" class="nav-btn"><i class="fa-solid fa-chart-line"></i> Dashboard</a>
            <% } else { %>
                <a href="studentDashboard.jsp" class="nav-btn"><i class="fa-solid fa-house"></i> Dashboard</a>
            <% } %>
            
            <div class="profile-dropdown">
                <button class="profile-btn">
                    <i class="fa-solid fa-user-astronaut"></i> Profile
                </button>
                <div class="dropdown-content">
                    <a href="profile.jsp"><i class="fa-solid fa-id-card"></i> View Profile</a>
                    <a href="#"><i class="fa-solid fa-pen-to-square"></i> Update Profile</a>
                    <a href="#" style="color: #e74c3c;"><i class="fa-solid fa-trash-can"></i> Delete Account</a>
                    <a href="logout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div style="display: flex; justify-content: center; align-items: center; min-height: 80vh; padding: 20px;">
        <div class="glass-card fade-in" style="width: 500px; text-align: center;">
            <div style="font-size: 80px; color: var(--primary); margin-bottom: 20px;">
                <i class="fa-solid fa-user-astronaut"></i>
            </div>
            <h2 class="title-primary" style="margin-bottom: 10px;">My Profile</h2>
            
            <div style="text-align: left; background: #f9f9f9; padding: 20px; border-radius: 12px; margin-bottom: 20px; border: 2px dashed #ccc;">
                <p style="font-size: 18px; margin: 10px 0;"><strong><i class="fa-solid fa-envelope"></i> Email:</strong> <%= student %></p>
                <p style="font-size: 18px; margin: 10px 0;"><strong><i class="fa-solid fa-user-tag"></i> Role:</strong> <%= (role != null) ? role : "Student" %></p>
            </div>

            <div style="display: flex; gap: 15px;">
                <button class="btn-primary" onclick="alert('Update Profile feature coming soon!')">Update Profile</button>
                <button class="btn-primary" style="background: #e74c3c;" onclick="confirmDelete()">Delete Account</button>
            </div>
        </div>
    </div>

    <script>
        function confirmDelete() {
            if(confirm("Are you sure you want to delete your account? This action cannot be undone.")) {
                alert("Account deletion request submitted.");
            }
        }
    </script>
</body>
</html>
