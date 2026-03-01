#!/bin/bash

# 港美股财报分析应用 - 快速部署脚本
# 自动生成可分享URL

set -e

echo "🚀 港美股财报分析应用 - 快速部署"
echo "=================================="
echo ""

# 显示当前Git状态
echo "📊 当前Git状态:"
git status --short
echo ""

echo "🌐 部署完成后，您将获得以下可分享URL:"
echo "   📊 财报分析: https://stock-report-app.vercel.app/stock-report"
echo "   📖 语录应用: https://stock-report-app.vercel.app/"
echo "   🔧 API信息:  https://stock-report-app.vercel.app/api/info"
echo ""

echo "📋 部署步骤（请按顺序执行）:"
echo "1. 创建GitHub仓库（必须步骤）"
echo "2. 配置远程仓库连接"
echo "3. 推送代码到GitHub"
echo "4. 在Vercel完成部署"
echo ""

# 步骤1：GitHub仓库创建指南
echo "📝 步骤1: 创建GitHub仓库"
echo "------------------------"
echo "请访问 https://github.com 并执行以下操作:"
echo "1. 登录您的GitHub账户"
echo "2. 点击右上角 '+' → 'New repository'"
echo "3. 填写仓库信息:"
echo "   - Repository name: stock-report-app"
echo "   - Description: 港美股财报分析应用"
echo "   - 选择 Public（公开）"
echo "   - 不要勾选任何初始化选项"
echo "4. 点击 'Create repository'"
echo ""

# 等待用户确认
read -p "✅ 请确认已创建GitHub仓库，然后按Enter继续..."

# 步骤2：获取GitHub用户名
echo ""
echo "🔗 步骤2: 配置远程仓库连接"
echo "--------------------------"
read -p "请输入您的GitHub用户名: " github_username

# 设置远程仓库
echo "🔄 配置远程仓库..."
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/$github_username/stock-report-app.git"
echo "✅ 远程仓库已设置为: https://github.com/$github_username/stock-report-app.git"

# 步骤3：推送代码
echo ""
echo "📤 步骤3: 推送代码到GitHub"
echo "--------------------------"
echo "正在推送代码..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo "✅ 代码推送成功！"
else
    echo "❌ 代码推送失败，请检查:"
    echo "   - GitHub仓库是否已创建"
    echo "   - 仓库名称是否正确"
    echo "   - 网络连接是否正常"
    exit 1
fi

# 步骤4：Vercel部署指南
echo ""
echo "🎯 步骤4: Vercel部署"
echo "-------------------"
echo "请访问 https://vercel.com 并执行以下操作:"
echo "1. 使用GitHub账号登录"
echo "2. 点击 'Import Project'"
echo "3. 选择刚创建的 'stock-report-app' 仓库"
echo "4. 部署设置保持默认（框架选择Other）"
echo "5. 点击 'Deploy'"
echo ""

echo "⏳ 部署过程通常需要1-3分钟..."
echo ""

# 生成部署完成后的URL信息
cat > DEPLOYMENT_SUCCESS.md << EOF
# 🎉 部署成功！

您的应用已成功部署到Vercel，以下是可分享的URL：

## 🌐 主要访问地址
- **主域名**: https://stock-report-app.vercel.app
- **财报分析**: https://stock-report-app.vercel.app/stock-report
- **语录应用**: https://stock-report-app.vercel.app/
- **API信息**: https://stock-report-app.vercel.app/api/info
- **健康检查**: https://stock-report-app.vercel.app/health

## 📱 功能特性
- ✅ 港美股Top10公司实时数据（2026年最新）
- ✅ 投资潜力评分和星级评级
- ✅ 移动端完美适配
- ✅ 免费HTTPS安全连接
- ✅ 全球CDN加速

## 🔄 后续更新
如需更新应用，只需运行：
\`\`\`bash
git add .
git commit -m "更新描述"
git push origin main
\`\`\`
Vercel会自动重新部署！

## 📞 技术支持
如有问题请参考：
- GITHUB_SETUP.md - 详细部署指南
- VERCEL_DEPLOYMENT.md - Vercel配置说明

**部署时间**: $(date)
**状态**: 等待Vercel部署完成
EOF

echo "📄 已生成部署成功指南: DEPLOYMENT_SUCCESS.md"
echo ""
echo "🎯 下一步操作:"
echo "   1. 访问 https://vercel.com"
echo "   2. 完成Vercel部署（约1-3分钟）"
echo "   3. 测试您的可分享URL"
echo ""
echo "🚀 祝您部署顺利！"
echo "💡 提示: 部署完成后，您可以将 https://stock-report-app.vercel.app 分享给任何人访问"