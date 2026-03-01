# GitHub仓库设置指南

## 🚀 快速获取可分享URL的步骤

### 步骤1：创建GitHub仓库（2分钟）

1. **访问 GitHub.com** 并登录您的账户
2. **点击右上角 "+" → "New repository"**
3. **填写仓库信息**：
   - Repository name: `stock-report-app`（推荐）
   - Description: `港美股财报分析应用`
   - 选择 **Public**（公开仓库）
   - **不要**勾选 "Add a README file"（我们已有文件）
   - **不要**勾选 "Add .gitignore"（我们已有）
4. **点击 "Create repository"**

### 步骤2：连接本地仓库（1分钟）

运行以下命令连接GitHub：

```bash
# 设置远程仓库（替换 YOUR_USERNAME 为您的GitHub用户名）
git remote add origin https://github.com/YOUR_USERNAME/stock-report-app.git

# 推送代码
git branch -M main
git push -u origin main
```

### 步骤3：Vercel部署（3分钟）

1. **访问 Vercel.com**
2. **使用GitHub账号登录**
3. **点击 "Import Project"**
4. **选择刚创建的 `stock-report-app` 仓库**
5. **部署设置保持默认**（框架选择Other）
6. **点击 "Deploy"**

## 🌐 可分享URL格式

部署成功后，您的应用将获得以下URL：

**主域名**: `https://stock-report-app.vercel.app`

**具体页面**：
- 📊 **财报分析**: `https://stock-report-app.vercel.app/stock-report`
- 📖 **语录应用**: `https://stock-report-app.vercel.app/`
- 🔧 **API信息**: `https://stock-report-app.vercel.app/api/info`

## 💡 快速命令参考

### 完整部署流程（复制粘贴执行）：

```bash
# 1. 设置远程仓库（替换为您的用户名）
git remote add origin https://github.com/您的用户名/stock-report-app.git

# 2. 推送代码
git push -u origin main

# 3. 访问Vercel完成部署
echo "现在请访问: https://vercel.com 完成最后一步部署"
```

### 检查当前Git状态：
```bash
git remote -v  # 查看远程仓库配置
git status     # 查看文件状态
```

## 🎯 部署成功验证

部署完成后，请测试以下链接：

1. **健康检查**: `https://stock-report-app.vercel.app/health`
2. **移动端测试**: 在手机上访问确认响应式设计
3. **功能测试**: 确认美股/港股切换正常

## 🔄 后续更新

如需更新应用，只需：

```bash
git add .
git commit -m "更新描述"
git push origin main
```

Vercel会自动重新部署！

## 📞 技术支持

如遇问题：
- 检查GitHub仓库是否创建成功
- 确认远程仓库URL是否正确
- 查看Vercel部署日志

---

**预计部署时间**: 5-10分钟  
**免费额度**: 无限流量和部署次数