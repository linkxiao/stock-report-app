# 🔑 GitHub个人访问令牌(PAT)获取指南

## 🚨 问题说明
当前Git推送遇到权限问题，需要创建个人访问令牌来安全地推送代码。

## 📋 获取个人访问令牌的步骤

### 步骤1：访问GitHub设置
1. 登录 [GitHub.com](https://github.com)
2. 点击右上角头像 → **Settings**
3. 左侧菜单选择 **Developer settings**
4. 选择 **Personal access tokens** → **Tokens (classic)**

### 步骤2：创建新令牌
1. 点击 **Generate new token** → **Generate new token (classic)**
2. 填写令牌信息：
   - **Note**: `stock-report-app-deployment`
   - **Expiration**: 选择90天或自定义
   - **Scopes**: 勾选以下权限：
     - ✅ `repo` (完全控制私有仓库)
     - ✅ `workflow` (可选，用于CI/CD)

### 步骤3：复制令牌
1. 点击 **Generate token**
2. **立即复制令牌**（令牌只显示一次！）
3. 安全保存令牌

## 🔧 使用令牌推送代码

### 方法一：临时使用（推荐）
```bash
# 在推送时使用令牌（替换 YOUR_TOKEN 为实际令牌）
git push https://YOUR_TOKEN@github.com/linkxiao/stock-report-app.git main
```

### 方法二：配置为远程仓库
```bash
# 更新远程仓库URL包含令牌
git remote set-url origin https://YOUR_TOKEN@github.com/linkxiao/stock-report-app.git

# 然后正常推送
git push -u origin main
```

## 🛡️ 安全注意事项

- **不要将令牌提交到代码中**
- **令牌具有完全仓库访问权限，请妥善保管**
- **建议设置较短的过期时间**
- **使用后可从GitHub设置中撤销**

## 🎯 快速命令参考

获取令牌后，运行以下命令完成部署：

```bash
# 替换 YOUR_ACTUAL_TOKEN 为你的真实令牌
TOKEN="your_actual_token_here"
git push https://${TOKEN}@github.com/linkxiao/stock-report-app.git main
```

## 📞 故障排除

如果仍然遇到问题：
1. 确认GitHub仓库 `linkxiao/stock-report-app` 已创建
2. 确认令牌权限包含 `repo` 范围
3. 尝试清除Git凭据缓存：
   ```bash
   git credential-cache exit
   ```

## ✅ 成功标志
推送成功后，你将看到类似输出：
```
Enumerating objects: X, done.
Counting objects: 100% (X/X), done.
Writing objects: 100% (X/X), X KiB | X KiB/s, done.
Total X (delta X), reused 0 (delta 0), pack-reused 0
To https://github.com/linkxiao/stock-report-app.git
 * [new branch]      main -> main
Branch 'main' set up to track remote branch 'main' from 'origin'.
```

完成此步骤后，即可继续Vercel部署获取可分享URL！