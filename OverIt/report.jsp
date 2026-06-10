<%@ page import="java.util.ArrayList" %>
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
    <title>Generated Report - OverIt</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css?v=2">
    <style>
        .report-header {
            text-align: center;
            border-bottom: 4px solid var(--primary);
            padding-bottom: 20px;
            margin-bottom: 30px;
        }
        .report-date {
            color: #666;
            font-weight: 600;
        }
        .report-table-wrapper {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 4px 4px 0px var(--primary);
            border: 2px solid var(--primary);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: var(--primary);
            color: white;
            font-family: var(--font-heading);
            font-size: 18px;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        
        @media print {
            .no-print { display: none !important; }
            .glass-card { box-shadow: none !important; border: none !important; background: transparent !important; }
            .report-table-wrapper { box-shadow: none !important; border: 1px solid #ccc !important; }
            body { background: white !important; }
            .bg-blob { display: none !important; }
        }
    </style>
</head>
<body>
    <div class="bg-blob blob-1"></div>
    
    <nav class="navbar no-print">
        <a href="admin" class="navbar-brand">
            <i class="fa-solid fa-bolt"></i> OverIt Admin
        </a>
        <div class="navbar-nav">
            <a href="admin" class="nav-btn"><i class="fa-solid fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </nav>

    <div style="padding: 40px 10%; max-width: 1200px; margin: auto;">
        
        <div class="no-print" style="text-align: right; margin-bottom: 20px;">
            <button onclick="window.print()" class="btn-primary" style="width: auto; padding: 10px 20px;">
                <i class="fa-solid fa-print"></i> Print / Download PDF
            </button>
        </div>

        <div class="glass-card fade-in">
            <div class="report-header">
                <h1 style="font-family: var(--font-heading); color: var(--primary); font-size: 3rem; margin: 0 0 10px 0;">
                    <i class="fa-solid fa-file-invoice"></i> Wellness Analytics Report
                </h1>
                <p class="report-date">Generated on: <%= new java.util.Date() %> | Admin: <%= session.getAttribute("studentEmail") %></p>
            </div>

            <div class="report-table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>Student Name</th>
                            <th>Metric 1</th>
                            <th>Metric 2</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% 
                    ArrayList<String[]> reportData = (ArrayList<String[]>) request.getAttribute("reportData");
                    if(reportData != null && !reportData.isEmpty()){
                        for(String[] row : reportData){
                    %>
                        <tr>
                            <td style="font-weight: bold;"><%= row[0] %></td>
                            <td><%= row[1] %></td>
                            <td><%= row[2] %></td>
                        </tr>
                    <% 
                        } 
                    } else { 
                    %>
                        <tr>
                            <td colspan="3" style="text-align: center; padding: 30px; font-style: italic; color: #888;">
                                No matching records found for this report.
                            </td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
            
            <div style="margin-top: 40px; text-align: center; color: #666; font-size: 14px; border-top: 1px solid #ccc; padding-top: 10px;">
                <p>OverIt Student Burnout Detection & Wellness Analytics - Strictly Confidential</p>
            </div>
        </div>

    </div>
</body>
</html>