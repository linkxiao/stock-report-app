const express = require('express');
const path = require('path');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3000;

// 启用CORS，允许外网访问
app.use(cors());

// 设置静态文件目录
app.use(express.static(path.join(__dirname)));

// 路由配置
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

app.get('/stock-report', (req, res) => {
    res.sendFile(path.join(__dirname, 'stock-report.html'));
});

// API接口 - 获取应用信息
app.get('/api/info', (req, res) => {
    res.json({
        name: '港美股财报分析应用',
        version: '1.0.0',
        description: '提供港美股Top10公司财报时间、市值、ROE等关键指标分析',
        endpoints: {
            homepage: '/',
            stockReport: '/stock-report',
            apiInfo: '/api/info'
        },
        lastUpdated: '2026-03-01'
    });
});

// 健康检查接口
app.get('/health', (req, res) => {
    res.json({ status: 'healthy', timestamp: new Date().toISOString() });
});

// 启动服务器
app.listen(PORT, '0.0.0.0', () => {
    console.log(`🚀 服务器已启动`);
    console.log(`📍 本地访问: http://localhost:${PORT}`);
    console.log(`📍 外网访问: http://你的服务器IP:${PORT}`);
    console.log(`📊 主页: http://localhost:${PORT}/`);
    console.log(`📈 财报分析: http://localhost:${PORT}/stock-report`);
    console.log(`🔍 API信息: http://localhost:${PORT}/api/info`);
    console.log(`❤️  健康检查: http://localhost:${PORT}/health`);
});

// 优雅关闭
process.on('SIGINT', () => {
    console.log('\n🛑 正在关闭服务器...');
    process.exit(0);
});