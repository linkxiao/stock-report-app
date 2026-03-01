#!/bin/bash

# 港美股财报分析应用 - Vercel快速部署脚本
# 作者: Stock Analysis Team
# 日期: 2026-03-01

set -e  # 遇到错误立即退出

echo "🚀 Vercel免费部署助手"
echo "======================"

# 检查Git是否安装
if ! command -v git &> /dev/null; then
    echo "❌ Git未安装，请先安装Git"
    echo "   macOS: brew install git"
    echo "   Ubuntu: sudo apt install git"
    exit 1
fi

echo "✅ Git版本: $(git --version)"

# 检查Node.js是否安装
if ! command -v node &> /dev/null; then
    echo "❌ Node.js未安装，请先安装Node.js"
    echo "   下载地址: https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js版本: $(node --version)"
echo "✅ npm版本: $(npm --version)"

# 显示部署步骤
echo ""
echo "📋 部署步骤概览:"
echo "1. 创建GitHub仓库"
echo "2. 配置Git远程仓库"
echo "3. 推送代码到GitHub"
echo "4. 在Vercel部署"
echo ""

# 检查当前目录是否为Git仓库
if [ ! -d ".git" ]; then
    echo "📦 初始化Git仓库..."
    git init
    git add .
    git commit -m "初始提交：港美股财报分析应用"
    echo "✅ Git仓库初始化完成"
else
    echo "✅ Git仓库已存在"
fi

# 显示GitHub仓库创建指南
echo ""
echo "🌐 GitHub仓库创建指南"
echo "======================"
echo "1. 访问 https://github.com"
echo "2. 登录您的账户"
echo "3. 点击右上角 '+' → 'New repository'"
echo "4. 填写仓库信息："
echo "   - Repository name: stock-report-app"
echo "   - Description: 港美股财报分析应用"
echo "   - 选择 Public（公开）"
echo "   - 勾选 'Add a README file'"
echo "5. 点击 'Create repository'"
echo ""

# 获取GitHub用户名和仓库信息
read -p "请输入您的GitHub用户名: " github_username
read -p "请输入仓库名称（默认: stock-report-app）: " repo_name
repo_name=${repo_name:-stock-report-app}

# 配置远程仓库
echo ""
echo "🔗 配置远程仓库..."
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/$github_username/$repo_name.git"

echo "✅ 远程仓库配置为: https://github.com/$github_username/$repo_name.git"

# 推送代码
echo ""
echo "📤 推送代码到GitHub..."
git branch -M main
git push -u origin main

if [ $? -eq 0 ]; then
    echo "✅ 代码推送成功！"
else
    echo "❌ 代码推送失败，请检查："
    echo "   - GitHub仓库是否已创建"
    echo "   - 仓库名称是否正确"
    echo "   - 是否有推送权限"
    exit 1
fi

# Vercel部署指南
echo ""
echo "🎯 Vercel部署指南"
echo "=================="
echo "1. 访问 https://vercel.com"
echo "2. 使用GitHub账号登录"
echo "3. 点击 'Import Project'"
echo "4. 选择刚创建的 '$repo_name' 仓库"
echo "5. 配置部署设置："
echo "   - Framework Preset: Other"
echo "   - Root Directory: ./"
echo "   - Build Command: (留空)"
echo "   - Output Directory: (留空)"
echo "   - Install Command: npm install"
echo "6. 点击 'Deploy'"
echo ""

echo "🌐 部署完成后访问地址:"
echo "   - 主域名: https://$repo_name.vercel.app"
echo "   - 主页: https://$repo_name.vercel.app/"
echo "   - 财报分析: https://$repo_name.vercel.app/stock-report"
echo ""

echo "💡 提示:"
echo "   - Vercel部署通常需要1-3分钟"
echo "   - 首次访问可能有冷启动时间"
echo "   - 支持自定义域名绑定"
echo "   - 详细说明请查看 VERCEL_DEPLOYMENT.md"
echo ""

echo "🎉 部署流程已完成！现在请按照上述指南完成Vercel配置。"

# 创建快速访问文件
cat > DEPLOYMENT_URLS.md << EOF
# 应用访问地址

部署完成后，可以通过以下地址访问：

- 主域名: https://$repo_name.vercel.app
- 主页: https://$repo_name.vercel.app/
- 财报分析: https://$repo_name.vercel.app/stock-report
- API信息: https://$repo_name.vercel.app/api/info
- 健康检查: https://$repo_name.vercel.app/health

## 功能特性
- ✅ 港美股Top10公司数据
- ✅ 2026年最新市值和财务数据
- ✅ 投资潜力评分系统
- ✅ 移动端完美适配
- ✅ 免费HTTPS和CDN加速

## 技术支持
如有问题请参考：
- VERCEL_DEPLOYMENT.md - 详细部署指南
- README.md - 项目说明文档
EOF

echo "📄 已创建 DEPLOYMENT_URLS.md 文件，包含所有访问地址信息"
echo ""
echo "🚀 祝您部署顺利！"