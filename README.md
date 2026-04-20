# 🎓 Student Performance Analysis System

A full-stack web application for tracking, managing, and visualizing student academic performance — built with **Node.js**, **Express**, **MongoDB**, and a premium dark-theme **HTML/CSS/JS** frontend.

---

## ✨ Features

| Module | Description |
|---|---|
| 📊 **Dashboard** | Live KPI cards, subject bar chart, grade doughnut chart, top-5 performers table |
| 👨‍🎓 **Students** | Add / edit / delete students, search by name/roll no, filter by class & section |
| 📝 **Performance** | Log exam marks with live grade preview, filter by subject / exam type / semester |
| 📈 **Analytics** | Radar chart, pass/fail doughnut, full leaderboard, per-student drill-down |

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| **Frontend** | HTML5, CSS3 (Glass Morphism), Vanilla JS, Chart.js v4 |
| **Backend** | Node.js, Express.js |
| **Database** | MongoDB (Mongoose ODM) |
| **Dev Tools** | Nodemon, dotenv, Morgan, CORS |

---

## 📋 Prerequisites

Before running, ensure you have installed:

1. **Node.js** (v18+) — [nodejs.org](https://nodejs.org)
2. **MongoDB Community Server** (v6+) — [mongodb.com/try/download/community](https://www.mongodb.com/try/download/community)
   - MongoDB must be running locally on port `27017`

---

## 🚀 Quick Start

### First-Time Setup
```bat
setup.bat
```
This will:
- ✅ Check Node.js & npm are installed
- ✅ Install all npm dependencies
- ✅ Seed the database with 20 students & 720 performance records

### Daily Launch
```bat
start.bat
```
Opens the app at **http://localhost:5000** automatically.

---

## 📁 Project Structure

```
student-performance-system/
│
├── config/
│   └── db.js                # MongoDB connection
│
├── middleware/
│   └── errorHandler.js      # Global error handler
│
├── models/
│   ├── Student.js           # Student schema
│   ├── Subject.js           # Subject schema
│   └── Performance.js       # Performance schema (w/ grade virtual)
│
├── routes/
│   ├── students.js          # CRUD + search + pagination
│   ├── subjects.js          # Subject CRUD
│   ├── performance.js       # Performance CRUD + filter
│   └── analytics.js         # KPIs, charts, leaderboard
│
├── public/
│   ├── index.html           # Dashboard
│   ├── students.html        # Student management
│   ├── performance.html     # Performance entry
│   ├── analytics.html       # Analytics & charts
│   ├── css/
│   │   ├── style.css        # Dark theme, layout, animations
│   │   └── components.css   # Buttons, modals, badges, toasts
│   └── js/
│       ├── api.js           # Fetch wrapper, toast, helpers
│       ├── dashboard.js     # Dashboard logic
│       ├── students.js      # Students CRUD
│       ├── performance.js   # Performance CRUD
│       └── analytics.js     # Analytics charts
│
├── scripts/
│   └── seed.js              # Database seeder
│
├── .env                     # Environment variables
├── .gitignore
├── package.json
├── server.js                # Express app entry point
├── setup.bat                # 🔧 First-time setup
└── start.bat                # 🚀 Daily launcher
```

---

## ⚙️ Environment Variables

The `.env` file is pre-configured:

```env
MONGO_URI=mongodb://localhost:27017/student_performance
PORT=5000
NODE_ENV=development
```

To use MongoDB Atlas (cloud), replace `MONGO_URI` with your Atlas connection string.

---

## 📡 API Reference

### Students
| Method | Endpoint | Description |
|---|---|---|
| `GET` | `/api/students` | List all (`?search=&class=&section=&page=&limit=`) |
| `GET` | `/api/students/:id` | Get student + their performances |
| `POST` | `/api/students` | Create student |
| `PUT` | `/api/students/:id` | Update student |
| `DELETE` | `/api/students/:id` | Soft-delete student |

### Performance
| Method | Endpoint | Description |
|---|---|---|
| `GET` | `/api/performance` | All records (`?student=&subject=&examType=&semester=`) |
| `POST` | `/api/performance` | Log new record |
| `PUT` | `/api/performance/:id` | Update record |
| `DELETE` | `/api/performance/:id` | Delete record |

### Analytics
| Method | Endpoint | Description |
|---|---|---|
| `GET` | `/api/analytics/overview` | KPI stats (total, avg, pass rate, top performer) |
| `GET` | `/api/analytics/class-distribution` | Grade distribution (A+/A/B/C/D/F) |
| `GET` | `/api/analytics/subject-comparison` | Avg marks per subject |
| `GET` | `/api/analytics/top-performers` | Top 10 student leaderboard |
| `GET` | `/api/analytics/student/:id` | Per-student performance drill-down |

---

## 🎓 Grade Scale

| Grade | Percentage |
|---|---|
| **A+** | 90% – 100% |
| **A** | 80% – 89% |
| **B** | 70% – 79% |
| **C** | 60% – 69% |
| **D** | 50% – 59% |
| **F** | Below 50% |

---

## 🌱 Seeding Data

To reset and re-seed the database at any time:

```bash
npm run seed
```

Seeds: **20 students**, **6 subjects**, **720 performance records** across 2 semesters.

---

## 👨‍💻 Development

Run with auto-restart (nodemon):
```bash
npm run dev
```

---

## 📜 License

MIT — Made with ❤️ by Utkarsh


# to run this system open powershell(administrator)
1. net start MongoDB
2. cd"c:\Users\Utkarsh\OneDrive\Desktop\clg\student-performance-system"
3. npm run seed
4. node server.js
5. open bat file "start.bat"

# to stop this system open powershell(administrator)
1. net stop MongoDB
2. cd"c:\Users\Utkarsh\OneDrive\Desktop\clg\student-performance-system"
3. npm run seed
4. node server.js