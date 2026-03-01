FROM node:18-alpine

WORKDIR /app

# 复制package.json并安装依赖
COPY package*.json ./
RUN npm install --production

# 复制应用文件
COPY . .

# 暴露端口
EXPOSE 3000

# 启动应用
CMD ["npm", "start"]