<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OverIt Login</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css?v=4">
    <style>
        .password-wrapper {
            position: relative;
        }
        .password-wrapper .eye-icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #666;
        }
    </style>
    <script>
        function togglePassword(fieldId, icon) {
            const field = document.getElementById(fieldId);
            if (field.type === "password") {
                field.type = "text";
                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");
            } else {
                field.type = "password";
                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");
            }
        }
        function validateLoginForm() {
            const email = document.forms["loginForm"]["email"].value;
            const password = document.forms["loginForm"]["password"].value;
            const errorMsg = document.getElementById("error-msg");
            const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.(com|in)$/;

            if (!emailPattern.test(email)) {
                errorMsg.innerText = "Enter valid email ending in .com or .in";
                errorMsg.style.display = "block";
                return false;
            }
            if (password.trim() === "") {
                errorMsg.innerText = "Enter password.";
                errorMsg.style.display = "block";
                return false;
            }
            errorMsg.style.display = "none";
            return true;
        }
    </script>
</head>
<body>
    <div class="halftone-bg"></div>
    <i class="fa-solid fa-bolt comic-doodle" style="top: 20%; right: 15%; font-size: 12rem;"></i>
    <div class="bg-blob blob-1 animate-float"></div>
    <div class="bg-blob blob-2 animate-float" style="animation-delay: 2s;"></div>

    <nav class="navbar">
        <a href="index.jsp" class="navbar-brand">
            <i class="fa-solid fa-bolt"></i> OverIt
        </a>
        <div class="navbar-nav">
            <a href="index.jsp" class="nav-btn"><i class="fa-solid fa-house"></i> Home</a>
            <a href="register.jsp" class="btn-primary" style="padding: 8px 20px; width: auto; font-size: 16px;">Sign Up</a>
        </div>
    </nav>

    <% if("invalid".equals(request.getParameter("error"))) { %>
        <div id="errorPopup" class="comic-alert bounce-in">
            <i class="fa-solid fa-triangle-exclamation"></i> <strong>Bummer!</strong> Invalid Email, Password or Role. Try again!
            <button onclick="document.getElementById('errorPopup').style.display='none'"><i class="fa-solid fa-xmark"></i></button>
        </div>
    <% } %>

    <div style="display: flex; justify-content: center; align-items: center; min-height: 80vh; padding: 20px;">
        <div class="glass-card fade-in" style="width: 400px;">
            <h2 class="title-primary">Welcome Back</h2>
            <form name="loginForm" action="login" method="post" onsubmit="return validateLoginForm()">
                <div class="form-group">
                    <label>Select Role</label>
                    <select name="role" required>
                        <option value="">Choose...</option>
                        <option value="student">Student</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" name="email" placeholder="Enter Email" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <div class="password-wrapper">
                        <input type="password" id="password" name="password" placeholder="Enter Password" required>
                        <i class="fa-solid fa-eye eye-icon" onclick="togglePassword('password', this)"></i>
                    </div>
                </div>
                <div id="error-msg" class="error"></div>
                
                <button type="submit" class="btn-primary">
                    <i class="fa-solid fa-right-to-bracket"></i> LOGIN
                </button>
                
                <div style="text-align:center; margin-top:20px;">
                    <a href="register.jsp" style="color:var(--primary); font-weight:bold; text-decoration: none;">
                        Don't have an account? <span style="text-decoration: underline;">Register</span>
                    </a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>