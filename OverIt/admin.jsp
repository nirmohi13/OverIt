<%@ page import="jakarta.servlet.http.HttpSession" %>
<% 
String role = (String) session.getAttribute("role");
if(role == null || !role.equals("admin")){
    response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OverIt Admin Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css?v=2">
    <style>
        .admin-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            margin-top: 25px;
        }
        .metric-card {
            background: var(--white);
            padding: 25px;
            border-radius: 15px;
            box-shadow: 6px 6px 0px var(--primary);
            border: 2px solid var(--primary);
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .metric-card:hover {
            transform: translateY(-5px);
            box-shadow: 10px 10px 0px var(--primary);
        }
        .metric-icon {
            font-size: 40px;
            color: var(--secondary);
            background: var(--primary);
            width: 80px;
            height: 80px;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .metric-info h2 {
            font-family: var(--font-body);
            font-size: 16px;
            color: #666;
            margin: 0 0 5px 0;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .metric-info .metric-value {
            font-family: var(--font-heading);
            font-size: 36px;
            color: var(--primary);
            margin: 0;
        }
        .insight-card {
            background: linear-gradient(135deg, var(--primary), #8a0000);
            color: var(--white);
            padding: 30px;
            border-radius: 15px;
            margin-top: 30px;
            position: relative;
            overflow: hidden;
        }
        .insight-card i {
            position: absolute;
            right: -20px;
            bottom: -20px;
            font-size: 150px;
            color: rgba(255,255,255,0.1);
        }
    </style>
</head>
<body>
    <div class="halftone-bg"></div>
    <i class="fa-solid fa-chart-pie comic-doodle" style="top: 30%; left: 5%; font-size: 12rem;"></i>
    <i class="fa-solid fa-magnifying-glass-chart comic-doodle" style="bottom: 10%; right: 5%; font-size: 15rem;"></i>
    <div class="bg-blob blob-1 animate-float"></div>
    <div class="bg-blob blob-2 animate-float" style="animation-delay: 2s;"></div>

    <nav class="navbar">
        <a href="index.jsp" class="navbar-brand">
            <i class="fa-solid fa-bolt"></i> OverIt Admin
        </a>
        <div class="navbar-nav">
            <div class="profile-dropdown">
                <button class="profile-btn">
                    <i class="fa-solid fa-user-shield"></i> Admin
                </button>
                <div class="dropdown-content">
                    <a href="profile.jsp"><i class="fa-solid fa-id-card"></i> View Profile</a>
                    <a href="logout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div style="padding: 30px 5%; max-width: 1400px; margin: auto;">
        
        <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 30px;">
            <h1 class="title-primary" style="margin-bottom: 0;"><i class="fa-solid fa-chart-line"></i> Analytics Dashboard</h1>
            
            <!-- Generate Report Form -->
            <form action="<%=request.getContextPath()%>/generateReport" method="post" style="display: flex; gap: 10px; align-items: center; background: var(--white); padding: 10px 20px; border-radius: 12px; border: 2px solid var(--primary); box-shadow: 4px 4px 0px var(--primary);">
                <span style="font-weight: bold; font-family: var(--font-heading); color: var(--primary);">Report:</span>
                <select name="reportType" required style="width: auto; padding: 8px; margin: 0; border: 1px solid #ccc; font-size: 14px;">
                    <option value="">Select Type</option>
                    <option value="burnout">High Burnout</option>
                    <option value="stress">Stress Risk</option>
                    <option value="sleep">Sleep Deficiency</option>
                </select>
                <button type="submit" class="btn-primary" style="padding: 8px 15px; width: auto; font-size: 14px;">
                    <i class="fa-solid fa-file-pdf"></i> Generate
                </button>
            </form>
        </div>

        <div class="admin-grid">
            <div class="metric-card fade-in">
                <div class="metric-icon"><i class="fa-solid fa-fire-flame-curved"></i></div>
                <div class="metric-info">
                    <h2>Avg Burnout</h2>
                    <p class="metric-value">${avgBurnout}</p>
                </div>
            </div>
            
            <div class="metric-card fade-in" style="animation-delay: 0.1s;">
                <div class="metric-icon" style="background: #e74c3c; color: white;"><i class="fa-solid fa-triangle-exclamation"></i></div>
                <div class="metric-info">
                    <h2>Severe Cases</h2>
                    <p class="metric-value">${severeCount}</p>
                </div>
            </div>
            
            <div class="metric-card fade-in" style="animation-delay: 0.2s;">
                <div class="metric-icon" style="background: #2ecc71; color: white;"><i class="fa-solid fa-heart-circle-check"></i></div>
                <div class="metric-info">
                    <h2>Avg Health</h2>
                    <p class="metric-value">${avgHealth}</p>
                </div>
            </div>
        </div>

        <div class="insight-card fade-in" style="animation-delay: 0.3s;">
            <h2 style="font-family: var(--font-heading); margin-top: 0; border-bottom: 1px solid rgba(255,255,255,0.3); padding-bottom: 10px;">
                <i class="fa-solid fa-robot"></i> AI Wellness Insight
            </h2>
            <p style="font-size: 20px; line-height: 1.6; margin-bottom: 0;">${pressureInsight}</p>
            <i class="fa-solid fa-brain"></i>
        </div>

        <div class="result-grid" style="margin-top: 30px;">
            <div class="glass-card fade-in" style="animation-delay: 0.4s;">
                <h2 style="font-family: var(--font-heading); margin-top: 0; color: var(--primary);"><i class="fa-solid fa-chart-area"></i> Weekly Trend</h2>
                <canvas id="trendChart"></canvas>
            </div>
            
            <div class="glass-card fade-in" style="animation-delay: 0.5s;">
                <h2 style="font-family: var(--font-heading); margin-top: 0; color: var(--primary);"><i class="fa-solid fa-chart-bar"></i> Risk Breakdown</h2>
                <canvas id="riskChart"></canvas>
            </div>
        </div>

    </div>

    <script>
        const trendCtx = document.getElementById('trendChart');
        var weeklyData = "${weeklyTrend}" ? "${weeklyTrend}".split(",") : [];
        new Chart(trendCtx, {
            type: 'line',
            data: {
                labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
                datasets: [{
                    label: 'Campus Burnout Trend',
                    data: weeklyData,
                    borderColor: '#650000',
                    backgroundColor: 'rgba(101, 0, 0, 0.2)',
                    tension: 0.4,
                    fill: true,
                    pointBackgroundColor: '#89CFF0',
                    pointRadius: 6
                }]
            }
        });

        const riskCtx = document.getElementById('riskChart');
        var stressData = "${stressTrend}" ? "${stressTrend}".split(",") : [];
        new Chart(riskCtx, {
            type: 'bar',
            data: {
                labels: ['Stress', 'Assignments', 'Sleep', 'Mood', 'Deadlines'],
                datasets: [{
                    label: 'Campus Avg Risk Factors',
                    data: stressData,
                    backgroundColor: ['#e74c3c', '#f39c12', '#3498db', '#9b59b6', '#c0392b'],
                    borderRadius: 6
                }]
            }
        });
    </script>
</body>
</html>