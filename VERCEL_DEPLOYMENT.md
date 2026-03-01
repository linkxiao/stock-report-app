# Vercel 免费部署指南

## 🌟 为什么选择Vercel？

- **完全免费**：个人项目免费使用，无流量限制
- **自动HTTPS**：自动配置SSL证书
- **全球CDN**：全球边缘节点，访问速度快
- **自动部署**：GitHub推送后自动部署
- **简单易用**：无需服务器配置经验

## 🚀 快速部署步骤

### 步骤1：创建GitHub仓库

1. 访问 [GitHub.com](https://github.com) 并登录
2. 点击右上角 "+" → "New repository"
3. 填写仓库信息：
   - Repository name: `stock-report-app`
   - Description: `港美股财报分析应用`
   - 选择 Public（公开）
   - 勾选 "Add a README file"

### 步骤2：上传代码到GitHub

```bash
# 进入项目目录
cd mao-poster

# 初始化Git仓库
git init
git add .
git commit -m "初始提交：港美股财报分析应用"

# 添加远程仓库
git remote add origin https://github.com/你的用户名/stock-report-app.git

# 推送代码
git branch -M main
git push -u origin main
```

### 步骤3：部署到Vercel

1. 访问 [Vercel.com](https://vercel.com)
2. 使用GitHub账号登录
3. 点击 "Import Project"
4. 选择刚创建的 `stock-report-app` 仓库
5. 配置部署设置：
   - **Framework Preset**: Other
   - **Root Directory**: ./
   - **Build Command**: (留空)
   - **Output Directory**: (留空)
   - **Install Command**: npm install
6. 点击 "Deploy"

### 步骤4：获取访问地址

部署完成后，Vercel会提供：
- **主域名**: `https://stock-report-app.vercel.app`
- **自定义域名**: 可绑定自己的域名

## 📱 应用访问地址

部署成功后，可以通过以下地址访问：

- **主页**: `https://stock-report-app.vercel.app/`
- **财报分析**: `https://stock-report-app.vercel.app/stock-report`
- **API信息**: `https://stock-report-app.vercel.app/api/info`
- **健康检查**: `https://stock-report-app.vercel.app/health`

## 🔧 技术配置说明

### Vercel配置 (vercel.json)
```json
{
  "version": 2,
  "builds": [
    {
      "src": "server.js",
      "use": "@vercel/node"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/server.js"
    }
  ]
}
```

### 环境变量
Vercel会自动设置：
- `NODE_ENV=production`
- `PORT=3000`（Vercel自动分配）

## 💡 部署提示

### 自动部署
- 每次向GitHub推送代码，Vercel会自动重新部署
- 支持预览部署（Pull Request时自动部署预览版本）

### 自定义域名
1. 在Vercel项目设置中点击 "Domains"
2. 添加自定义域名
3. 按照指引配置DNS记录

### 监控和日志
- Vercel提供实时访问日志
- 可查看部署状态和错误信息
- 支持性能监控

## 🛠️ 故障排除

### 常见问题

**部署失败**
- 检查 `package.json` 中的依赖是否正确
- 确认 `server.js` 文件存在且语法正确

**访问404**
- 检查路由配置是否正确
- 确认静态文件路径正确

**性能问题**
- Vercel有冷启动时间，首次访问可能较慢
- 后续访问会缓存，速度很快

### 联系支持
- Vercel官方文档: https://vercel.com/docs
- GitHub Issues: 在仓库中提交问题

## 📊 免费额度

Vercel免费套餐包含：
- 无限项目数量
- 100GB带宽/月
- 无限部署次数
- 自动HTTPS和CDN

## 🌟 成功部署后的验证

1. 访问健康检查接口确认服务正常
2. 测试所有页面功能
3. 在不同设备上测试响应式设计
4. 分享链接给他人测试访问

---

**部署完成时间**: 2026-03-01  
**技术支持**: 如有问题可参考Vercel官方文档