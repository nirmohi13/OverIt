<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="dao.StudentDAO" %>
<%@ page import="dao.BurnoutDAO" %>
<%
String student = (String) session.getAttribute("studentEmail");
String role = (String) session.getAttribute("role");
if(student == null){
    response.sendRedirect("login.jsp");
    return;
}

int studentId = new StudentDAO().getStudentIdByEmail(student);
String historyData = new BurnoutDAO().getStudentScoreHistory(studentId);
String historyDates = new BurnoutDAO().getStudentScoreDates(studentId);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OverIt Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
        <div class="glass-card fade-in" style="width: 600px; text-align: center;">
            <div style="font-size: 60px; color: var(--primary); margin-bottom: 20px;">
                <i class="fa-solid fa-hand-wave"></i>
            </div>
            <h1 class="title-primary" style="margin-bottom: 10px;">Welcome to OverIt Dashboard</h1>
            <p style="font-size: 20px; color: var(--text-dark); margin-bottom: 30px;">
                Logged in as: <b><%= student %></b>
            </p>
            
            <div style="display: flex; flex-direction: column; gap: 15px;">
                <a href="survey.jsp" class="btn-primary">
                    <i class="fa-solid fa-pencil"></i> Take Weekly Survey
                </a>
            </div>

            <div style="margin-top: 40px;">
                <h2 style="font-family: var(--font-heading); font-size: 1.5rem; color: var(--primary);"><i class="fa-solid fa-chart-line"></i> Your Burnout History</h2>
                <div style="position: relative; height: 300px; width: 100%;">
                    <canvas id="studentHistoryChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <script>
        const ctx = document.getElementById('studentHistoryChart').getContext('2d');
        const labels = [<%= historyDates %>];
        const data = [<%= historyData %>];

        if (data.length > 0) {
            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Burnout Score Trend',
                        data: data,
                        borderColor: '#650000',
                        backgroundColor: 'rgba(101, 0, 0, 0.2)',
                        tension: 0.4,
                        fill: true,
                        pointBackgroundColor: '#89CFF0',
                        pointRadius: 6
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            max: 100
                        }
                    }
                }
            });
        } else {
            document.getElementById('studentHistoryChart').outerHTML = '<p style="color: #666; margin-top: 50px;">No historical data available yet. Take a survey to get started!</p>';
        }
    </script>
</body>
</html>