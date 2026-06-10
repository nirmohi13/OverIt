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
    <title>Weekly Burnout Survey</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css?v=2">
</head>
<body>
    <div class="bg-blob blob-1 animate-float"></div>
    <div class="bg-blob blob-2 animate-float" style="animation-delay: 2s;"></div>

    <nav class="navbar">
        <a href="index.jsp" class="navbar-brand">
            <i class="fa-solid fa-bolt"></i> OverIt
        </a>
        <div class="navbar-nav">
            <a href="studentDashboard.jsp" class="nav-btn"><i class="fa-solid fa-house"></i> Dashboard</a>
            
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

    <div style="display: flex; justify-content: center; align-items: center; min-height: 80vh; padding: 40px 20px;">
        <div class="glass-card fade-in" style="width: 700px;">
            <h1 class="title-primary"><i class="fa-solid fa-clipboard-list"></i> Weekly Burnout Survey</h1>
            
            <form action="<%=request.getContextPath()%>/submitSurvey" method="post" style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                <div class="form-group">
                    <label>Sleep Hours</label>
                    <input type="number" name="sleep_hours" min="0" max="12" required>
                </div>
                <div class="form-group">
                    <label>Sleep Quality (1-10)</label>
                    <input type="number" name="sleep_quality" min="1" max="10" required>
                </div>
                <div class="form-group">
                    <label>Stress Level (1-10)</label>
                    <input type="number" name="stress_level" min="1" max="10" required>
                </div>
                <div class="form-group">
                    <label>Academic Pressure (1-10)</label>
                    <input type="number" name="academic_pressure" min="1" max="10" required>
                </div>
                <div class="form-group">
                    <label>Study Hours</label>
                    <input type="number" name="study_hours" required>
                </div>
                <div class="form-group">
                    <label>Assignment Load (1-10)</label>
                    <input type="number" name="assignment_load" min="1" max="10" required>
                </div>
                <div class="form-group">
                    <label>Deadline Proximity (1-10)</label>
                    <input type="number" name="deadline_proximity" min="1" max="10" required>
                </div>
                <div class="form-group">
                    <label>Physical Activity (1-10)</label>
                    <input type="number" name="physical_activity" min="1" max="10" required>
                </div>
                <div class="form-group">
                    <label>Social Interaction (1-10)</label>
                    <input type="number" name="social_interaction" min="1" max="10" required>
                </div>
                <div class="form-group">
                    <label>Break Frequency (1-10)</label>
                    <input type="number" name="break_freq" min="1" max="10" required>
                </div>
                <div class="form-group" style="grid-column: span 2;">
                    <label>Mood Level (1-10)</label>
                    <input type="number" name="mood_lvl" min="1" max="10" required>
                </div>
                
                <div style="grid-column: span 2; margin-top: 10px;">
                    <button type="submit" class="btn-primary">
                        <i class="fa-solid fa-magnifying-glass-chart"></i> Analyze Burnout
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>