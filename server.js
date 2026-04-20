require('dotenv').config();
const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const path = require('path');
const connectDB = require('./config/db');
const errorHandler = require('./middleware/errorHandler');

// Connect to MongoDB
connectDB();

const app = express();

// Middleware
app.use(cors());
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// Serve static frontend files
app.use(express.static(path.join(__dirname, 'public')));

// API Routes
app.use('/api/students', require('./routes/students'));
app.use('/api/subjects', require('./routes/subjects'));
app.use('/api/performance', require('./routes/performance'));
app.use('/api/analytics', require('./routes/analytics'));

// Health check
app.get('/api', (req, res) => {
    res.json({
        success: true,
        message: '🎓 Student Performance Analysis API is running',
        version: '1.0.0',
        endpoints: [
            'GET /api/students',
            'POST /api/students',
            'GET /api/subjects',
            'POST /api/subjects',
            'GET /api/performance',
            'POST /api/performance',
            'GET /api/analytics/overview',
            'GET /api/analytics/class-distribution',
            'GET /api/analytics/subject-comparison',
            'GET /api/analytics/top-performers',
        ],
    });
});

// Serve frontend for all other routes (SPA fallback)
app.get('*', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Global Error Handler (must be last)
app.use(errorHandler);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`\n🚀 Server running in ${process.env.NODE_ENV} mode on port ${PORT}`);
    console.log(`🌐 Dashboard: http://localhost:${PORT}`);
    console.log(`📡 API Base:  http://localhost:${PORT}/api\n`);
});
