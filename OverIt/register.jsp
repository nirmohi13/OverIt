<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OverIt Register</title>
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
        function validateRegisterForm() {
            let isValid = true;
            const email = document.forms["registerForm"]["email"].value;
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirm_password").value;
            const emailError = document.getElementById("email-error");
            const passwordError = document.getElementById("password-error");
            const confirmPasswordError = document.getElementById("confirm-password-error");
            
            passwordError.style.display = "none";
            if (confirmPasswordError) confirmPasswordError.style.display = "none";

            const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.(com|in)$/;
            if (!emailPattern.test(email)) {
                emailError.innerText = "Please enter valid email ending in .com or .in.";
                emailError.style.display = "block";
                isValid = false;
            } else {
                emailError.style.display = "none";
            }
            
            if (password.length < 8) {
                passwordError.innerText = "Password must be at least 8 characters long.";
                passwordError.style.display = "block";
                isValid = false;
            } else if (!/[A-Z]/.test(password)) {
                passwordError.innerText = "Password must include at least one uppercase character.";
                passwordError.style.display = "block";
                isValid = false;
            } else if (!/[a-z]/.test(password)) {
                passwordError.innerText = "Password must include at least one lowercase character.";
                passwordError.style.display = "block";
                isValid = false;
            } else if (!/[\W_]/.test(password)) {
                passwordError.innerText = "Password must include at least one special character.";
                passwordError.style.display = "block";
                isValid = false;
            }

            if (password !== confirmPassword) {
                confirmPasswordError.innerText = "Passwords do not match.";
                confirmPasswordError.style.display = "block";
                isValid = false;
            }
            return isValid;
        }
    </script>
</head>
<body>
    <div class="halftone-bg"></div>
    <i class="fa-solid fa-star comic-doodle" style="bottom: 10%; left: 15%; font-size: 10rem;"></i>
    <div class="bg-blob blob-1 animate-float"></div>
    <div class="bg-blob blob-2 animate-float" style="animation-delay: 2s;"></div>

    <nav class="navbar">
        <a href="index.jsp" class="navbar-brand">
            <i class="fa-solid fa-bolt"></i> OverIt
        </a>
        <div class="navbar-nav">
            <a href="index.jsp" class="nav-btn"><i class="fa-solid fa-house"></i> Home</a>
            <a href="login.jsp" class="btn-primary" style="padding: 8px 20px; width: auto; font-size: 16px;">Login</a>
        </div>
    </nav>

    <% if("failed".equals(request.getParameter("error"))) { %>
        <div id="errorPopup" class="comic-alert bounce-in">
            <i class="fa-solid fa-triangle-exclamation"></i> <strong>Oops!</strong> Registration failed. Please check your details and try again.
            <button onclick="document.getElementById('errorPopup').style.display='none'"><i class="fa-solid fa-xmark"></i></button>
        </div>
    <% } %>

    <div style="display: flex; justify-content: center; align-items: center; min-height: 80vh; padding: 20px;">
        <div class="glass-card fade-in" style="width: 450px;">
            <h2 class="title-primary">Join OverIt</h2>
            <form name="registerForm" action="register" method="post" onsubmit="return validateRegisterForm()">
                <div class="form-group">
                    <label>Select Role</label>
                    <select name="role" required>
                        <option value="">Choose...</option>
                        <option value="student">Student</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="name" placeholder="Full Name" required>
                </div>
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" name="email" placeholder="Email" required>
                    <div id="email-error" class="error"></div>
                </div>
                <div class="form-group">
                    <label>New Password</label>
                    <div class="password-wrapper">
                        <input type="password" id="password" name="password" placeholder="New Password" required>
                        <i class="fa-solid fa-eye eye-icon" onclick="togglePassword('password', this)"></i>
                    </div>
                    <div id="password-error" class="error"></div>
                </div>
                <div class="form-group">
                    <label>Re-enter Password</label>
                    <div class="password-wrapper">
                        <input type="password" id="confirm_password" name="confirm_password" placeholder="Re-enter Password" required>
                        <i class="fa-solid fa-eye eye-icon" onclick="togglePassword('confirm_password', this)"></i>
                    </div>
                    <div id="confirm-password-error" class="error"></div>
                </div>
                <div class="form-group">
                    <label>Department</label>
                    <input type="text" name="department" value="MCA" required>
                </div>
                
                <button type="submit" class="btn-primary">
                    <i class="fa-solid fa-user-plus"></i> REGISTER
                </button>
                
                <div style="text-align:center; margin-top:20px;">
                    <a href="login.jsp" style="color:var(--primary); font-weight:bold; text-decoration: none;">
                        Already have an account? <span style="text-decoration: underline;">Login</span>
                    </a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>