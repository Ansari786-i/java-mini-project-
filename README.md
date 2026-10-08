# SkillBridge — Student Skill Exchange Platform (Unified Fullstack)

A complete, production-ready, fullstack peer-to-peer student skill swapping and networking platform.

---

## 🌟 Architecture Overview

This project has been unified into a single, cohesive fullstack application:

```
SkillBridge-Unified/
├── public/                 # Frontend Web Application (HTML, CSS, Vanilla JS SPA)
│   ├── index.html          # Main Application View & Modals
│   ├── css/
│   │   └── style.css       # Complete UI Stylesheet
│   └── js/
│       ├── api.js          # REST Client (Fetch wrapper, Token handling)
│       ├── app.js          # Application State & DOM Rendering
│       ├── data.js         # Fallback data definitions
│       └── storage.js      # LocalStorage helpers
├── src/                    # Backend API (Node.js + Express + MySQL)
│   ├── config/             # MySQL connection pool
│   ├── controllers/        # REST Controllers (Auth, Users, Skills, Requests, Connections)
│   ├── middleware/         # JWT verification, Validation, Error handlers
│   ├── routes/             # Express API routing endpoints
│   ├── scripts/            # Database migration (schema.sql runner) & seeders
│   ├── services/           # Skill match algorithm (60% learn + 40% teach coverage)
│   ├── utils/              # Standard JSON response formatting
│   └── app.js              # Express app setup & static file serving
├── .env                    # Environment variables (DB credentials, JWT secrets, Port)
├── .env.example            # Environment template
├── package.json            # Node.js project manifest & scripts
├── schema.sql              # MySQL Database Schema DDL (10 normalized tables)
├── server.js               # Unified server entry point
├── start.bat               # 1-Click Windows launcher for the server
└── setup_db.bat            # 1-Click Database setup and seeder
```

---

## 🚀 Quick Start Guide

### Prerequisites
1. **Node.js** (v18.x or newer): [Download Node.js](https://nodejs.org/)
2. **MySQL Server** (v8.0+ or 26.x) running locally

---

### Step 1: Configure Environment Variables
Review or edit `.env` in the root directory:
```ini
PORT=5000
NODE_ENV=development

# MySQL Database Details
DB_HOST=127.0.0.1
DB_PORT=3307
DB_USER=root
DB_PASSWORD=mysql@251704
DB_NAME=skillbridge

# JWT Authentication
JWT_SECRET=super_secret_skillbridge_jwt_key_2026_xyz
JWT_EXPIRES_IN=7d
```
*(Adjust `DB_PORT`, `DB_USER`, and `DB_PASSWORD` to match your local MySQL configuration if different).*

---

### Step 2: Install Dependencies
Run the following in the project root:
```bash
npm install
```

---

### Step 3: Initialize and Seed Database
Run schema creation and seed with realistic student test accounts:
```bash
# Windows 1-Click:
double-click setup_db.bat

# Or via Command Line:
npm run migrate
npm run seed
```

---

### Step 4: Run the Application
Start the unified fullstack server:
```bash
# Windows 1-Click:
double-click start.bat

# Or via Command Line:
npm start
```

Open your browser and navigate to:
👉 **[http://localhost:5000](http://localhost:5000)**

Both the frontend UI and the REST API (`/api/*`) are hosted together on port `5000` with no CORS issues and zero separate terminals needed!

---

## 👥 Demo Presentation Accounts

All seeded demo accounts use the standard password:
**`Password123`**

| Name | Email | Primary Major | Offered Skills |
| :--- | :--- | :--- | :--- |
| **Aarav Sharma** | `aarav.sharma@campus.edu` | Computer Science | Python, Web Development, Machine Learning |
| **Riya Patel** | `riya.patel@campus.edu` | Design & HCI | UI/UX Design, Figma, Graphic Design |
| **Aditya Khan** | `aditya.khan@campus.edu` | Data Science | Data Analysis, SQL, Statistics |
| **Ananya Mehta** | `ananya.mehta@campus.edu` | Business & Mktg | Public Speaking, Presentation Skills |

*(The login modal includes 1-click quick login buttons to seamlessly sign in as any of these accounts during presentations).*

---

## 🛠️ Key Features
- **Normalized Relational Schema**: 10 tables with foreign key constraints, indexes, and cascading deletes (`users`, `skills`, `categories`, `user_offered_skills`, `user_wanted_skills`, `requests`, `connections`, `favorites`, `notifications`, `messages`).
- **Two-Way Skill Matching Engine**: Calculates mutual match percentages using a weighted formula (60% learning interest overlap + 40% teaching capability overlap).
- **Security**: Password hashing with `bcryptjs`, JWT bearer authentication, Helmet headers, and IP rate limiting on authentication routes.
- **Unified Hosting**: The Express server acts as both the REST API backend and the static web host for the single-page application frontend.
