#!/bin/bash

# 港美股财报分析应用 - 一键部署脚本
# 作者: Stock Analysis Team
# 日期: 2026-03-01

set -e  # 遇到错误立即退出

echo "🚀 开始部署港美股财报分析应用..."

# 检查Node.js是否安装
if ! command -v node &> /dev/null; then
    echo "❌ Node.js未安装，请先安装Node.js"
    exit 1
fi

echo "✅ Node.js版本: $(node --version)"

# 检查npm是否安装
if ! command -v npm &> /dev/null; then
    echo "❌ npm未安装，请先安装npm"
    exit 1
fi

echo "✅ npm版本: $(npm --version)"

# 安装依赖
echo "📦 正在安装依赖..."
npm install

# 检查依赖安装是否成功
if [ $? -eq 0 ]; then
    echo "✅ 依赖安装成功"
else
    echo "❌ 依赖安装失败"
    exit 1
fi

# 创建启动脚本
cat > start-app.sh << 'EOF'
#!/bin/bash
echo "🚀 启动港美股财报分析应用..."
npm start
EOF

chmod +x start-app.sh

# 创建停止脚本
cat > stop-app.sh << 'EOF'
#!/bin/bash
echo "🛑 停止港美股财报分析应用..."
pkill -f "node server.js" || true
EOF

chmod +x stop-app.sh

# 创建重启脚本
cat > restart-app.sh << 'EOF'
#!/bin/bash
echo "🔄 重启港美股财报分析应用..."
pkill -f "node server.js" || true
sleep 2
npm start
EOF

chmod +x restart-app.sh

echo ""
echo "🎉 部署完成！"
echo ""
echo "📋 可用命令:"
echo "   ./start-app.sh    - 启动应用"
echo "   ./stop-app.sh     - 停止应用" 
echo "   ./restart-app.sh  - 重启应用"
echo "   npm start         - 直接启动"
echo ""
echo "🌐 访问地址:"
echo "   本地访问: http://localhost:3000"
echo "   外网访问: http://你的服务器IP:3000"
echo ""
echo "📊 应用端点:"
echo "   - 主页: http://localhost:3000/"
echo "   - 财报分析: http://localhost:3000/stock-report"
echo "   - API信息: http://localhost:3000/api/info"
echo "   - 健康检查: http://localhost:3000/health"
echo ""
echo "💡 提示:"
echo "   - 确保防火墙已开放3000端口"
echo "   - 生产环境建议使用PM2管理进程"
echo "   - 详细部署说明请查看 DEPLOYMENT.md"
echo ""

# 询问是否立即启动应用
read -p "是否立即启动应用？(y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🚀 正在启动应用..."
    npm start
fi