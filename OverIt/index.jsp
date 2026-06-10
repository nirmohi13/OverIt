<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OverIt - Student Burnout Detection & Wellness Analytics</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/style.css?v=2">
    <style>
        .hero {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            text-align: center;
            min-height: 80vh;
            padding: 20px;
            position: relative;
            z-index: 10;
        }
        .hero h1 {
            font-size: 5rem;
            color: var(--primary);
            font-family: var(--font-heading);
            margin-bottom: 20px;
            text-shadow: 4px 4px 0px var(--white);
        }
        .hero p {
            font-size: 1.5rem;
            max-width: 600px;
            margin-bottom: 40px;
            color: var(--text-dark);
            background: rgba(255,255,255,0.8);
            padding: 10px 20px;
            border-radius: 12px;
            border: 2px solid var(--primary);
        }
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
            padding: 50px 10%;
            max-width: 1200px;
            margin: 0 auto;
        }
        .feature-card {
            background: var(--white);
            border: 3px solid var(--primary);
            border-radius: var(--border-radius);
            padding: 30px;
            box-shadow: 8px 8px 0px var(--primary);
            text-align: center;
            transition: var(--transition);
        }
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 12px 12px 0px var(--primary);
        }
        .feature-card i {
            font-size: 3rem;
            color: var(--primary);
            margin-bottom: 15px;
        }
        .feature-card h3 {
            font-family: var(--font-heading);
            font-size: 1.5rem;
            margin-bottom: 10px;
        }
        .section-title {
            text-align: center;
            font-size: 3rem;
            color: var(--primary);
            font-family: var(--font-heading);
            margin: 60px 0 30px;
            text-transform: uppercase;
        }
        .about-section {
            background: var(--primary);
            color: var(--white);
            padding: 60px 20px;
            text-align: center;
        }
        .about-section h2 {
            font-family: var(--font-heading);
            font-size: 2.5rem;
            margin-bottom: 20px;
        }
        .about-section p {
            max-width: 800px;
            margin: 0 auto;
            font-size: 1.2rem;
            line-height: 1.6;
        }
    </style>
</head>
<body>
    <div class="halftone-bg"></div>
    <i class="fa-solid fa-burst comic-doodle" style="top: 15%; left: 5%;"></i>
    <i class="fa-solid fa-comment-dots comic-doodle" style="top: 60%; right: 10%; font-size: 10rem;"></i>
    <div class="bg-blob blob-1 animate-float"></div>
    <div class="bg-blob blob-2 animate-float" style="animation-delay: 2s;"></div>

    <nav class="navbar">
        <a href="index.jsp" class="navbar-brand">
            <i class="fa-solid fa-bolt"></i> OverIt
        </a>
        <div class="navbar-nav">
            <a href="login.jsp" class="nav-btn">Login</a>
            <a href="register.jsp" class="btn-primary" style="padding: 8px 20px; width: auto; font-size: 16px;">Sign Up</a>
        </div>
    </nav>

    <div class="hero fade-in">
        <h1>OverIt</h1>
        <p>Student Burnout Detection & Wellness Analytics</p>
        <a href="login.jsp" class="btn-primary" style="width: auto; padding: 15px 40px; font-size: 1.5rem; border: 3px solid var(--white);">
            Get Started <i class="fa-solid fa-arrow-right"></i>
        </a>
    </div>

    <h2 class="section-title fade-in">Features</h2>
    <div class="features-grid">
        <div class="feature-card fade-in">
            <i class="fa-solid fa-chart-pie"></i>
            <h3>Weekly Surveys</h3>
            <p>Log your sleep, stress, and study hours effortlessly to monitor your well-being.</p>
        </div>
        <div class="feature-card fade-in">
            <i class="fa-solid fa-heart-pulse"></i>
            <h3>Burnout Analytics</h3>
            <p>Get personalized risk assessments and wellness scores instantly.</p>
        </div>
        <div class="feature-card fade-in">
            <i class="fa-solid fa-lightbulb"></i>
            <h3>AI Insights</h3>
            <p>Receive actionable recommendations tailored specifically to your habits.</p>
        </div>
    </div>

    <div class="about-section">
        <h2>Why OverIt?</h2>
        <p>College is stressful. We get it. OverIt is designed to give you the data you need to balance academics and mental health. Track your trends, catch burnout before it hits, and prioritize your wellness in a fun, retro-modern platform designed for Gen Z.</p>
    </div>

    <footer style="text-align: center; padding: 20px; font-weight: 600;">
        &copy; 2026 OverIt. All rights reserved.
    </footer>
</body>
</html>