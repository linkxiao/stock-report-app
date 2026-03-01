# 港美股财报分析应用 - 部署指南

## 应用简介
这是一个基于HTML/CSS/JavaScript的港美股Top10公司财报分析应用，提供市值、ROE、投资潜力等关键指标的可视化展示。

## 部署方式

### 方式一：直接运行Node.js服务器

1. **安装依赖**
```bash
npm install
```

2. **启动服务器**
```bash
npm start
```

3. **访问应用**
- 本地访问: http://localhost:3000
- 外网访问: http://你的服务器IP:3000

### 方式二：使用Docker部署

1. **构建Docker镜像**
```bash
docker build -t stock-report-app .
```

2. **运行容器**
```bash
docker run -d -p 3000:3000 --name stock-app stock-report-app
```

3. **访问应用**
- 本地访问: http://localhost:3000
- 外网访问: http://你的服务器IP:3000

### 方式三：使用PM2进程管理（推荐生产环境）

1. **安装PM2**
```bash
npm install -g pm2
```

2. **使用PM2启动应用**
```bash
pm2 start server.js --name "stock-report-app"
```

3. **设置开机自启**
```bash
pm2 startup
pm2 save
```

### 方式四：部署到云平台

#### 部署到Vercel
1. 将代码推送到GitHub
2. 在Vercel中导入项目
3. 设置构建命令: `npm install && npm start`

#### 部署到Heroku
1. 创建Heroku应用
2. 设置环境变量: `PORT=3000`
3. 部署代码

## 服务器配置建议

### 系统要求
- Node.js 14+
- 内存: 512MB+
- 存储: 100MB+

### 安全配置
1. **防火墙设置**
```bash
# 开放3000端口
sudo ufw allow 3000
```

2. **使用Nginx反向代理（推荐）**
```nginx
server {
    listen 80;
    server_name your-domain.com;
    
    location / {
        proxy_pass http://localhost:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

3. **启用HTTPS**
```bash
# 使用Certbot获取SSL证书
sudo certbot --nginx -d your-domain.com
```

## 监控和维护

### 健康检查
应用提供健康检查接口：
```bash
curl http://localhost:3000/health
```

### 日志查看
```bash
# PM2日志
pm2 logs stock-report-app

# Docker日志
docker logs stock-app
```

## 应用端点

- **主页**: `/` - 毛泽东选集语录应用
- **财报分析**: `/stock-report` - 港美股财报分析页面
- **API信息**: `/api/info` - 应用信息接口
- **健康检查**: `/health` - 健康状态检查

## 故障排除

### 常见问题
1. **端口被占用**: 修改server.js中的PORT环境变量
2. **依赖安装失败**: 清除node_modules后重新安装
3. **外网无法访问**: 检查防火墙和服务器安全组设置

### 性能优化
- 启用Gzip压缩
- 配置静态文件缓存
- 使用CDN加速静态资源

## 更新和维护

### 代码更新
```bash
git pull origin main
npm install
pm2 restart stock-report-app
```

### 数据更新
直接编辑对应的HTML文件中的数据数组，然后重启应用。

---

**技术支持**: 如有问题请联系开发团队