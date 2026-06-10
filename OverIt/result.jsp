<%@ page import="jakarta.servlet.http.HttpSession" %>
<% 
Integer sleepHours=(Integer) request.getAttribute("sleepHours"); 
Integer stressLevel=(Integer) request.getAttribute("stressLevel"); 
Integer assignmentLoad=(Integer) request.getAttribute("assignmentLoad");
Integer physicalActivity=(Integer) request.getAttribute("physicalActivity"); 
Integer moodLvl=(Integer) request.getAttribute("moodLvl"); 
Integer breakFreq=(Integer) request.getAttribute("breakFreq"); 
String student = (String) session.getAttribute("studentEmail");
String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OverIt - Burnout Analysis</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css?v=2">
    <style>
        .risk-badge {
            display: inline-block;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: bold;
            font-size: 1.2rem;
            text-transform: uppercase;
            border: 2px solid #333;
        }
        .risk-LOW { background: #2ecc71; color: white; }
        .risk-MODERATE { background: #f1c40f; color: black; }
        .risk-HIGH { background: #e74c3c; color: white; }
        
        .recommendation-item {
            background: rgba(255,255,255,0.5);
            border-left: 5px solid var(--primary);
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 8px;
        }
        .recommendation-item h3 {
            margin-top: 0;
            color: var(--primary);
            font-family: var(--font-heading);
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .recommendation-item ul {
            margin: 10px 0 0 0;
            padding-left: 20px;
        }
    </style>
</head>
<body>
    <div class="halftone-bg"></div>
    <i class="fa-solid fa-heart-pulse comic-doodle" style="top: 40%; left: 5%; font-size: 12rem;"></i>
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
                    <a href="logout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div style="padding: 40px 10%; max-width: 1400px; margin: auto;">
        <h1 class="title-primary"><i class="fa-solid fa-square-poll-vertical"></i> Your Wellness Analytics</h1>
        
        <div class="result-grid">
            <!-- LEFT COLUMN: Score Card -->
            <div class="glass-card fade-in" style="display: flex; flex-direction: column; align-items: center;">
                <h2 style="font-family: var(--font-heading); font-size: 2rem; margin-top: 0;">Burnout Severity</h2>
                
                <% 
                String risk = String.valueOf(request.getAttribute("riskCategory"));
                String riskClass = "risk-MODERATE";
                if(risk != null && risk.toUpperCase().contains("LOW")) riskClass = "risk-LOW";
                else if(risk != null && risk.toUpperCase().contains("HIGH")) riskClass = "risk-HIGH";
                %>
                <div class="risk-badge <%=riskClass%>" style="margin-bottom: 20px;">
                    <%=risk%> RISK
                </div>
                
                <div style="width: 100%; max-width: 300px; margin-bottom: 30px;">
                    <canvas id="burnoutChart"></canvas>
                </div>
                
                <div style="display: flex; gap: 20px; width: 100%; justify-content: center; margin-bottom: 20px;">
                    <div style="text-align: center; background: #f0f0f0; padding: 15px; border-radius: 12px; min-width: 120px;">
                        <p style="margin:0; font-size: 14px; color: #666;">Burnout Score</p>
                        <p style="margin:5px 0 0; font-size: 28px; font-weight: bold; color: var(--primary);">${burnoutScore}</p>
                    </div>
                    <div style="text-align: center; background: #f0f0f0; padding: 15px; border-radius: 12px; min-width: 120px;">
                        <p style="margin:0; font-size: 14px; color: #666;">Health Index</p>
                        <p style="margin:5px 0 0; font-size: 28px; font-weight: bold; color: #2ecc71;">${healthIndex}</p>
                    </div>
                </div>

                <div style="background: var(--secondary); padding: 20px; border-radius: 12px; width: 100%; box-sizing: border-box; text-align: center; border: 2px dashed var(--primary);">
                    <h3 style="margin-top: 0; color: var(--primary); font-family: var(--font-heading);"><i class="fa-solid fa-star"></i> Daily Affirmation</h3>
                    <p style="font-size: 18px; margin: 0; font-weight: 600;">"Your worth is not measured by your exhaustion. Progress matters more than perfection."</p>
                </div>
            </div>

            <!-- RIGHT COLUMN: Recommendations -->
            <div class="glass-card fade-in" style="animation-delay: 0.2s; max-height: 700px; overflow-y: auto;">
                <h2 style="font-family: var(--font-heading); font-size: 2rem; margin-top: 0; border-bottom: 2px solid #ccc; padding-bottom: 10px;">
                    <i class="fa-solid fa-hand-holding-heart"></i> AI Recommendations
                </h2>
                
                <% if(sleepHours != null && sleepHours < 6){ %>
                <div class="recommendation-item">
                    <h3><i class="fa-solid fa-bed"></i> Sleep Recovery Needed</h3>
                    <ul>
                        <li>Aim for 7-8 hours sleep consistently.</li>
                        <li>Avoid screens before bed.</li>
                        <li>Maintain fixed sleep timings.</li>
                    </ul>
                </div>
                <% } %>

                <% if(stressLevel != null && stressLevel >= 7){ %>
                <div class="recommendation-item">
                    <h3><i class="fa-solid fa-brain"></i> High Stress Detected</h3>
                    <ul>
                        <li>Practice deep breathing daily.</li>
                        <li>Break large tasks into smaller goals.</li>
                        <li>Avoid multitasking overload.</li>
                    </ul>
                </div>
                <% } %>

                <% if(assignmentLoad != null && assignmentLoad >= 7){ %>
                <div class="recommendation-item">
                    <h3><i class="fa-solid fa-book"></i> Academic Overload</h3>
                    <ul>
                        <li>Use a weekly planner.</li>
                        <li>Prioritize assignments.</li>
                        <li>Avoid last-minute submissions.</li>
                    </ul>
                </div>
                <% } %>

                <% if(physicalActivity != null && physicalActivity <= 4){ %>
                <div class="recommendation-item">
                    <h3><i class="fa-solid fa-person-running"></i> Low Physical Activity</h3>
                    <ul>
                        <li>Walk daily for 20 minutes.</li>
                        <li>Stretch between study sessions.</li>
                        <li>Exercise improves stress resistance.</li>
                    </ul>
                </div>
                <% } %>

                <% if(moodLvl != null && moodLvl <= 4){ %>
                <div class="recommendation-item">
                    <h3><i class="fa-solid fa-face-smile"></i> Mood Support Needed</h3>
                    <ul>
                        <li>Talk to supportive people.</li>
                        <li>Take breaks guilt-free.</li>
                        <li>Seek help when overwhelmed.</li>
                    </ul>
                </div>
                <% } %>

                <% if(breakFreq != null && breakFreq <= 4){ %>
                <div class="recommendation-item">
                    <h3><i class="fa-solid fa-mug-hot"></i> Low Break Frequency</h3>
                    <ul>
                        <li>Use Pomodoro technique.</li>
                        <li>Take short regular breaks.</li>
                        <li>Continuous study reduces productivity.</li>
                    </ul>
                </div>
                <% } %>
            </div>
        </div>

        <!-- BOTTOM GRID: Additional Charts -->
        <div class="result-grid" style="margin-top: 30px;">
            <div class="glass-card fade-in" style="animation-delay: 0.3s;">
                <h3 style="font-family: var(--font-heading); margin-top: 0; text-align: center;">Stress Indicator Bars</h3>
                <canvas id="stressBarChart"></canvas>
            </div>
            <div class="glass-card fade-in" style="animation-delay: 0.4s;">
                <h3 style="font-family: var(--font-heading); margin-top: 0; text-align: center;">Wellness Meter</h3>
                <canvas id="wellnessPolarChart"></canvas>
            </div>
        </div>

    </div>

    <script>
        // Pie Chart
        const pieCtx = document.getElementById('burnoutChart').getContext('2d');
        new Chart(pieCtx, {
            type: 'doughnut',
            data: {
                labels: ['Burnout Risk', 'Health Reserve'],
                datasets: [{
                    data: [Number("${burnoutScore}"), Number("${healthIndex}")],
                    backgroundColor: ['#e74c3c', '#2ecc71'],
                    borderWidth: 2,
                    borderColor: '#ffffff'
                }]
            },
            options: {
                cutout: '65%',
                plugins: {
                    legend: { position: 'bottom' }
                }
            }
        });

        // Stress Indicator Bar Chart
        const stressVal = Number("<%= stressLevel != null ? stressLevel : 5 %>");
        const assignmentVal = Number("<%= assignmentLoad != null ? assignmentLoad : 5 %>");
        const deadlineVal = Number('<%= request.getAttribute("deadlineProximity") != null ? request.getAttribute("deadlineProximity") : 5 %>');
        
        const barCtx = document.getElementById('stressBarChart').getContext('2d');
        new Chart(barCtx, {
            type: 'bar',
            data: {
                labels: ['Stress', 'Assignments', 'Deadlines'],
                datasets: [{
                    label: 'Pressure Levels (1-10)',
                    data: [stressVal, assignmentVal, deadlineVal],
                    backgroundColor: ['#f1c40f', '#e67e22', '#e74c3c'],
                    borderRadius: 5
                }]
            },
            options: {
                scales: { y: { beginAtZero: true, max: 10 } }
            }
        });

        // Wellness Polar Area Chart
        const sleepVal = Number("<%= sleepHours != null ? sleepHours : 6 %>");
        const activityVal = Number("<%= physicalActivity != null ? physicalActivity : 5 %>");
        const moodVal = Number("<%= moodLvl != null ? moodLvl : 5 %>");
        const breakVal = Number("<%= breakFreq != null ? breakFreq : 5 %>");

        const polarCtx = document.getElementById('wellnessPolarChart').getContext('2d');
        new Chart(polarCtx, {
            type: 'polarArea',
            data: {
                labels: ['Sleep (hrs)', 'Activity', 'Mood', 'Breaks'],
                datasets: [{
                    data: [sleepVal, activityVal, moodVal, breakVal],
                    backgroundColor: [
                        'rgba(54, 162, 235, 0.6)',
                        'rgba(75, 192, 192, 0.6)',
                        'rgba(153, 102, 255, 0.6)',
                        'rgba(255, 159, 64, 0.6)'
                    ]
                }]
            },
            options: {
                scales: { r: { max: 12 } }
            }
        });
    </script>
</body>
</html>