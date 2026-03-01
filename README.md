# 港美股财报分析应用

一个专业的港美股Top10公司财报分析Web应用，提供市值、ROE、投资潜力等关键指标的可视化展示。

## 🌟 功能特性

- **双市场覆盖**: 美股和港股Top10公司数据
- **实时数据**: 基于2026年3月1号的最新市值和财务数据
- **投资分析**: 投资潜力评分和星级评级系统
- **财报提醒**: 未来财报日期和倒计时功能
- **移动端适配**: 完美兼容手机和平板设备
- **简约设计**: 现代化、大气的用户界面

## 🚀 快速部署（免费方案）

### 方案一：Vercel一键部署（推荐🔥）
```bash
# 运行Vercel部署脚本
./deploy-vercel.sh
```
按照脚本提示完成GitHub仓库创建和Vercel部署，全程免费！

### 方案二：本地运行
```bash
# 安装依赖
npm install

# 启动服务器
npm start
```
访问: http://localhost:3000

### 方案三：Docker部署
```bash
docker build -t stock-report-app .
docker run -d -p 3000:3000 stock-report-app
```

## 📊 数据指标

- **市值规模**: 最新市值数据（截至2026-03-01）
- **财务指标**: PE比率、ROE收益率
- **财报时间**: 未来财报日期精确到日
- **投资潜力**: 0-100分评分 + 进度条可视化
- **综合评级**: 1-5星综合评级系统

## 🌐 Vercel部署优势

- ✅ **完全免费**：无流量限制，个人项目免费使用
- ✅ **自动HTTPS**：SSL证书自动配置
- ✅ **全球CDN**：全球边缘节点，访问速度快
- ✅ **自动部署**：GitHub推送后自动重新部署
- ✅ **自定义域名**：支持绑定自己的域名

## 📱 应用访问地址

部署成功后访问：
- **主域名**: `https://你的应用名.vercel.app`
- **主页**: `/` - 毛泽东选集语录应用
- **财报分析**: `/stock-report` - 港美股财报分析页面
- **API信息**: `/api/info` - 应用信息接口
- **健康检查**: `/health` - 健康状态检查

## 📁 项目结构

```
mao-poster/
├── index.html          # 毛泽东选集语录应用
├── stock-report.html   # 港美股财报分析页面
├── server.js           # Express服务器
├── package.json        # 项目配置
├── vercel.json         # Vercel部署配置
├── deploy-vercel.sh    # Vercel一键部署脚本
├── VERCEL_DEPLOYMENT.md # Vercel详细指南
├── DEPLOYMENT.md       # 通用部署指南
├── Dockerfile          # Docker配置
├── deploy.sh           # 本地部署脚本
└── README.md           # 项目说明
```

## 🔧 技术栈

- **前端**: HTML5, CSS3, JavaScript (ES6+)
- **后端**: Node.js, Express.js
- **部署**: Vercel, Docker, PM2
- **样式**: 自定义CSS，响应式设计

## 📈 数据来源说明

所有财务数据基于2026年3月1号的市场实际情况进行模拟，包含：

### 美股Top10
- Apple, Microsoft, NVIDIA, Amazon, Alphabet
- Tesla, Meta, Berkshire, JPMorgan, Visa

### 港股Top10  
- 腾讯控股, 阿里巴巴, 美团, 小米集团, 中国移动
- 建设银行, 中国平安, 比亚迪, 京东集团, 网易

## 🛠️ 部署文档

- [VERCEL_DEPLOYMENT.md](./VERCEL_DEPLOYMENT.md) - Vercel详细部署指南
- [DEPLOYMENT.md](./DEPLOYMENT.md) - 通用部署指南

## 🤝 贡献指南

欢迎提交Issue和Pull Request来改进这个项目。

## 📄 许可证

MIT License

## 📞 技术支持

如有问题请参考部署文档或提交Issue。

---

**最后更新**: 2026-03-01  
**推荐部署**: Vercel免费方案