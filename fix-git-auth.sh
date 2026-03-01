#!/bin/bash

# Git认证修复脚本 - 解决innocence-anima账号冲突问题

echo "🔧 修复Git认证问题..."
echo "=========================="

# 1. 清除所有Git凭据缓存
echo "🗑️  清除Git凭据缓存..."
git config --global --unset credential.helper
git credential-cache exit 2>/dev/null || true

# 2. 检查当前Git配置
echo "📋 当前Git配置:"
git config --list | grep -E "(user\.|remote\.)"

# 3. 重新配置远程仓库（使用HTTPS）
echo "🔄 重新配置远程仓库..."
git remote remove origin
git remote add origin https://github.com/linkxiao/stock-report-app.git

# 4. 验证远程配置
echo "✅ 远程仓库配置:"
git remote -v

# 5. 创建临时认证脚本
cat > /tmp/git-auth-helper.sh << 'EOF'
#!/bin/bash
echo "protocol=https"
echo "host=github.com"
echo "username=linkxiao"
echo "password=$GITHUB_TOKEN"
EOF

chmod +x /tmp/git-auth-helper.sh

# 6. 设置临时凭据助手
git config --global credential.helper "/tmp/git-auth-helper.sh"

echo ""
echo "🎯 下一步操作:"
echo "1. 请设置环境变量 GITHUB_TOKEN"
echo "2. 运行推送命令: git push -u origin main"
echo ""
echo "💡 获取GITHUB_TOKEN的方法:"
echo "   访问: https://github.com/settings/tokens"
echo "   创建新的个人访问令牌(PAT)"
echo "   权限选择: repo (完全控制私有仓库)"
echo ""
echo "📝 设置环境变量示例:"
echo "   export GITHUB_TOKEN=ghp_your_token_here"
echo "   git push -u origin main"